set RTL_SRC [lindex $argv 0]
set INC_DIR0 [lindex $argv 1]
set IP_SRC [lindex $argv 2]
set XDC_SRC [lindex $argv 3]
set BOARD [lindex $argv 4]

set outputDir build

if {[string equal ${BOARD} "ultra96v2"]} {
    create_project -part xczu3eg-sbva484-1-e -in_memory
    set_property board_part em.avnet.com:ultra96v2:part0:1.0 [current_project]	
} elseif {[string equal ${BOARD} "kv260"]} {
    create_project -part xck26-sfvc784-2LV-c -in_memory
    set_property board_part xilinx.com:kv260_som:part0:1.2 [current_project]
    set_property board_connections {som240_1_connector xilinx.com:kv260_carrier:som240_1_connector:1.2} [current_project]
}
set_property target_language Verilog [current_project]
set_property default_lib work [current_project]

add_files $outputDir/design_1/design_1.bd
generate_target all -force [get_files build/design_1/design_1.bd]
compile_c [get_ips]
make_wrapper -files [get_files $outputDir/design_1/design_1.bd] -top -import -force
synth_design -name imx219_to_mpsoc_displayport -top design_1_wrapper -include_dirs ${INC_DIR0}
read_xdc ${XDC_SRC}
opt_design
report_utilization -file $outputDir/post_syn_util.txt

write_checkpoint -force $outputDir/post_syn
