set outputDir build

open_checkpoint $outputDir/post_syn.dcp
place_design

report_utilization -file $outputDir/post_place_util.txt
report_timing -file $outputDir/post_place_max_paths.txt -nworst 5

write_checkpoint -force $outputDir/post_place
write_hwdef -force $outputDir/post_place.hwdef
