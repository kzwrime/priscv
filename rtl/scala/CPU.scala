package sriscv

import chisel3._
import chisel3.util._

class CPU extends Module {
  val io = IO(new Bundle {
    val imem = Flipped(new IMemPortIO)
    val dmem = Flipped(new DMemPortIO)
  })

  // Bundles defining the pipeline regs and control structures

  // Everything in the register between IF and ID stages
  class IFIDBundle extends Bundle {
    val instr    = UInt(32.W)
    val pc       = UInt(32.W)
    val pcPlus4  = UInt(32.W)
  }

  // Control signals used in EX stage
  class EXControl extends Bundle {
    val itype        = Bool()
    val aluCtrlOp    = UInt(2.W)
    val resultSel    = UInt(2.W)
    val aluSrc       = Bool()
    val pcAdd        = Bool()
    val branch       = Bool() 
    val jump         = UInt(2.W)
    // val pcfromalu    = Bool()
  }

  // Control signals used in MEM stage
  class MControl extends Bundle {
    val memRead  = Bool()
    val memWrite = Bool()
    val taken    = Bool()
    val maskMode = UInt(2.W)
    val sext     = Bool()
  }

  // Control signals used in WB stage
  class WBControl extends Bundle {
    val toReg     = UInt(1.W)
    val regWrite  = Bool()
  }

  // Data of the the register between ID and EX stages
  class IDEXBundle extends Bundle {
    val regWAddr    = UInt(5.W)
    val funct7      = UInt(7.W)
    val funct3      = UInt(3.W)
    val imm         = UInt(32.W)
    val regRData2   = UInt(32.W)
    val regRData1   = UInt(32.W)
    val pc          = UInt(32.W)
    val pcPlus4     = UInt(32.W)
    val rs1         = UInt(5.W)    //pipelined only
    val rs2         = UInt(5.W)    //pipelined only
  }

  // Control block of the IDEX register
  class IDEXControl extends Bundle {
    val ex_ctrl  = new EXControl
    val mem_ctrl = new MControl
    val wb_ctrl  = new WBControl
  }

  // Everything in the register between EX and MEM stages
  class EXMEMBundle extends Bundle {
    val regWAddr   = UInt(5.W)
    val regRData2  = UInt(32.W)
    val result     = UInt(32.W)
    val nextpc     = UInt(32.W)
    val pc         = UInt(32.W) // TODO just for simulate
  }

  // Control block of the EXMEM register
  class EXMEMControl extends Bundle {
    val mem_ctrl  = new MControl
    val wb_ctrl   = new WBControl
  }

  // Everything in the register between MEM and WB stages
  class MEMWBBundle extends Bundle {
    val regWAddr   = UInt(5.W)
    val result     = UInt(32.W)
    val readData   = UInt(32.W)
    val pc         = UInt(32.W) // TODO just for simulate
  }

  // Control block of the MEMWB register
  class MEMWBControl extends Bundle {
    val wb_ctrl = new WBControl
  }

  // All of the structures required
  val pc         = RegInit(0.U)
  val decode     = Module(new Decode())
  val regs       = Module(new RegFile())
  val aluControl = Module(new ALUCtrl())
  val alu        = Module(new ALU())
  val pcPlus4    = Module(new Adder())
  val branchAdd  = Module(new Adder())
  val forwarding = Module(new ForwardingUnit())  //pipelined only
  val hazard     = Module(new HazardUnit())      //pipelined only
  val predicter  = Module(new Predicter)
  val (cycleCount, _) = Counter(true.B, 1 << 30)

  regs.io.reset   := reset;
  regs.io.clk     := clock;
  // The four pipeline regs
  val if_id       = Module(new StageReg(new IFIDBundle))

  val id_ex       = Module(new StageReg(new IDEXBundle))
  val id_ex_ctrl  = Module(new StageReg(new IDEXControl))

  val ex_mem      = Module(new StageReg(new EXMEMBundle))
  val ex_mem_ctrl = Module(new StageReg(new EXMEMControl))

  val mem_wb      = Module(new StageReg(new MEMWBBundle))
  // dontTouch(mem_wb.io)
  // To make the interface of the mem_wb_ctrl register consistent with the other control
  // regs, we create an anonymous Bundle
  val mem_wb_ctrl = Module(new StageReg(new MEMWBControl))
  // mem_wb <> dontt
  // Forward declaration of wires that connect different stages

  // From memory back to fetch. Since we don't decide whether to take a branch or not until the memory stage.
  val next_pc      = Wire(UInt())
  //val taken        = Wire(Bool())

  // For wb back to other stages
  val regWData = Wire(UInt())

  /////////////////////////////////////////////////////////////////////////////
  // FETCH STAGE
  /////////////////////////////////////////////////////////////////////////////

