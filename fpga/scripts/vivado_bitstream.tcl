set outputDir build

open_checkpoint $outputDir/post_route.dcp

write_bitstream -force $outputDir/imx219_to_mpsoc_displayport.bit
write_debug_probes -force $outputDir/imx219_to_mpsoc_displayport.ltx
write_sysdef -force -hwdef $outputDir/post_place.hwdef -bitfile $outputDir/imx219_to_mpsoc_displayport.bit -file $outputDir/imx219_to_mpsoc_displayport.hdf
