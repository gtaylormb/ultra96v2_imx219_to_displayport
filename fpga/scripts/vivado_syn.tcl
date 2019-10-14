set RTL_SRC [lindex $argv 0]
set INC_DIR0 [lindex $argv 1]
set IP_SRC [lindex $argv 2]
set BD_SRC [lindex $argv 3]
set XDC_SRC [lindex $argv 4]

set outputDir build

create_project -part xczu3eg-sbva484-1-e -in_memory
set_property target_language Verilog [current_project]
set_property default_lib work [current_project]

add_files $outputDir/design_1/design_1.bd
generate_target all -force [get_files build/design_1/design_1.bd]
compile_c [get_ips]
make_wrapper -files [get_files $outputDir/design_1/design_1.bd] -top -import -force
synth_design -name imx219_to_mpsoc_displayport -part xczu3eg-sbva484-1-e -top design_1_wrapper -include_dirs ${INC_DIR0}
opt_design
report_utilization -file $outputDir/post_syn_util.txt

write_checkpoint -force $outputDir/post_syn
