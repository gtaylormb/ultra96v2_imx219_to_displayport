set BOARD [lindex $argv 0]

set outputDir build

open_checkpoint $outputDir/post_route.dcp

write_bitstream -force $outputDir/imx219_to_mpsoc_displayport.bit
write_debug_probes -force $outputDir/imx219_to_mpsoc_displayport.ltx

#Use this for Vivado 2019.1 (xsdk)
#write_sysdef -force -hwdef $outputDir/post_place.hwdef -bitfile $outputDir/imx219_to_mpsoc_displayport.bit -file $outputDir/imx219_to_mpsoc_displayport.hdf

#Use this for Vivado 2019.2 and up (vitis)
if {[string equal ${BOARD} "ultra96v2"]} {
    set_property board_part em.avnet.com:ultra96v2:part0:1.0 [current_project]	
} elseif {[string equal ${BOARD} "kv260"]} {
    set_property board_part xilinx.com:kv260_som:part0:1.2 [current_project]
    set_property board_connections {som240_1_connector xilinx.com:kv260_carrier:som240_1_connector:1.2} [current_project]
}
write_hw_platform -fixed -force -include_bit $outputDir/imx219_to_mpsoc_displayport.xsa
