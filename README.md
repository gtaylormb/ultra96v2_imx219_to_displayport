# IMX219 MIPI sensor to Ultra96-V2 FPGA DisplayPort

## About
This project enables 1080p 30FPS video from the Raspberry Pi v2 camera (Sony IMX219) to stream through the PL portion of the Xilinx Zynq MPSoC on the Ultra96-V2 board to the DisplayPort with very low latency. It uses all off the shelf FPGA IP blocks in Vivado, included with the SDSoC license that comes with the Ultra96. After wiring up the block design in IP Integrator within Vivado, most of the work was configuring the cores and the IMX219 in software (running baremetal on the Zynq MPSoC PS). I had to do a lot of research and trial and error to get this to work, so hopefully this should save you some time and provide a good baseline design for doing video DSP in the PL between the MIPI input and the DisplayPort output.

The video clock is running at 148.5MHz for 1080p (provided by MMCM in PL), and the video cores and AXI configuration interfaces are running at 150MHz (provided by pl_clk0 output from PS).

As the IMX219 is outputting 30FPS and my monitor (Dell P2214H) only supports 60Hz, this project uses the AXI Video DMA block to duplicate frames. If your monitor can do 30Hz you may have luck removing it, I can't tell. 

The FPGA Block Diagram was exported as a TCL script. To build run 'make bitstream' on the command line in the fpga folder. You can also import the block diagram in the TCL script into a Vivado project by sourcing it inside the Vivado GUI. You should be able to open the Xilinx SDK workspace directly.

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
* AXI SmartConnect
* Video Timing Generator
* AXI-4 Stream to Video Out
* Video Test Pattern Generator (optional)
* Clocking Wizard (2x MMCMs to generate 200MHz for MIPI DPHY clock, 148.5MHz for video clock)

## Video demo
https://www.youtube.com/watch?v=tWB6uOOUVC8

## Block Diagram
<img src="https://i.imgur.com/w5njlpG.png">

## Utilization in xczu3eg (No Video TPG or ILAs)
    +----------------------------+-------+-------+-----------+-------+
    |          Site Type         |  Used | Fixed | Available | Util% |
    +----------------------------+-------+-------+-----------+-------+
    | CLB LUTs                   | 15352 |     0 |     70560 | 21.76 |
    |   LUT as Logic             | 14209 |     0 |     70560 | 20.14 |
    |   LUT as Memory            |  1143 |     0 |     28800 |  3.97 |
    |     LUT as Distributed RAM |   786 |     0 |           |       |
    |     LUT as Shift Register  |   357 |     0 |           |       |
    | CLB Registers              | 19828 |     0 |    141120 | 14.05 |
    |   Register as Flip Flop    | 19828 |     0 |    141120 | 14.05 |
    |   Register as Latch        |     0 |     0 |    141120 |  0.00 |
    | CARRY8                     |   368 |     0 |      8820 |  4.17 |
    | F7 Muxes                   |   200 |     0 |     35280 |  0.57 |
    | F8 Muxes                   |     1 |     0 |     17640 | <0.01 |
    | F9 Muxes                   |     0 |     0 |      8820 |  0.00 |
    +----------------------------+-------+-------+-----------+-------+
    
    +-------------------+------+-------+-----------+-------+
    |     Site Type     | Used | Fixed | Available | Util% |
    +-------------------+------+-------+-----------+-------+
    | Block RAM Tile    | 32.5 |     0 |       216 | 15.05 |
    |   RAMB36/FIFO*    |   28 |     0 |       216 | 12.96 |
    |     RAMB36E2 only |   28 |       |           |       |
    |   RAMB18          |    9 |     0 |       432 |  2.08 |
    |     RAMB18E2 only |    9 |       |           |       |
    +-------------------+------+-------+-----------+-------+
    
    +----------------+------+-------+-----------+-------+
    |    Site Type   | Used | Fixed | Available | Util% |
    +----------------+------+-------+-----------+-------+
    | DSPs           |    8 |     0 |       360 |  2.22 |
    |   DSP48E2 only |    8 |       |           |       |
    +----------------+------+-------+-----------+-------+
