# IMX219 MIPI sensor to Ultra96-V2/Kria KV260 FPGA DisplayPort

## News
2021-12-18
* I finally got my KV260 so the project works on that board now as well!

2021-8-22
* The FPGA build scripts and software have been updated to optionally target the Kria KV260 Vision AI Starter Kit. This board is cheaper than the Ultra96-V2, more powerful, and does not require the MIPI adaptor mezzanine
  which has been hard to come by. My board is on backorder until next year apparently so I haven't tested it. Please let me know if anyone has success with this.

## About
This project enables 1080p 30FPS video from the Raspberry Pi v2 camera (Sony IMX219) to stream through the PL portion of the Xilinx Zynq MPSoC DisplayPort with very low latency. It uses all off the shelf FPGA IP blocks
in Vivado, all included with the free WebPACK version of the software. After wiring up the block design in IP Integrator within Vivado, most of the work was configuring the cores and the IMX219 in software
(running baremetal on the Zynq MPSoC PS). I had to do a lot of research and trial and error to get this to work, so hopefully this should save you some time and provide a good baseline design for doing video DSP in the
PL between the MIPI input and the DisplayPort output.

The video clock is running at 148.5MHz for 1080p (provided by MMCM in PL), and the video cores and AXI configuration interfaces are running at 150MHz for the Ultra96-V2, 250MHz for the KV260 (provided by pl_clk0 output from PS).

As the IMX219 is outputting 30FPS and my monitor (Dell P2214H) only supports 60Hz, this project uses the AXI Video DMA block to duplicate frames. If your monitor can do 30Hz you may have luck removing it, I can't tell. 

The FPGA Block Diagram was exported as a TCL script. Set line 39 of `fpga/Makefile` to your board type:

    # set to ultra96v2 or kv260
    BOARD = kv260

To build run `make bitstream` on the command line in the fpga folder. You can also import the block diagram in the TCL script into a Vivado project by sourcing it inside the Vivado GUI.

Create a new Vitis workspace, a new platform project from `fpga/build/imx219_to_mpsoc_displayport.xsa` created by `make bitstream` above, a new empty C application project and then copy `software/src/*` into the application source directory.
Set line 39 of `src/parameters.h` to your board type:

    #define BOARD           KV260 // set to ULTRA96 or KV260

Adam Taylor has a <a href="https://www.hackster.io/adam-taylor/mipi-procesing-with-ultra96-777721">very similiar project</a> using the Digilent Pcam 5C (Omnivision OV5640) at 720p.

## Hardware used
* <a href="http://zedboard.org/product/ultra96-v2-development-board">Ultra96-V2 Zynq UltraScale+ ZU3EG Evaluation Board</a> OR <a href="https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html">Kria KV260 Vision AI Starter Kit</a>
* <a href="https://www.raspberrypi.org/products/camera-module-v2/">Raspberry Pi v2 camera (Sony IMX219 sensor)</a>
* <a href="https://www.96boards.org/product/mipiadapter/">AiStarVision 96Boards MIPI Adapter V2.1 (only required for Ultra96-V2)</a>

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
    +----------------------------+-------+-------+------------+-----------+-------+
    |          Site Type         |  Used | Fixed | Prohibited | Available | Util% |
    +----------------------------+-------+-------+------------+-----------+-------+
    | CLB LUTs                   | 20929 |     0 |          0 |     70560 | 29.66 |
    |   LUT as Logic             | 19396 |     0 |          0 |     70560 | 27.49 |
    |   LUT as Memory            |  1533 |     0 |          0 |     28800 |  5.32 |
    |     LUT as Distributed RAM |   866 |     0 |            |           |       |
    |     LUT as Shift Register  |   667 |     0 |            |           |       |
    | CLB Registers              | 26934 |     0 |          0 |    141120 | 19.09 |
    |   Register as Flip Flop    | 26934 |     0 |          0 |    141120 | 19.09 |
    |   Register as Latch        |     0 |     0 |          0 |    141120 |  0.00 |
    | CARRY8                     |   389 |     0 |          0 |      8820 |  4.41 |
    | F7 Muxes                   |   213 |     0 |          0 |     35280 |  0.60 |
    | F8 Muxes                   |     1 |     0 |          0 |     17640 | <0.01 |
    | F9 Muxes                   |     0 |     0 |          0 |      8820 |  0.00 |
    +----------------------------+-------+-------+------------+-----------+-------+
    
    +-------------------+------+-------+------------+-----------+-------+
    |     Site Type     | Used | Fixed | Prohibited | Available | Util% |
    +-------------------+------+-------+------------+-----------+-------+
    | Block RAM Tile    | 40.5 |     0 |          0 |       216 | 18.75 |
    |   RAMB36/FIFO*    |   36 |     0 |          0 |       216 | 16.67 |
    |     RAMB36E2 only |   36 |       |            |           |       |
    |   RAMB18          |    9 |     0 |          0 |       432 |  2.08 |
    |     RAMB18E2 only |    9 |       |            |           |       |
    +-------------------+------+-------+------------+-----------+-------+
    
    +----------------+------+-------+------------+-----------+-------+
    |    Site Type   | Used | Fixed | Prohibited | Available | Util% |
    +----------------+------+-------+------------+-----------+-------+
    | DSPs           |    8 |     0 |          0 |       360 |  2.22 |
    |   DSP48E2 only |    8 |       |            |           |       |
    +----------------+------+-------+------------+-----------+-------+
    
