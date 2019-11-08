/*
FILENAME: vtc.c
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
#include "xvtc.h"

int vtc_init() {
	XVtc vtc;
	XVtc_Config *vtc_config;

    if ( (vtc_config = XVtc_LookupConfig(XPAR_VTC_0_DEVICE_ID)) == NULL) {
		xil_printf("XVtc_LookupConfig() failed\r\n");
		return XST_FAILURE;
	}
    if (XVtc_CfgInitialize(&vtc, vtc_config, vtc_config->BaseAddress) != XST_SUCCESS) {
		xil_printf("XVtc_CfgInitialize() failed\r\n");
		return XST_FAILURE;
	}
	XVtc_EnableGenerator(&vtc);
	XVtc_Enable(&vtc);

	xil_printf("Video timing generator initialized\r\n");

	return XST_SUCCESS;
}
