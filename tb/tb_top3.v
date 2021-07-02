`timescale 1ps/1ps
`define CLOCK_TIME_HALF 50
`include "rtl/Top.v"
`define HEXFILE ".verilog"

module tb_top3 ();
    
    reg clk = 0;
    reg reset = 0;
    wire error;
    integer counter = -1;
    integer FILE;
    Top SV_CPU_TOP(
        .clk(clk), 
        .reset(reset)
        // .error(error)
    );

    always @(*) begin
        #`CLOCK_TIME_HALF clk <= ~clk;
        counter <= counter + 1;
        if(counter >= 50) $finish;
    end

    initial begin
        #10
        $display("--------------BEGIN TEST---------------");
        reset <= 0;
        #((`CLOCK_TIME_HALF)*2.1) reset <= 1;
        #((`CLOCK_TIME_HALF)*1.1) reset <= 0;
    end

    reg[7:0] IM_TMP[1023:0]; // 8 * 1024 == 32 * 256 == 2^13
    initial begin
        clearIM(0, 255);
        clearIM_TMP(0, 1023);
        #100
        $write("HEXFILE = ");
        $display(`HEXFILE);
        // $readmemh(`HEXFILE, IM_TMP);
        // for(ii = 0; ii <= 1023; ii = ii + 4) begin
        //     SV_CPU_TOP.U_IM.IMEM[ii>>2][7:0] = IM_TMP[ii];
        //     SV_CPU_TOP.U_IM.IMEM[ii>>2][15:8] = IM_TMP[ii+1];
        //     SV_CPU_TOP.U_IM.IMEM[ii>>2][23:16] = IM_TMP[ii+2];
        //     SV_CPU_TOP.U_IM.IMEM[ii>>2][31:24] = IM_TMP[ii+3];
        // end
        
        $readmemh(`HEXFILE, SV_CPU_TOP.U_IM.IMEM);
        $readmemh("./data/second/D_DEMO31.coe", SV_CPU_TOP.U_DM.DMEM);

        $display("pc = 0x0 : %x", SV_CPU_TOP.U_IM.IMEM[0]);
        $display("pc = 0x4 : %x", SV_CPU_TOP.U_IM.IMEM[1]);
        $display("pc = 0x18c : %x", SV_CPU_TOP.U_IM.IMEM[99]);
    end

    localparam DEC_INVALID = 21'b0;
    //                        20     19-18  17       16        15        14     13-12      11      10     9--------3  2---1      0
    //                        branch jump   memRead  memWrite  regWrite  toReg  resultSel  aluSrc  pcAdd     RISBUJZ  aluCtrlOp  validInst
    localparam DEC_LUI     = {1'b0,  2'b00, 1'b0,    1'b0,     1'b1,     1'b0,  2'b01,     1'b0,   1'b0,  7'b0000100, 2'b00,     1'b1};
    localparam DEC_AUIPC   = {1'b0,  2'b00, 1'b0,    1'b0,     1'b1,     1'b0,  2'b00,     1'b1,   1'b1,  7'b0000100, 2'b00,     1'b1};
    localparam DEC_JAL     = {1'b0,  2'b01, 1'b0,    1'b0,     1'b1,     1'b0,  2'b10,     1'b0,   1'b0,  7'b0000010, 2'b00,     1'b1};
    localparam DEC_JALR    = {1'b0,  2'b11, 1'b0,    1'b0,     1'b1,     1'b0,  2'b10,     1'b1,   1'b0,  7'b0100000, 2'b00,     1'b1};
    localparam DEC_BRANCH  = {1'b1,  2'b00, 1'b0,    1'b0,     1'b0,     1'b0,  2'b00,     1'b0,   1'b0,  7'b0001000, 2'b01,     1'b1};
    localparam DEC_LOAD    = {1'b0,  2'b00, 1'b1,    1'b0,     1'b1,     1'b1,  2'b00,     1'b1,   1'b0,  7'b0100000, 2'b00,     1'b1};
    localparam DEC_STORE   = {1'b0,  2'b00, 1'b0,    1'b1,     1'b0,     1'b0,  2'b00,     1'b1,   1'b0,  7'b0100000, 2'b00,     1'b1};
    localparam DEC_ALUI    = {1'b0,  2'b00, 1'b0,    1'b0,     1'b1,     1'b0,  2'b00,     1'b1,   1'b0,  7'b0100000, 2'b10,     1'b1};
    localparam DEC_ALUR    = {1'b0,  2'b00, 1'b0,    1'b0,     1'b1,     1'b0,  2'b00,     1'b0,   1'b0,  7'b1000000, 2'b10,     1'b1};

    wire decode_all = {
         SV_CPU_TOP.U_CPU.decode_branch,
         SV_CPU_TOP.U_CPU.decode_jump,
         SV_CPU_TOP.U_CPU.decode_memRead,
         SV_CPU_TOP.U_CPU.decode_memWrite,
         SV_CPU_TOP.U_CPU.decode_regWrite,
         SV_CPU_TOP.U_CPU.decode_toReg,
         SV_CPU_TOP.U_CPU.decode_resultSel,
         SV_CPU_TOP.U_CPU.decode_aluSrc,
         SV_CPU_TOP.U_CPU.decode_pcAdd,
         SV_CPU_TOP.U_CPU.decode_types,
         SV_CPU_TOP.U_CPU.decode_aluCtrlOp,
         SV_CPU_TOP.U_CPU.decode_validInst,
         SV_CPU_TOP.U_CPU.decode_imm
    };

    wire is_LUI     = decode_all == DEC_LUI    ;
    wire is_AUIPC   = decode_all == DEC_AUIPC  ;
    wire is_JAL     = decode_all == DEC_JAL    ;
    wire is_JALR    = decode_all == DEC_JALR   ;
    wire is_BRANCH  = decode_all == DEC_BRANCH ;
    wire is_LOAD    = decode_all == DEC_LOAD   ;
    wire is_STORE   = decode_all == DEC_STORE  ;
    wire is_ALUI    = decode_all == DEC_ALUI   ;
    wire is_ALUR    = decode_all == DEC_ALUR   ;

    integer i;
    always @(negedge clk) begin
        #1
        FILE = $fopen("./tb/tb_top3.md", "a");
        $fwrite(FILE, "# pc %x\n", SV_CPU_TOP.U_CPU.pc);
        if(SV_CPU_TOP.U_CPU.pc == 32'b0) $display();
        $write("\npc %x,\t instr %x\t\t\n", SV_CPU_TOP.U_CPU.pc, SV_CPU_TOP.io_imem_instr);
        $write("reg(5) = %x %x \t\tmem(0) = %x\t\t", SV_CPU_TOP.U_CPU.regs.regs[5], SV_CPU_TOP.U_CPU.regs.regs[6], SV_CPU_TOP.U_DM.DMEM[0]);
        $write("reg(27) = %x %x \t\tmem(1) = %x\n", SV_CPU_TOP.U_CPU.regs.regs[27], SV_CPU_TOP.U_CPU.regs.regs[28], SV_CPU_TOP.U_DM.DMEM[1]);
        // case({is_ALUR,      is_LOAD, 
        //       is_STORE,    is_BRANCH, 
        //       is_JAL,      is_JALR, 
        //       is_ALUI,     is_LUI,
        //       is_AUIPC})
        //     9'b100000000: begin 
        //         $fwrite(FILE, "### is_alu x%d, x%d, x%d\n", SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr, SV_CPU_TOP.U_CPU.id_ex_io_in_rs1, SV_CPU_TOP.U_CPU.id_ex_io_in_rs2);
        //         $display("### is_alu \tx%d, x%d, x%d\t\t\t x%d <= 0x%h", 
        //                 SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr, SV_CPU_TOP.U_CPU.id_ex_io_in_rs1, SV_CPU_TOP.U_CPU.id_ex_io_in_rs2, SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr);
        //         end
        //     9'b010000000: begin 
        //         $fwrite(FILE, "### is_load x%d, 0x%x(x%d)\n", SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr, SV_CPU_TOP.U_CPU.id_ex_io_in_imm, SV_CPU_TOP.U_CPU.id_ex_io_in_rs1);
        //         // $display("### is_load \tx%d, 0x%x(x%d) \t0x%\x", SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr, SV_CPU_TOP.U_CPU.id_ex_io_in_imm, SV_CPU_TOP.U_CPU.id_ex_io_in_rs1);
        //         end
        //     9'b001000000: begin 
        //         $fwrite(FILE, "### is_store x%d 0x%x(x\%d)\n", SV_CPU_TOP.U_CPU.id_ex_io_in_rs2, SV_CPU_TOP.U_CPU.id_ex_io_in_imm, SV_CPU_TOP.U_CPU.id_ex_io_in_rs1);
        //         // $display("### is_store \tx%d 0x%x(x%d) \t0x%x", SV_CPU_TOP.U_CPU.id_ex_io_in_rs2, SV_CPU_TOP.U_CPU.id_ex_io_in_imm, SV_CPU_TOP.U_CPU.id_ex_io_in_rs1, SV_CPU_TOP.reg_read_data2);
        //         end
        //     9'b000100000: begin 
        //         $fwrite(FILE, "### is_bxx\n");
        //         // $display("### is_bxx \tt=%d,\t  0x%x", SV_CPU_TOP.bxx_test, SV_CPU_TOP.pc_next);
        //         end
        //     9'b000010000: begin 
        //         $fwrite(FILE, "### is_jal\n");
        //         // $display("### is_jal \t\t  0x%h", SV_CPU_TOP.pc_next);
        //         end
        //     9'b000001000: begin 
        //         $fwrite(FILE, "### is_jalr\n");
        //         $display("### is_jalr");
        //         end
        //     9'b000000100: begin 
        //         if({SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr, SV_CPU_TOP.U_CPU.id_ex_io_in_rs1, SV_CPU_TOP.U_CPU.id_ex_io_in_rs2} == 15'b00000_00000_00000) begin
        //             $fwrite(FILE, "### nop\n");
        //             $display("### nop");
        //         end
        //         else begin
        //             $fwrite(FILE, "### is_alui x%d, x%d, 0x%x\n", SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr, SV_CPU_TOP.U_CPU.id_ex_io_in_rs1, SV_CPU_TOP.U_CPU.id_ex_io_in_imm);
        //             $display("### is_alui \tx%d, x%d, 0x%x\t\t x%d <= 0x\%h", 
        //                     SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr, SV_CPU_TOP.U_CPU.id_ex_io_in_rs1, SV_CPU_TOP.U_CPU.id_ex_io_in_imm, SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr);
        //         end
        //         end
        //     9'b000000010: begin 
        //         $fwrite(FILE, "### is_lui x%d, 0x%x\n", SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr, SV_CPU_TOP.U_CPU.id_ex_io_in_imm);
        //         $display("### is_lui \tx%d, \t  0x%x\t\t x%d <= 0x\%h", SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr, 
        //                 SV_CPU_TOP.U_CPU.id_ex_io_in_imm, SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr);
        //         end
        //     9'b000000001: begin 
        //         $fwrite(FILE, "### is_auipc\n");
        //         $display("### is_auipc \t\t\t\t\t x%d <= 0x\%x", SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr);
        //         end
        // endcase
        $fwrite(FILE, "instr: %b\n",SV_CPU_TOP.io_imem_instr);

        $fwrite(FILE, "### Fetch PC = %x\n", SV_CPU_TOP.U_CPU.if_id_io_in_pc);
        $write("### Fetch PC = %x   ", SV_CPU_TOP.U_CPU.if_id_io_in_pc);
            $fwrite(FILE, "|if_id_io_in_instr|if_id_io_in_pcPlus4|if_id_io_flush|if_id_io_valid|\n");
            $fwrite(FILE, "|-|-|-|-|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.if_id_io_in_instr,
                        SV_CPU_TOP.U_CPU.if_id_io_in_pcPlus4,
                        SV_CPU_TOP.U_CPU.if_id_io_flush,
                        SV_CPU_TOP.U_CPU.if_id_io_valid
                    );
        $fwrite(FILE, "### Decode PC = %x\n", SV_CPU_TOP.U_CPU.if_id_io_data_pc);
        $write("### Decode PC = %x   ", SV_CPU_TOP.U_CPU.if_id_io_data_pc);
            $fwrite(FILE, "|if_id_io_data_instr|if_id_io_data_pc|if_id_io_data_pcPlus4|id_ex_io_in_regWAdd|\n");
            $fwrite(FILE, "|-|-|-|-|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.if_id_io_data_instr,
                        SV_CPU_TOP.U_CPU.if_id_io_data_pc,
                        SV_CPU_TOP.U_CPU.if_id_io_data_pcPlus4,
                        SV_CPU_TOP.U_CPU.id_ex_io_in_regWAddr);
            $fwrite(FILE, "|id_ex_io_in_funct7|id_ex_io_in_funct3|id_ex_io_in_imm|id_ex_io_in_regRData2|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_io_in_funct7,
                        SV_CPU_TOP.U_CPU.id_ex_io_in_funct3,
                        SV_CPU_TOP.U_CPU.id_ex_io_in_imm,
                        SV_CPU_TOP.U_CPU.id_ex_io_in_regRData2);
            $fwrite(FILE, "|id_ex_io_in_regRData1|id_ex_io_in_pc|id_ex_io_in_pcPlus4|id_ex_io_in_rs1|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_io_in_regRData1,
                        SV_CPU_TOP.U_CPU.id_ex_io_in_pc,
                        SV_CPU_TOP.U_CPU.id_ex_io_in_pcPlus4,
                        SV_CPU_TOP.U_CPU.id_ex_io_in_rs1);
            $fwrite(FILE, "|id_ex_io_in_rs||||\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_io_in_rs2, 0, 0, 0
                        );
            $fwrite(FILE, "|id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_in_ex_ctrl_resultSel|id_ex_ctrl_io_in_ex_ctrl_aluSrc|id_ex_ctrl_io_in_ex_ctrl_pcAdd|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_ex_ctrl_aluCtrlOp,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_ex_ctrl_resultSel,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_ex_ctrl_aluSrc,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_ex_ctrl_pcAdd);
            $fwrite(FILE, "|id_ex_ctrl_io_in_ex_ctrl_branch|id_ex_ctrl_io_in_ex_ctrl_jump|id_ex_ctrl_io_in_mem_ctrl_memRead|id_ex_ctrl_io_in_mem_ctrl_memWrite|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_ex_ctrl_branch,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_ex_ctrl_jump,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_mem_ctrl_memRead,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_mem_ctrl_memWrite);
            $fwrite(FILE, "|id_ex_ctrl_io_in_mem_ctrl_taken|id_ex_ctrl_io_in_mem_ctrl_maskMode|id_ex_ctrl_io_in_mem_ctrl_sext|id_ex_ctrl_io_in_wb_ctrl_toRegn|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_mem_ctrl_taken,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_mem_ctrl_maskMode,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_mem_ctrl_sext,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_wb_ctrl_toReg);
            $fwrite(FILE, "|id_ex_ctrl_io_in_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_in_wb_ctrl_regWrite,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_flush,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_valid, 0);
        $fwrite(FILE, "### Execute PC = %x\n", SV_CPU_TOP.U_CPU.id_ex_io_data_pc);
        $write("### Execute PC = %x   ", SV_CPU_TOP.U_CPU.id_ex_io_data_pc);
            $fwrite(FILE, "|id_ex_io_data_funct7|id_ex_io_data_funct3|id_ex_io_data_imm|id_ex_io_data_regRData2|\n");
            $fwrite(FILE, "|-|-|-|-|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_io_data_funct7,
                        SV_CPU_TOP.U_CPU.id_ex_io_data_funct3,
                        SV_CPU_TOP.U_CPU.id_ex_io_data_imm,
                        SV_CPU_TOP.U_CPU.id_ex_io_data_regRData2);
            $fwrite(FILE, "|id_ex_io_data_regRData1|id_ex_io_data_pc|id_ex_io_data_pcPlus4|id_ex_io_data_rs1|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_io_data_regRData1,
                        SV_CPU_TOP.U_CPU.id_ex_io_data_pc,
                        SV_CPU_TOP.U_CPU.id_ex_io_data_pcPlus4,
                        SV_CPU_TOP.U_CPU.id_ex_io_data_rs1);
            $fwrite(FILE, "|id_ex_io_data_rs2||||\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_io_data_rs2, 0, 0, 0
                        );
            $fwrite(FILE, "|id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp|id_ex_ctrl_io_data_ex_ctrl_resultSel|id_ex_ctrl_io_data_ex_ctrl_aluSrc|id_ex_ctrl_io_data_ex_ctrl_pcAdd|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_ex_ctrl_aluCtrlOp,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_ex_ctrl_resultSel,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_ex_ctrl_aluSrc,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_ex_ctrl_pcAdd);
            $fwrite(FILE, "|id_ex_ctrl_io_data_ex_ctrl_branch|id_ex_ctrl_io_data_ex_ctrl_jump|id_ex_ctrl_io_data_mem_ctrl_memRead|id_ex_ctrl_io_data_mem_ctrl_memWrite|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_ex_ctrl_branch,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_ex_ctrl_jump,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_mem_ctrl_memRead,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_mem_ctrl_memWrite);
            $fwrite(FILE, "|id_ex_ctrl_io_data_mem_ctrl_taken|id_ex_ctrl_io_data_mem_ctrl_maskMode|id_ex_ctrl_io_data_mem_ctrl_sext|id_ex_ctrl_io_data_wb_ctrl_toRegn|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_mem_ctrl_taken,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_mem_ctrl_maskMode,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_mem_ctrl_sext,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_wb_ctrl_toReg);
            $fwrite(FILE, "|id_ex_ctrl_io_data_wb_ctrl_regWrite|id_ex_ctrl_io_flush|id_ex_ctrl_io_valid|-|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_data_wb_ctrl_regWrite,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_flush,
                        SV_CPU_TOP.U_CPU.id_ex_ctrl_io_valid, 0);
            $fwrite(FILE, "|ex_mem_io_in_regWAddr|ex_mem_io_in_regRData2|ex_mem_io_in_result|ex_mem_io_in_nextpc(X)|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.ex_mem_io_in_regWAddr,
                        SV_CPU_TOP.U_CPU.ex_mem_io_in_regRData2,
                        SV_CPU_TOP.U_CPU.ex_mem_io_in_result, 32'bx);
                        // SV_CPU_TOP.U_CPU.ex_mem_io_in_nextpc);
            $fwrite(FILE, "|ex_mem_io_in_pc|ex_mem_io_flush|ex_mem_io_valid|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.ex_mem_io_in_pc,
                        SV_CPU_TOP.U_CPU.ex_mem_io_flush,
                        SV_CPU_TOP.U_CPU.ex_mem_io_valid, 0);
        $fwrite(FILE, "### Memory PC = %x\n", SV_CPU_TOP.U_CPU.ex_mem_io_data_pc);
        $write("### Memory PC = %x   ", SV_CPU_TOP.U_CPU.ex_mem_io_data_pc);
            $fwrite(FILE, "|ex_mem_io_data_regWAddr|ex_mem_io_data_regRData2|ex_mem_io_data_result|ex_mem_io_data_nextpc(X)|\n");
            $fwrite(FILE, "|-|-|-|-|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.ex_mem_io_data_regWAddr,
                        SV_CPU_TOP.U_CPU.ex_mem_io_data_regRData2,
                        SV_CPU_TOP.U_CPU.ex_mem_io_data_result, 32'bx);
                        // SV_CPU_TOP.U_CPU.ex_mem_io_data_nextpc);
            $fwrite(FILE, "|ex_mem_io_data_pc|ex_mem_io_flush|ex_mem_io_valid|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.ex_mem_io_data_pc,
                        SV_CPU_TOP.U_CPU.ex_mem_io_flush,
                        SV_CPU_TOP.U_CPU.ex_mem_io_valid, 0);
            $fwrite(FILE, "|ex_mem_ctrl_io_in_mem_ctrl_memRead|ex_mem_ctrl_io_in_mem_ctrl_memWrite|ex_mem_ctrl_io_in_mem_ctrl_taken|ex_mem_ctrl_io_in_mem_ctrl_maskMode|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.ex_mem_ctrl_io_in_mem_ctrl_memRead,
                        SV_CPU_TOP.U_CPU.ex_mem_ctrl_io_in_mem_ctrl_memWrite,
                        SV_CPU_TOP.U_CPU.ex_mem_ctrl_io_in_mem_ctrl_taken,
                        SV_CPU_TOP.U_CPU.ex_mem_ctrl_io_in_mem_ctrl_maskMode);
            $fwrite(FILE, "|ex_mem_ctrl_io_in_mem_ctrl_sext|ex_mem_ctrl_io_in_wb_ctrl_toReg|ex_mem_ctrl_io_in_wb_ctrl_regWrite|ex_mem_ctrl_io_flush|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.ex_mem_ctrl_io_in_mem_ctrl_sext,
                        SV_CPU_TOP.U_CPU.ex_mem_ctrl_io_in_wb_ctrl_toReg,
                        SV_CPU_TOP.U_CPU.ex_mem_ctrl_io_in_wb_ctrl_regWrite,
                        SV_CPU_TOP.U_CPU.ex_mem_ctrl_io_flush);
            $fwrite(FILE, "|ex_mem_ctrl_io_valid|mem_wb_io_in_regWAddr|mem_wb_io_in_result|mem_wb_io_in_readData|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.ex_mem_ctrl_io_valid,
                        SV_CPU_TOP.U_CPU.mem_wb_io_in_regWAddr,
                        SV_CPU_TOP.U_CPU.mem_wb_io_in_result,
                        SV_CPU_TOP.U_CPU.mem_wb_io_in_readData);
            $fwrite(FILE, "|mem_wb_io_in_pc|mem_wb_io_flush|mem_wb_io_valid||\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.mem_wb_io_in_pc,
                        SV_CPU_TOP.U_CPU.mem_wb_io_flush,
                        SV_CPU_TOP.U_CPU.mem_wb_io_valid,0);
        $fwrite(FILE, "### Writeback PC = %x\n", SV_CPU_TOP.U_CPU.mem_wb_io_data_pc);
        $write("### Writeback PC = %x\n", SV_CPU_TOP.U_CPU.mem_wb_io_data_pc);
            $fwrite(FILE, "|mem_wb_io_flush|mem_wb_io_valid|mem_wb_io_data_regWAddr|mem_wb_io_data_result|\n");
            $fwrite(FILE, "|-|-|-|-|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.mem_wb_io_flush,
                        SV_CPU_TOP.U_CPU.mem_wb_io_valid,
                        SV_CPU_TOP.U_CPU.mem_wb_io_data_regWAddr,
                        SV_CPU_TOP.U_CPU.mem_wb_io_data_result);
            $fwrite(FILE, "|mem_wb_io_data_readData|mem_wb_io_data_pc|mem_wb_ctrl_io_flush|mem_wb_ctrl_io_valid|\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.mem_wb_io_data_readData,
                        SV_CPU_TOP.U_CPU.mem_wb_io_data_pc,
                        SV_CPU_TOP.U_CPU.mem_wb_ctrl_io_flush,
                        SV_CPU_TOP.U_CPU.mem_wb_ctrl_io_valid);
            $fwrite(FILE, "|mem_wb_ctrl_io_data_wb_ctrl_toReg|mem_wb_ctrl_io_data_wb_ctrl_regWrite|||\n");
            $fwrite(FILE, "|%x|%x|%x|%x|\n",
                        SV_CPU_TOP.U_CPU.mem_wb_ctrl_io_data_wb_ctrl_toReg,
                        SV_CPU_TOP.U_CPU.mem_wb_ctrl_io_data_wb_ctrl_regWrite,0,0);

        $fwrite(FILE, "\n");
        $fwrite(FILE, "|reg_file(i)|x(i)|x(i+1)|x(i+2)|x(i+3)|\n");
        $fwrite(FILE, "|-|-|-|-|-|\n");
        for(i=0; i<32; i=i+4)
            $fwrite(FILE, "|%d|%x|%x|%x|%x|\n", i, SV_CPU_TOP.U_CPU.regs.regs[i], SV_CPU_TOP.U_CPU.regs.regs[i+1], SV_CPU_TOP.U_CPU.regs.regs[i+2], SV_CPU_TOP.U_CPU.regs.regs[i+3]);
        $fwrite(FILE, "|-|-|-|-|-|\n");
        $fwrite(FILE, "|**data_memory(i)**|**+0**|**+4**|**+8**|**+c**|\n");
        for(i=0; i<32; i=i+4)
            $fwrite(FILE, "%h: %h %h %h %h\n", i<<2, SV_CPU_TOP.U_DM.DMEM[i], SV_CPU_TOP.U_DM.DMEM[i+1], SV_CPU_TOP.U_DM.DMEM[i+2], SV_CPU_TOP.U_DM.DMEM[i+3]);
      // $fwrite(FILE, "<!-- slide -->\n");
      $fwrite(FILE, "\n");
      $fclose(FILE);
    end

    initial
    begin
        FILE = $fopen("./tb/tb_top3.md", "a");
        $fwrite(FILE, "\n");
        $fclose(FILE);
        $dumpfile("./tb/tb_top3.vcd");  //生成的vcd文件名称
        $dumpvars(0, tb_top3);       //tb模块名称
    end

    integer ii;
    task clearIM;
        input [4:0] in1, in2;
        begin
            for(ii = in1; ii<=in2; ii = ii+1) begin
                SV_CPU_TOP.U_IM.IMEM[ii] <= 32'bx;
            end
        end
    endtask

    task clearIM_TMP;
        input [4:0] in1, in2;
        begin
            for(ii = in1; ii<=in2; ii = ii+1) begin
                IM_TMP[ii] <= 8'bx;
            end
        end
    endtask

endmodule