/*
FILENAME: main.c
AUTHOR: Greg Taylor     CREATION DATE: 12 Aug 2019

DESCRIPTION:

CHANGE HISTORY:
12 Aug 2019		Greg Taylor
	Initial version

MIT License

Copyright (c) 2019 Greg Taylor <gtaylor@sonic.net>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 */
#include "platform.h"
#include "xil_printf.h"
#include "displayport.h"
#include "vtc.h"
#include "imx219.h"
#include "mipi.h"
#include "demosaic.h"
#include "tpg.h"
#include "vdma.h"
#include "gamma_lut.h"

int main() {
    init_platform();

    xil_printf("Starting...\r\n");
    displayport_init();
    displayport_setup_interrupts();
    vtc_init();
	tpg_init();
	vdma_init();
	gamma_lut_init();
	demosaic_init();
	mipi_init();
	imx219_init();

	xil_printf("Entire video pipeline activated\r\n");

    cleanup_platform();
    return 0;
}
