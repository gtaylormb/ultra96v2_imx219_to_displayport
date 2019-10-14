set BD_SRC [lindex $argv 0]

set outputDir build

create_project -part xczu3eg-sbva484-1-e -in_memory
set_property target_language Verilog [current_project]
set_property default_lib work [current_project]

source ${BD_SRC}

save_bd_design_as -dir $outputDir -force design_1.bd

