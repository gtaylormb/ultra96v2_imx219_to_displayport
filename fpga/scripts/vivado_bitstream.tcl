set outputDir build

open_checkpoint $outputDir/post_route.dcp

write_bitstream -force $outputDir/imx219_to_mpsoc_displayport.bit
write_debug_probes -force $outputDir/imx219_to_mpsoc_displayport.ltx

#Use this for Vivado 2019.1 (xsdk)
#write_sysdef -force -hwdef $outputDir/post_place.hwdef -bitfile $outputDir/imx219_to_mpsoc_displayport.bit -file $outputDir/imx219_to_mpsoc_displayport.hdf

#Use this for Vivado 2019.2 (vitis)
set_property board_part em.avnet.com:ultra96v2:part0:1.0 [current_project]
write_hw_platform -fixed -force -include_bit $outputDir/imx219_to_mpsoc_displayport.xsa
