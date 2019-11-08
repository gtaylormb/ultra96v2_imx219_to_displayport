# IMX219 MIPI sensor to Ultra96-V2 FPGA DisplayPort

## About
This project enables 1080p 30FPS video from the Raspberry Pi v2 camera (Sony IMX219) to stream through the PL portion of the Zynq MPSoC on the Ultra96-V2 board to the DisplayPort with very low latency. As the IMX219 is outputting 30FPS and my monitor (Dell P2214H) only supports 60HZ, this project requires the AXI Video DMA block to duplicate frames. It uses all off the shelf FPGA IP blocks in Vivado, included with the SDSoC license that comes with the Ultra96. After wiring up the block design in IP Integrator within Vivado, most of the work was configurating the cores and the IMX219 in software (running baremetal on the Zynq MPSoC PS). I had to do a lot of research and trial and error to get this to work, so hopefully this should save you some time and provide a good baseline design for doing video DSP in the PL between the MIPI input and the DisplayPort output.

The FPGA Block Diagram was exported as a TCL script. To build run 'make bitstream' on the command line in the fpga folder. You can also import the block diagram in the TCL script into a Vivado project by sourcing it inside the Vivado GUI. You should be able to open the Xilinx xsdk workspace directly.

Adam Taylor has a <a href="https://www.hackster.io/adam-taylor/mipi-procesing-with-ultra96-777721">very similiar project</a> using the Digilent Pcam 5C (Omnivision OV5640) at 720p.

## Hardware used
* Ultra96-V2 Zynq UltraScale+ ZU3EG Evaluation Board
* Raspberry Pi v2 camera (Sony IMX219 sensor)
* 96Boards MIPI Adapter

## IP cores used
* MIPI-CS2 Rx Subsystem
* Sensor Demosaic
* Gamma LUT
* AXI Video Direct Memory Access
* Video Timing Generator
* AXI-4 Stream to Video Out
* Video Test Pattern Generator (optional)

## Video demo
https://www.youtube.com/watch?v=tWB6uOOUVC8

## Block Diagram
<img src="https://i.imgur.com/w5njlpG.png">
