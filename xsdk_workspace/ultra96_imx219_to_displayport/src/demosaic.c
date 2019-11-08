/*
FILENAME: demosaic.c
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
#include "xv_demosaic.h"
#include "parameters.h"
#include "demosaic.h"

int demosaic_init() {
	XV_demosaic demosaic;
	XV_demosaic_Config *demosaic_config;

	if ( (demosaic_config = XV_demosaic_LookupConfig(XPAR_V_DEMOSAIC_0_DEVICE_ID)) == NULL) {
		xil_printf("XV_demosaic_LookupConfig() failed\r\n");
		return XST_FAILURE;
	}
	if (XV_demosaic_CfgInitialize(&demosaic, demosaic_config, demosaic_config->BaseAddress)
			!= XST_SUCCESS) {
		xil_printf("XV_demosaic_CfgInitialize() failed\r\n");
		return XST_FAILURE;
	}

	XV_demosaic_Set_HwReg_width(&demosaic, VIDEO_COLUMNS);
	XV_demosaic_Set_HwReg_height(&demosaic, VIDEO_ROWS);
	XV_demosaic_Set_HwReg_bayer_phase(&demosaic, IMX219_BAYER_PHASE);

	if (!XV_demosaic_IsReady(&demosaic)) {
		xil_printf("demosaic core not ready\r\n");
		return XST_FAILURE;
	}
	XV_demosaic_EnableAutoRestart(&demosaic);
	XV_demosaic_Start(&demosaic);

	xil_printf("Demosiac module initialized\r\n");

	return XST_SUCCESS;
}
