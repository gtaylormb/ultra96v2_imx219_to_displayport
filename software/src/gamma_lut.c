/*
FILENAME: gamma_lut.c
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
#include "xv_gamma_lut.h"
#include "xilinx-gamma-coeff.h"
#include "parameters.h"

int gamma_lut_init() {
	XV_gamma_lut gamma_lut;
	XV_gamma_lut_Config *gamma_lut_config;

	if ( (gamma_lut_config = XV_gamma_lut_LookupConfig(XPAR_AXI_VDMA_0_DEVICE_ID)) == NULL) {
		xil_printf("XV_gamma_lut_LookupConfig() failed\r\n");
		return XST_FAILURE;
	}
	if (XV_gamma_lut_CfgInitialize(&gamma_lut, gamma_lut_config, gamma_lut_config->BaseAddress)) {
		xil_printf("XV_gamma_lut_CfgInitialize() failed\r\n");
		return XST_FAILURE;
	}

	XV_gamma_lut_Set_HwReg_width(&gamma_lut, VIDEO_COLUMNS);
	XV_gamma_lut_Set_HwReg_height(&gamma_lut, VIDEO_ROWS);
    XV_gamma_lut_Set_HwReg_video_format(&gamma_lut, 0); // RGB

	if (XV_gamma_lut_Write_HwReg_gamma_lut_0_Words(&gamma_lut, 0, (int *) xgamma10_07,
			sizeof(xgamma10_10)/sizeof(int)) != sizeof(xgamma10_10)/sizeof(int)) {
		xil_printf("Gamma correction LUT write failed\r\n");
		return XST_FAILURE;
	}
	if (XV_gamma_lut_Write_HwReg_gamma_lut_1_Words(&gamma_lut, 0, (int *) xgamma10_07,
			sizeof(xgamma10_10)/sizeof(int)) != sizeof(xgamma10_10)/sizeof(int)) {
		xil_printf("Gamma correction LUT write failed\r\n");
		return XST_FAILURE;
	}
	if (XV_gamma_lut_Write_HwReg_gamma_lut_2_Words(&gamma_lut, 0, (int *) xgamma10_07,
			sizeof(xgamma10_10)/sizeof(int)) != sizeof(xgamma10_10)/sizeof(int)) {
		xil_printf("Gamma correction LUT write failed\r\n");
		return XST_FAILURE;
	}

	XV_gamma_lut_EnableAutoRestart(&gamma_lut);
	XV_gamma_lut_Start(&gamma_lut);

	xil_printf("Gamma correction LUT initialized\r\n");

	return XST_SUCCESS;
}