## Utilization in xck26 (No Video TPG or ILAs)
    +----------------------------+-------+-------+------------+-----------+-------+
    |          Site Type         |  Used | Fixed | Prohibited | Available | Util% |
    +----------------------------+-------+-------+------------+-----------+-------+
    | CLB LUTs                   | 20943 |     0 |          0 |    117120 | 17.88 |
    |   LUT as Logic             | 19410 |     0 |          0 |    117120 | 16.57 |
    |   LUT as Memory            |  1533 |     0 |          0 |     57600 |  2.66 |
    |     LUT as Distributed RAM |   866 |     0 |            |           |       |
    |     LUT as Shift Register  |   667 |     0 |            |           |       |
    | CLB Registers              | 26405 |     0 |          0 |    234240 | 11.27 |
    |   Register as Flip Flop    | 26405 |     0 |          0 |    234240 | 11.27 |
    |   Register as Latch        |     0 |     0 |          0 |    234240 |  0.00 |
    | CARRY8                     |   389 |     0 |          0 |     14640 |  2.66 |
    | F7 Muxes                   |   213 |     0 |          0 |     58560 |  0.36 |
    | F8 Muxes                   |     1 |     0 |          0 |     29280 | <0.01 |
    | F9 Muxes                   |     0 |     0 |          0 |     14640 |  0.00 |
    +----------------------------+-------+-------+------------+-----------+-------+
    
    +-------------------+------+-------+------------+-----------+-------+
    |     Site Type     | Used | Fixed | Prohibited | Available | Util% |
    +-------------------+------+-------+------------+-----------+-------+
    | Block RAM Tile    | 31.5 |     0 |          0 |       144 | 21.88 |
    |   RAMB36/FIFO*    |   28 |     0 |          0 |       144 | 19.44 |
    |     RAMB36E2 only |   28 |       |            |           |       |
    |   RAMB18          |    7 |     0 |          0 |       288 |  2.43 |
    |     RAMB18E2 only |    7 |       |            |           |       |
    | URAM              |    2 |     0 |          0 |        64 |  3.13 |
    +-------------------+------+-------+------------+-----------+-------+

    +----------------+------+-------+------------+-----------+-------+
    |    Site Type   | Used | Fixed | Prohibited | Available | Util% |
    +----------------+------+-------+------------+-----------+-------+
    | DSPs           |    8 |     0 |          0 |      1248 |  0.64 |
    |   DSP48E2 only |    8 |       |            |           |       |
    +----------------+------+-------+------------+-----------+-------+
