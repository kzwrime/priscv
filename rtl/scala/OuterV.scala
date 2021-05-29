package sriscv

import chisel3._
import chisel3.util._

class ALU extends BlackBox {
  val io = IO(new Bundle {
    val aluIn1 = Input(UInt(32.W))
    val aluIn2 = Input(UInt(32.W))
    val aluOp  = Input(UInt(4.W))
    val aluOut = Output(UInt(32.W))
  })
}

class ALUCtrl extends BlackBox {
  val io = IO(new Bundle {
    val funct3 = Input(UInt(3.W))
    val funct7 = Input(UInt(7.W))
    val itype  = Input(UInt(1.W))
    val aluCtrlOp = Input(UInt(2.W))
    val aluOp  = Output(UInt(4.W))
  })
}

class Decode extends BlackBox {
  val io = IO(new Bundle {
    val instr     = Input(UInt(32.W))  
    val branch    = Output(UInt(1.W))    
    val jump      = Output(UInt(2.W))  
    val memRead   = Output(UInt(1.W))    
    val memWrite  = Output(UInt(1.W))      
    val regWrite  = Output(UInt(1.W))      
    val toReg     = Output(UInt(1.W))  
    val resultSel = Output(UInt(2.W))      
    val aluSrc    = Output(UInt(1.W))    
    val pcAdd     = Output(UInt(1.W))  
    val types     = Output(UInt(7.W))  
    val aluCtrlOp = Output(UInt(2.W))      
    val validInst = Output(UInt(1.W))      
    val imm       = Output(UInt(32.W))
  })
}

class ForwardingUnit extends BlackBox {
  val io = IO(new Bundle {
    val rs1     = Input(UInt(5.W))
    val rs2     = Input(UInt(5.W))
    val exMemRd = Input(UInt(5.W))
    val exMemRw = Input(Bool())
    val memWBRd = Input(UInt(5.W))
    val memWBRw = Input(Bool())

    val forwardA = Output(UInt(2.W))
    val forwardB = Output(UInt(2.W))
  })
}

class HazardUnit extends BlackBox {
  val io = IO(new Bundle {
    val rs1          = Input(UInt(5.W))
    val rs2          = Input(UInt(5.W))
    val ID_EX_memRead = Input(Bool())
    val ID_EX_rd      = Input(UInt(5.W))
    val EX_MEM_taken  = Input(Bool())

    val pcFromTaken  = Output(Bool())
    val pcStall      = Output(Bool())
    val IF_ID_stall   = Output(Bool())
    val ID_EX_flush   = Output(Bool())
    val EX_MEM_flush  = Output(Bool())
    val IF_ID_flush   = Output(Bool())
  })
}

class IMem extends BlackBox {
  val io = IO(new Bundle {
    val clk     = Input(Clock())
    val reset   = Input(Bool())
    val valid   = Input(UInt(1.W))
    val good    = Output(UInt(1.W))
    val addr    = Input(UInt(32.W))
    val instr   = Output(UInt(32.W))
  })
}

class DMem extends BlackBox {
  val io = IO(new Bundle {
    val clk     = Input(Clock())
    val reset   = Input(Bool())
    val valid   = Input(UInt(1.W))
    val good    = Output(UInt(1.W))
    val addr    = Input(UInt(32.W))

    val writeData = Input(UInt(32.W))
    val memRead   = Input(UInt(1.W))
    val memWrite  = Input(UInt(1.W))
    val maskMode  = Input(UInt(2.W))
    val sext      = Input(UInt(1.W))
    val readData  = Output(UInt(32.W))
  })
}

class Predicter extends BlackBox {
  val io = IO(new Bundle {
    val instr        = Input(UInt(32.W))     
    val pc           = Input(UInt(32.W)) 
    val predicted_pc = Output(UInt(32.W))           
  })
}

class RegFile extends BlackBox {
  val io = IO(new Bundle {
    val clk       = Input(Clock()) 
    val reset     = Input(Bool())   
    val wen       = Input(UInt(1.W)) 
    val regRAddr1 = Input(UInt(5.W))       
    val regRAddr2 = Input(UInt(5.W))       
    val regWAddr  = Input(UInt(5.W))       
    val regWData  = Input(UInt(32.W))       
    val regRData1 = Output(UInt(32.W))       
    val regRData2 = Output(UInt(32.W))   
  })
}


class MemPortIO extends Bundle {
  // Pipeline <=> Port
  val addr  = Input(UInt(32.W))
  val valid    = Input(Bool())
  val good     = Output(Bool())
}

class IMemPortIO extends MemPortIO {
    val instr = Output(UInt(32.W))
    // val ready = Output(Bool())
}

class DMemPortIO extends MemPortIO {
    val writeData = Input(UInt(32.W))
    val memRead   = Input(UInt(1.W))
    val memWrite  = Input(UInt(1.W))
    val maskMode  = Input(UInt(2.W))
    val sext      = Input(UInt(1.W))
    val readData  = Output(UInt(32.W))
}

class Adder extends Module {
  val io = IO(new Bundle {
    val inputx    = Input(UInt(32.W))
    val inputy    = Input(UInt(32.W))

    val result    = Output(UInt(32.W))
  })

  io.result := io.inputx + io.inputy
}