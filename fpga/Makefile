#*******************************************************************************
#
#   FILENAME: Makefile
#   AUTHOR: Greg Taylor      CREATION DATE: 17 Oct 2014
#
#   DESCRIPTION: 
#	Run 'make sim-debug' to debug the design in the Modelsim GUI
#
#	Run 'make bitstream' to build the entire design (synthesis, P&R, bitstream)
#
#	Run 'make program' to program the FPGA (may have to modify script for your
#	setup)
#
#   CHANGE HISTORY:
#   17 Oct 2014        Greg Taylor
#       Initial version
#
#   Copyright (C) 2014 Greg Taylor <gtaylor@sonic.net>
#    
#   This file is part of imx219_to_mpsoc_displayport FPGA.
#    
#   imx219_to_mpsoc_displayport FPGA is free software: you can redistribute it and/or modify
#   it under the terms of the GNU Lesser General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#   
#   imx219_to_mpsoc_displayport FPGA is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU Lesser General Public License for more details.
#   
#   You should have received a copy of the GNU Lesser General Public License
#   along with imx219_to_mpsoc_displayport FPGA.  If not, see <http://www.gnu.org/licenses/>.
#   
#******************************************************************************
uname_O := $(shell sh -c 'uname -o 2>/dev/null || echo not')	

RTL_SRC = \
	
SIM_SRC = \
	
IP_SRC = \
	
BD_SRC = \
	bd/imx219_to_mpsoc_displayport_vivado2021.1.tcl
	
XDC_SRC = \
	constraints/Ultra96_V2_constraints_190430.xdc
	
INC_DIR0 = \
	modules/
	
SIM_LIB = \
	
compile: compile_sim_lib
	test -e work || vlib work
	vlog -incr $(SIM_SRC) $(RTL_SRC) +define+SIM +incdir+$(INC_DIR0)
	
compile_sim_lib:
	test -e sim_lib || (vlib sim_lib && vlog -work sim_lib -incr $(SIM_LIB))	
		 
sim: compile-eval
	vsim -L sim_lib -c imx219_to_mpsoc_displayport_tb glbl -do "run -a"
	
# Launch the Modelsim GUI for debugging design		
sim-debug: compile
ifneq (, $(findstring Cygwin, $(uname_O)))
	cygstart vsim -L sim_lib imx219_to_mpsoc_displayport_tb glbl -voptargs=+acc
else
	vsim -L sim_lib imx219_to_mpsoc_displayport_tb glbl -voptargs=+acc
endif

bd: build/design_1/design_1.bd
	
syn: build/post_syn.dcp

place: build/post_place.dcp

route: build/post_route.dcp

bitstream: build/imx219_to_mpsoc_displayport.bit

program: build/imx219_to_mpsoc_displayport.bit
	vivado -mode batch -source scripts/vivado_program.tcl -log build/program_log.txt -nojournal
	
clean:
	rm -rf  *.tmp  *.log  log transcript work *.wlf vsim.fcdb
	rm -rf *~ core csrc simv* vc_hdrs.h ucli.key urg* *.log core.* synlog.tcl
	rm -rf sim_lib build usage_stat* ipshared/ .Xil
	
build/design_1/design_1.bd: $(BD_SRC)
	test -e build || mkdir build
	vivado -mode batch -source scripts/vivado_bd.tcl -nojournal \
	-log build/bd_log.txt -tclargs "$(BD_SRC)"

build/post_syn.dcp: $(RTL_SRC) $(IP_SRC) $(XDC_SRC) build/design_1/design_1.bd
	test -e build || mkdir build
	vivado -mode batch -source scripts/vivado_syn.tcl -nojournal \
	-log build/syn_log.txt -tclargs "$(RTL_SRC)" "$(INC_DIR0)" "$(IP_SRC)" "$(XDC_SRC)"

build/post_place.dcp: build/post_syn.dcp
	vivado -mode batch -source scripts/vivado_place.tcl -log build/place_log.txt -nojournal

build/post_route.dcp: build/post_place.dcp
	vivado -mode batch -source scripts/vivado_route.tcl -log build/route_log.txt -nojournal
	
build/imx219_to_mpsoc_displayport.bit: build/post_route.dcp
	vivado -mode batch -source scripts/vivado_bitstream.tcl -log build/bitstream_log.txt -nojournal	
