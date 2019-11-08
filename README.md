# IMX219 MIPI sensor to Ultra96-V2 Displayport
=========
## About
This project enables 1080p 30FPS video from the Sony IMX219 to stream through the PL portion of the Zynq MPSoC on the Ultra96-V2 board to the DisplayPort. It uses all off the shelf IP blocks in Vivado, included with the SDSoC license that comes with the Ultra96. After wiring up the block design in IP Integrator within Vivado, most of the work was configurating the cores and the IMX219 in software. This should provide a good baseline design for doing video DSP in the PL between the MIPI input and the Displayport output.

The FPGA Block Diagram is exported as a TCL. To build run 'make bitstream' in the fpga folder. You should be able to open the Xilinx xsdk workspace directly.

## Hardware used
* Ultra96-V2 Zynq UltraScale + ZU3EG Evaluation Board
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
