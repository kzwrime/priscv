echo $1
grep -q "include" $1

if [ $? -eq 0 ];then
	echo "needn't insert include to $1"
	else  
    echo "insert includes to $1"
    echo "\`include \"rtl/ALU.v\""              >> rtl/CPU.v
	echo "\`include \"rtl/ALUCtrl.v\""          >> rtl/CPU.v	
	echo "\`include \"rtl/Decode.v\""           >> rtl/CPU.v	
	echo "\`include \"rtl/Defines.v\""          >> rtl/CPU.v	
	echo "\`include \"rtl/ForwardingUnit.v\""   >> rtl/CPU.v			
	echo "\`include \"rtl/Hazard.v\""           >> rtl/CPU.v	
	echo "\`include \"rtl/RegFile.v\""          >> rtl/CPU.v
fi

grep -q "!@$%" $1

if [ $? -eq 0 ];then
	echo "needn't insert annotation to $1"
	else
	echo "insert annotation to $1"
	sed -i 's#StageReg(#StageReg(// IFID IF_ID !@$%^#' rtl/CPU.v
	sed -i 's#StageReg_1(#StageReg_1(// IDEX ID_EX #' rtl/CPU.v
	sed -i 's#StageReg_2(#StageReg_2(// IDEXCTRL ID_EX_CTRL #' rtl/CPU.v
	sed -i 's#StageReg_3(#StageReg_3(// EXMEM EX_MEM #' rtl/CPU.v
	sed -i 's#StageReg_4(#StageReg_4(// EXMEMCTRL EX_MEM_CTRL #' rtl/CPU.v
	sed -i 's#StageReg_5(#StageReg_5(// MEMWB MEM_WB #' rtl/CPU.v
	sed -i 's#StageReg_6(#StageReg_6(// MEMWBCTRL MEM_WB_CTRL #' rtl/CPU.v
fi
echo -e "\n"