  // Note: This comes from the memory stage!
  // Only update the pc if pcstall is false
  pc := Mux(hazard.io.pcStall, pc, 
           Mux(hazard.io.pcFromTaken, next_pc, predicter.io.predicted_pc))

  // Send the PC to the instruction memory port to get the instruction
  io.imem.addr := pc

  // Send a valid instruction request to instruction memory only if IFID isn't
  // being bubbled;
  io.imem.valid := !hazard.io.IF_ID_stall

  // Get the PC + 4
  pcPlus4.io.inputx := pc
  pcPlus4.io.inputy := 4.U

  // Data supplied to if_id register is bubbled when the hazard detector
  // indicates a IFID bubble
  if_id.io.valid := !hazard.io.IF_ID_stall

  // Connect outputs of IF stage into the stage register's in port
  if_id.io.in.instr := io.imem.instr
  if_id.io.in.pc          := pc
  if_id.io.in.pcPlus4  := pcPlus4.io.result

  if_id.io.flush  := hazard.io.IF_ID_flush

  predicter.io.instr := io.imem.instr
  predicter.io.pc    := pc

  /////////////////////////////////////////////////////////////////////////////
  // ID STAGE
  /////////////////////////////////////////////////////////////////////////////

  val rs1 = if_id.io.data.instr(19,15)
  val rs2 = if_id.io.data.instr(24,20)

  // Send input from this stage to hazard detection unit
  hazard.io.rs1 := rs1
  hazard.io.rs2 := rs2

  // Send opcode to decode
  decode.io.instr := if_id.io.data.instr

  // Send register numbers to the register file
  regs.io.regRAddr1 := rs1
  regs.io.regRAddr2 := rs2

  // Data supplied to id_ex register is always valid every cycle
  id_ex.io.valid := true.B
  // Don't need to flush the data in this register
  // id_ex.io.flush := false.B
  id_ex.io.flush := hazard.io.ID_EX_flush;  // CHANGE
  // FIll the id_ex register
  id_ex.io.in.regWAddr  := if_id.io.data.instr(11,7)
  id_ex.io.in.rs1       := rs1
  id_ex.io.in.rs2       := rs2
  id_ex.io.in.funct7    := if_id.io.data.instr(31,25)
  id_ex.io.in.funct3    := if_id.io.data.instr(14,12)
  id_ex.io.in.imm       := decode.io.imm
  id_ex.io.in.regRData2 := regs.io.regRData2
  id_ex.io.in.regRData1 := regs.io.regRData1
  id_ex.io.in.pc        := if_id.io.data.pc
  id_ex.io.in.pcPlus4   := if_id.io.data.pcPlus4

  // Data supplied to id_ex_ctrl register is always valid every cycle
  id_ex_ctrl.io.valid := true.B
  // Set the execution control signals
  id_ex_ctrl.io.in.ex_ctrl.branch     := decode.io.branch
  id_ex_ctrl.io.in.ex_ctrl.jump       := decode.io.jump
  id_ex_ctrl.io.in.ex_ctrl.aluCtrlOp  := decode.io.aluCtrlOp
  id_ex_ctrl.io.in.ex_ctrl.aluSrc     := decode.io.aluSrc
  id_ex_ctrl.io.in.ex_ctrl.resultSel  := decode.io.resultSel
  id_ex_ctrl.io.in.ex_ctrl.pcAdd      := decode.io.pcAdd
  id_ex_ctrl.io.in.ex_ctrl.itype      := decode.io.types(5)
  // Set the memory control signals
  id_ex_ctrl.io.in.mem_ctrl.memRead   := decode.io.memRead
  id_ex_ctrl.io.in.mem_ctrl.memWrite  := decode.io.memWrite
  id_ex_ctrl.io.in.mem_ctrl.maskMode  := if_id.io.data.instr(13,12)
  id_ex_ctrl.io.in.mem_ctrl.sext      := ~if_id.io.data.instr(14)
  id_ex_ctrl.io.in.mem_ctrl.taken     := false.B
  // Set the writeback control signals
  id_ex_ctrl.io.in.wb_ctrl.toReg      := decode.io.toReg
  id_ex_ctrl.io.in.wb_ctrl.regWrite   := decode.io.regWrite

  // Flush the IDEX control signals whenever the hazard detector signals an IDEX
  // bubble
  id_ex_ctrl.io.flush := hazard.io.ID_EX_flush

  /////////////////////////////////////////////////////////////////////////////
  // EX STAGE
  /////////////////////////////////////////////////////////////////////////////

  // Set the inputs to the hazard detection unit from this stage
  hazard.io.ID_EX_memRead := id_ex_ctrl.io.data.mem_ctrl.memRead
  hazard.io.ID_EX_rd      := id_ex.io.data.regWAddr

