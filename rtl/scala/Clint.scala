package sriscv

import chisel3._
import chisel3.util._

import CSRAddr._

object IntState{
    val S_INT_IDLE         = "b0001".U(4.W);
    val S_INT_SYNC_ASSERT  = "b0010".U(4.W);
    val S_INT_ASYNC_ASSERT = "b0100".U(4.W);
    val S_INT_MRET         = "b1000".U(4.W);
}

object CsrState{
    val S_CSR_IDLE         = "b00001".U(5.W);
    val S_CSR_MSTATUS      = "b00010".U(5.W);
    val S_CSR_MEPC         = "b00100".U(5.W);
    val S_CSR_MSTATUS_MRET = "b01000".U(5.W);
    val S_CSR_MCAUSE       = "b10000".U(5.W);
    val S_CSR_NONE         = "b00000".U(5.W);
}

object SystemInstr{
    val ECALL  = "h00000073".U(32.W)
    val EBREAK = "h00100073".U(32.W)
    val MRET   = "h30200073".U(32.W)
}

import IntState._
import CsrState._
import SystemInstr._

class Clint extends Module{
    val io = IO(new Bundle{
        val csrIO = Flipped(new ClintCSRIO)
        val intFlag = Input(UInt(8.W))

        val idInstr = Input(UInt(32.W))
        val idPC    = Input(UInt(32.W))

        val jump = Input(Bool())
        val jump_addr_i = Input(UInt(32.W))

        val hold_flag_i = Input(UInt(3.W))

        val globalIntEn = Input(Bool())

        val int_addr_o = Output(UInt(32.W))
        val int_assert_o = Output(Bool())
    })

    val intState = RegInit(S_INT_IDLE)
    val csrState = RegInit(S_CSR_IDLE)
    val instAddr   = RegInit(0.U(32.W))
    val cause    = RegInit(0.U(32.W))

    // 中断逻辑
    intState := MuxCase(S_INT_IDLE, Array(
        (io.idInstr === ECALL || io.idInstr === EBREAK) -> S_INT_ASYNC_ASSERT,
        (io.intFlag =/= 0.U && io.globalIntEn === true.B) -> S_INT_ASYNC_ASSERT,
        (io.idInstr === MRET) -> S_INT_MRET
    ))
    // 写 CSR 寄存器状态
    when(csrState =/= S_CSR_IDLE){
        csrState := MuxLookup(csrState, S_CSR_IDLE, Array(
            S_CSR_MEPC    -> S_CSR_MSTATUS,
            S_CSR_MSTATUS -> S_CSR_MCAUSE
        ))
    }.otherwise{
        when(intState === S_INT_SYNC_ASSERT){   // 同步中断
            csrState := S_CSR_MEPC
            instAddr := Mux(io.jump === true.B, (io.jump_addr_i - 4.U), io.idPC)   // note 加四还是减四
            cause  := MuxLookup(io.idInstr, 10.U, Array(
                ECALL  -> 11.U,
                EBREAK -> 3.U
            ))
        }.elsewhen(intState === S_INT_ASYNC_ASSERT){    // 异步中断
            // 定时器中断
            cause := "h80000004".U
            csrState := S_CSR_MEPC
            instAddr := io.idPC,
        }.elsewhen(intState === S_INT_MRET){    // 中断返回
            csrState := S_CSR_MSTATUS_MRET;
        }
    }
    // 写 CSR 内容
    when(csrState === S_CSR_NONE || csrState(0)){
        io.csrIO.wen := false.B
        io.csrIO.wAddr := 0.U
        io.csrIO.wData := 0.U
    }.otherwise{
        io.csrIO.wen := true.B
        io.csrIO.wAddr := Cat(0.U(20.W), MuxLookup(csrState, 0.U, Array(
            S_CSR_IDLE         -> 0.U,        // IDLE has been dealed before
            S_CSR_MSTATUS      -> MSTATUS,
            S_CSR_MEPC         -> MEPC,
            S_CSR_MSTATUS_MRET -> MSTATUS,
            S_CSR_MCAUSE       -> MCAUSE
        )))
        io.csrIO.wData := Cat(0.U(20.W), MuxLookup(csrState, 0.U, Array(
            S_CSR_IDLE         -> 0.U,        // IDLE has been dealed before
            S_CSR_MSTATUS      -> Cat(io.csrIO.mstatus(31, 4), 1.U(1.W), io.csrIO.mstatus(2, 0)),
            S_CSR_MEPC         -> instAddr,
            S_CSR_MSTATUS_MRET -> Cat(io.csrIO.mstatus(31, 4), io.csrIO.mstatus(7), io.csrIO.mstatus(2, 0)),
            S_CSR_MCAUSE       -> cause
        )))
    }
    // 发出中断信号 // note：待完成
}