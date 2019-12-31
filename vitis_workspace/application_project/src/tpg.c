/*
FILENAME: tpg.c
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
#include "xv_tpg.h"
#include "xvidc.h"
#include "parameters.h"

int tpg_init() {
	XV_tpg tpg;
	XV_tpg_Config *tpg_config;

    if ( (tpg_config = XV_tpg_LookupConfig(XPAR_XV_TPG_0_DEVICE_ID)) == NULL) {
		xil_printf("XV_tpg_LookupConfig() failed\r\n");
		return XST_FAILURE;
	}
    if (XV_tpg_CfgInitialize(&tpg, tpg_config, tpg_config->BaseAddress) != XST_SUCCESS) {
		xil_printf("XV_tpg_CfgInitialize() failed\r\n");
		return XST_FAILURE;
	}

	XV_tpg_Set_height(&tpg, VIDEO_ROWS);
	XV_tpg_Set_width(&tpg, VIDEO_COLUMNS);
	XV_tpg_Set_colorFormat(&tpg, XVIDC_CSF_RGB);
	XV_tpg_Set_maskId(&tpg, 0x0);
	XV_tpg_Set_motionSpeed(&tpg, 0x4);
	XV_tpg_Set_bckgndId(&tpg, XTPG_BKGND_TARTAN_COLOR_BARS);

	XV_tpg_Set_passthruStartX(&tpg, 0);
	XV_tpg_Set_passthruStartY(&tpg, 0);
	XV_tpg_Set_passthruEndX(&tpg, VIDEO_COLUMNS);
	XV_tpg_Set_passthruEndY(&tpg, VIDEO_ROWS);
	xil_printf("Test pattern generator configured for passthrough video\r\n");

	XV_tpg_Set_enableInput(&tpg, 1);
	XV_tpg_EnableAutoRestart(&tpg);
	XV_tpg_Start(&tpg);

	xil_printf("Test pattern generator initialized\r\n");

	return XST_SUCCESS;
}