  // Set the input to the forwarding unit from this stage
  forwarding.io.rs1 := id_ex.io.data.rs1
  forwarding.io.rs2 := id_ex.io.data.rs2

  // Connect the ALU control wires (line 45 of single-cycle/cpu.scala)
  aluControl.io.aluCtrlOp := id_ex_ctrl.io.data.ex_ctrl.aluCtrlOp
  aluControl.io.funct7    := id_ex.io.data.funct7
  aluControl.io.funct3    := id_ex.io.data.funct3
  aluControl.io.itype     := id_ex_ctrl.io.data.ex_ctrl.itype
  // Insert the forward inputx mux here
  val forward_input1 = Wire(UInt(32.W))
  forward_input1  := MuxCase(0.U, Array(
                           (forwarding.io.forwardA === 0.U) -> id_ex.io.data.regRData1,
                           (forwarding.io.forwardA === 1.U) -> ex_mem.io.data.result,
                           (forwarding.io.forwardA === 2.U) -> regWData))

  val alu_input1 = Wire(UInt(32.W))
  // Insert the ALU inputx mux here (line 59 of single-cycle/cpu.scala)
  alu_input1 := Mux(id_ex_ctrl.io.data.ex_ctrl.pcAdd, id_ex.io.data.pc, forward_input1)

  alu.io.aluIn1 := alu_input1

  // Insert forward inputy mux here
  val forward_input2 = MuxCase(0.U, Array(
                           (forwarding.io.forwardB === 0.U) -> id_ex.io.data.regRData2,
                           (forwarding.io.forwardB === 1.U) -> ex_mem.io.data.result,
                           (forwarding.io.forwardB === 2.U) -> regWData))

  val alu_input2 = Wire(UInt(32.W))
  alu_input2 := forward_input2

  // Input y mux (line 66 of single-cycle/cpu.scala)
  alu.io.aluIn2 := Mux(id_ex_ctrl.io.data.ex_ctrl.aluSrc, id_ex.io.data.imm, alu_input2)

  // Set the ALU operation
  alu.io.aluOp := aluControl.io.aluOp

  // Connect the branchAdd unit
  branchAdd.io.inputx := id_ex.io.data.pc
  branchAdd.io.inputy := id_ex.io.data.imm

  // Data supplied to ex_mem register is always valid every cycle
  ex_mem.io.valid := true.B
  // Don't need to flush the data in this register
  ex_mem.io.flush := false.B
  // Set the EX/MEM register values
  ex_mem.io.in.regRData2 := alu_input2
  ex_mem.io.in.regWAddr  := id_ex.io.data.regWAddr

  // Data supplied to ex_mem_ctrl register is always valid every cycle
  ex_mem_ctrl.io.valid       := true.B
  ex_mem_ctrl.io.in.mem_ctrl := id_ex_ctrl.io.data.mem_ctrl
  ex_mem_ctrl.io.in.wb_ctrl  := id_ex_ctrl.io.data.wb_ctrl

  // Calculate whether which PC we should use and set the taken flag (line 92 in single-cycle/cpu.scala)
  // ex_mem.io.in.nextpc := Mux(id_ex_ctrl.io.data.ex_ctrl.jump(1), alu.io.aluOut, branchAdd.io.result)
  next_pc := Mux(id_ex_ctrl.io.data.ex_ctrl.jump(1), alu.io.aluOut, 
             Mux(alu.io.aluOut(0), branchAdd.io.result, id_ex.io.data.pcPlus4))// CHANGE, match TODO 01 02

  // Determine which result to use 
  ex_mem.io.in.result  := MuxCase(0.U, Array(
                           (id_ex_ctrl.io.data.ex_ctrl.resultSel === 0.U) -> alu.io.aluOut,
                           (id_ex_ctrl.io.data.ex_ctrl.resultSel === 1.U) -> id_ex.io.data.imm,
                           (id_ex_ctrl.io.data.ex_ctrl.resultSel === 2.U) -> id_ex.io.data.pcPlus4))

  // 1. jalr
  // 2. branch: 2.1 分支跳转，往后跳 2.2 分支不跳转，PC=PC+4
  when (id_ex_ctrl.io.data.ex_ctrl.jump(0) 
  | (id_ex_ctrl.io.data.ex_ctrl.branch
  & (alu.io.aluOut(0) & (~id_ex.io.data.imm(31))
  | ~alu.io.aluOut(0) & ( id_ex.io.data.imm(31)) ))) {
    // ex_mem_ctrl.io.in.mem_ctrl.taken  := true.B 
    hazard.io.EX_MEM_taken := true.B  // CHANGE, match TODO 01
  } .otherwise {
    //ex_mem.io.in.nextpc := 0.U // No need to set the PC if not a branch
    // ex_mem_ctrl.io.in.mem_ctrl.taken  := false.B
    hazard.io.EX_MEM_taken := false.B // CHANGE, match TODO 01
  }

