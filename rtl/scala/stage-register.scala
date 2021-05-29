package sriscv

import chisel3._
class StageRegIO[+T <: Data](gen: T) extends Bundle {
  /** Inputted data to the stage regster */
  val in = Input(gen)
  /** A bit that flushes the contents of a [[StageReg]] with 0 when high. */
  val flush = Input(Bool())
  /** A bit that writes the contents of @in to a [[StageReg]]. */
  val valid = Input(Bool())
  /** The outputted data from the internal register */
  val data = Output(gen)
  override def cloneType: this.type = StageRegIO (gen).asInstanceOf[this.type]
}

/**
  * Factory to wrap a data bundle in a stage register IO interface.
  */
object StageRegIO {
  def apply[T <: Data](gen: T): StageRegIO[T] = new StageRegIO (gen)
}

/** A specialized register module that supports freezing, flushing,
  * and writing to its contents when valid.
  */
class StageReg[+T <: Data](val gen: T) extends Module {
  val io = IO(new StageRegIO[T] (gen))
  // io := DontCare
  dontTouch(io) // TODO just for simulation
  val reg = RegInit (0.U.asTypeOf (gen))
  io.data := reg
  when (io.valid) {
    reg := io.in
  }
  when (io.flush) {
    reg := 0.U.asTypeOf (gen)
  }
}

