`timescale 1ps/1ps
module HazardUnit (
  input  [4:0]  rs1,
  input  [4:0]  rs2,
  // input         ID_branch,
  input         ID_EX_memRead,
  input  [4:0]  ID_EX_rd,
  input         EX_MEM_taken,

  input         ID_EX_memAccess,
  input  [1:0]  EX_MEM_maskMode,
  input         EX_MEM_wen,

  output reg    pcFromTaken,
  output reg    pcStall,
  output reg    IF_ID_stall,
  output reg    ID_EX_stall,
  output reg    ID_EX_flush,
  output reg    EX_MEM_flush,
  output reg    IF_ID_flush
);

  // note: ���� if ����������ȼ�
  always @(*) begin
    pcFromTaken   <= 0;  
    pcStall       <= 0; 
    IF_ID_stall    <= 0;
    ID_EX_stall    <= 0;
    ID_EX_flush    <= 0;
    EX_MEM_flush   <= 0;  
    IF_ID_flush    <= 0;
    // ǰһ��ָ���� load����һ���� rs1/rs2 ������ǰһ���� mem ��������ֵ��
    // û����ͣ��ǰ�ݣ���Ҫ�� load ֮���ָ��ͣ��һ�����ڣ����� IF/ID ��ˢ
    if(ID_EX_memRead & (ID_EX_rd == rs1 || ID_EX_rd == rs2)) begin
      pcFromTaken <= 0;
      pcStall     <= 1;
      IF_ID_stall <= 1;
      ID_EX_flush <= 1;
    end
    // ͬ�� RAM��ǰһ��ָ���� sb/sh����һ��ָ���� load/store��
    // ���� sb/sh ��Ҫ�ȶ�����д�룬ռ���������ڣ���Ҫ��֮���ָ��ͣһ������
    if(ID_EX_memAccess && EX_MEM_wen && (EX_MEM_maskMode == 2'b00 || EX_MEM_maskMode == 2'b01)) begin
      pcFromTaken  <= 0;
      pcStall      <= 1;
      IF_ID_stall  <= 1;
      ID_EX_stall  <= 1;
      EX_MEM_flush <= 1;
    end
    // alu ���� branch Ԥ��ʧ�ܣ���Ҫ��ת������pc����ˢȫ����ˮ��
    if(EX_MEM_taken) begin 
      pcFromTaken <= 1; // PC from MEM stage
      pcStall     <= 0; // PC from MEM stage\
      IF_ID_flush  <= 1;
      ID_EX_flush  <= 1;
      // EX_MEM_flush <= 1;
      EX_MEM_flush <= 0; // CHANGE : match TODO 01 Execute �ķ�֧��ת��ˮ�߳�ˢ��ǰ��
      // ����Ϊ�� EX_MEM ����ˮ�߼Ĵ����ж��� ex_mem_taken ���� Hazard �жϳ�ˢ��
      // ��Ϊ��д�� EX_MEM ֮ǰֱ�Ӹ� hazard �Ҳ���ˢ EX_MEM
    end
  end

endmodule