

all:
	sed -i '/`ifndef SYNTHESIS/,/`endif \/\/ SYNTHESIS/d' rtl/CPU.v
	sed -i '/`ifdef/,/`endif/d' rtl/CPU.v
	sed -i '/`ifndef/,/`endif/d' rtl/CPU.v
	./check_include.sh 	rtl/CPU.v