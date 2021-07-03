`timescale 1ps/1ps
`define CLOCK_TIME_HALF 50
`include "rtl/Top.v"
`define HEXFILE ".verilog"

module tb_top4 ();
    
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
        if(counter >= 200) begin
            $display("cycle: %d", cycle);
            $finish;
        end
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
        clearDM(0, 255);
        clearIM_TMP(0, 1023);
        #100
        $write("HEXFILE = ");
        $display(`HEXFILE);
        
        $readmemh(`HEXFILE, SV_CPU_TOP.U_IM.IMEM);

        $display("pc = 0x0 : %x", SV_CPU_TOP.U_IM.IMEM[0]);
        $display("pc = 0x4 : %x", SV_CPU_TOP.U_IM.IMEM[1]);
        $display("pc = 0x18c : %x", SV_CPU_TOP.U_IM.IMEM[99]);
    end

    integer i;
    integer cycle = 0;
    always @(negedge clk) begin
        #2
        FILE = $fopen("./tmp/tb_top4.md", "a");
        if(SV_CPU_TOP.U_CPU.pc == 32'b0) $display();
        $write("\npc %x,\t instr %x\t\t\n", SV_CPU_TOP.U_CPU.pc, SV_CPU_TOP.io_imem_instr);
        if(SV_CPU_TOP.U_CPU.mem_wb_io_data_pc != 32'b0 && SV_CPU_TOP.U_CPU.mem_wb_io_data_pc >= 32'b0) begin
            // $fwrite(FILE, "%x\n", SV_CPU_TOP.U_CPU.pc);
            $fwrite(FILE, "%x\n", SV_CPU_TOP.U_CPU.mem_wb_io_data_pc);
            // $fwrite(FILE, "%x\n",SV_CPU_TOP.io_imem_instr);
            for(i=0; i<32; i=i+4)
                $fwrite(FILE, "%x %x %x %x\n", SV_CPU_TOP.U_CPU.regs.regs[i], SV_CPU_TOP.U_CPU.regs.regs[i+1], SV_CPU_TOP.U_CPU.regs.regs[i+2], SV_CPU_TOP.U_CPU.regs.regs[i+3]);
            $fwrite(FILE, "\n");
            for(i=0; i<8; i=i+4)
                $fwrite(FILE, "%h %h %h %h\n", SV_CPU_TOP.U_DM.DMEM[i], SV_CPU_TOP.U_DM.DMEM[i+1], SV_CPU_TOP.U_DM.DMEM[i+2], SV_CPU_TOP.U_DM.DMEM[i+3]);
            $fwrite(FILE, "\n");
            cycle = cycle + 1;
        end
        $fclose(FILE);
    end

    initial
    begin
        FILE = $fopen("./tmp/tb_top4.md", "a");
        $fwrite(FILE, "\n");
        $fclose(FILE);
        $dumpfile("./tmp/tb_top4.vcd");  //生成的vcd文件名称
        $dumpvars(0, tb_top4);       //tb模块名称
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

    task clearDM;
        input [4:0] in1, in2;
        begin
            for(ii = in1; ii<=in2; ii = ii+1) begin
                SV_CPU_TOP.U_DM.DMEM[ii] <= 32'b0;
            end
        end
    endtask

endmodule