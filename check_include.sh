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
echo -e "\n"