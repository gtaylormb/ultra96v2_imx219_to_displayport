set BD_SRC [lindex $argv 0]
set BOARD [lindex $argv 1]

set outputDir build

if {[string equal ${BOARD} "ultra96v2"]} {
    create_project -part xczu3eg-sbva484-1-e -in_memory
    set_property board_part em.avnet.com:ultra96v2:part0:1.0 [current_project]	
} elseif {[string equal ${BOARD} "kv260"]} {
    create_project -part xck26-sfvc784-2LV-c -in_memory
    set_property board_part xilinx.com:kv260:part0:1.1 [current_project]
    set_property board_connections {som240_1_connector xilinx.com:som240:som240_1_connector:1.0} [current_project]
}
set_property target_language Verilog [current_project]
set_property default_lib work [current_project]

source ${BD_SRC}

save_bd_design_as -dir $outputDir -force design_1.bd