  // Flush the EXMEM control signals if the hazard s a bubble
  ex_mem_ctrl.io.flush := hazard.io.EX_MEM_flush
  ex_mem.io.in.pc := id_ex.io.data.pc
  /////////////////////////////////////////////////////////////////////////////
  // MEM STAGE
  /////////////////////////////////////////////////////////////////////////////

  // Set data.mem_ctrlemory IO (line 71 of single-cycle/cpu.scala)
  io.dmem.addr      := ex_mem.io.data.result
  io.dmem.writeData := ex_mem.io.data.regRData2
  io.dmem.memRead   := ex_mem_ctrl.io.data.mem_ctrl.memRead
  io.dmem.memWrite  := ex_mem_ctrl.io.data.mem_ctrl.memWrite
  io.dmem.maskMode  := ex_mem_ctrl.io.data.mem_ctrl.maskMode
  io.dmem.sext      := ex_mem_ctrl.io.data.mem_ctrl.sext

  // Set dmem request as valid when a write or read is being requested
  io.dmem.valid := (io.dmem.memRead | io.dmem.memWrite)

  // Send next_pc back to the fetch stage
  // next_pc := ex_mem.io.data.nextpc // CHANGE match TODO 01

  // Send input signals to the hazard detection unit
  // hazard.io.EX_MEM_taken := ex_mem_ctrl.io.data.mem_ctrl.taken
  // hazard.io.EX_MEM_taken := ex_mem_ctrl.io.data.mem_ctrl.taken // CHANGE, match TODO 01

  // Send input signals to the forwarding unit
  forwarding.io.exMemRd     := ex_mem.io.data.regWAddr
  forwarding.io.exMemRw     := ex_mem_ctrl.io.data.wb_ctrl.regWrite

  // Data supplied to mem_wb register is always valid every cycle
  mem_wb.io.valid := true.B
  // No need to flush the data of this register
  mem_wb.io.flush := false.B
  // Wire the MEM/WB register
  mem_wb.io.in.regWAddr   := ex_mem.io.data.regWAddr
  mem_wb.io.in.result     := ex_mem.io.data.result
  mem_wb.io.in.readData   := io.dmem.readData

  // Data supplied to mem_wb_ctrl register is always valid every cycle
  mem_wb_ctrl.io.valid       := true.B
  // No need to flush the data of this register
  mem_wb_ctrl.io.flush       := false.B
  mem_wb_ctrl.io.in.wb_ctrl  := ex_mem_ctrl.io.data.wb_ctrl
  mem_wb.io.in.pc := ex_mem.io.data.pc
  /////////////////////////////////////////////////////////////////////////////
  // WB STAGE
  /////////////////////////////////////////////////////////////////////////////

  // Set the writeback data.mem_ctrlux (line 78 single-cycle/cpu.scala)
  regWData := MuxCase(0.U, Array(
                           (mem_wb_ctrl.io.data.wb_ctrl.toReg === 0.U) -> mem_wb.io.data.result,
                           (mem_wb_ctrl.io.data.wb_ctrl.toReg === 1.U) -> mem_wb.io.data.readData))

  // Write the data to the register file
  regs.io.regWData := regWData
  regs.io.regWAddr := mem_wb.io.data.regWAddr
  regs.io.wen      := mem_wb_ctrl.io.data.wb_ctrl.regWrite && (mem_wb.io.data.regWAddr =/= 0.U)

  // Set the input signals for the forwarding unit
  forwarding.io.memWBRd := mem_wb.io.data.regWAddr
  forwarding.io.memWBRw := mem_wb_ctrl.io.data.wb_ctrl.regWrite  
  // JUST FOR DEBUG
  ex_mem.io.in.nextpc := 0.U;
  // ex_mem.io.data.nextpc := 1.U;
}

/*
 * Object to make it easier to print information about the CPU
 */
object PipelinedCPUInfo {
  def getModules(): List[String] = {
    List(
      "imem",
      "dmem",
      "control",
      "branchCtrl",
      "regs",
      "aluControl",
      "alu",
      "immGen",
      "pcPlus4",
      "branchAdd",
      "forwarding",
      "hazard",
    )
  }
  def getPipelineRegs(): List[String] = {
    List(
      "if_id",
      "id_ex",
      "id_ex_ctrl",
      "ex_mem",
      "ex_mem_ctrl",
      "mem_wb",
      "mem_wb_ctrl"
    )
  }
}
