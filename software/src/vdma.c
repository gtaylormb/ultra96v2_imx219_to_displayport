/*
FILENAME: vdma.c
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
#include "xaxivdma.h"
#include "parameters.h"
#include "vdma.h"

int vdma_init() {
	XAxiVdma vdma;
	XAxiVdma_Config *vdma_config;
	XAxiVdma_DmaSetup dma_setup;
	u32 addr;

	if ( (vdma_config = XAxiVdma_LookupConfig(XPAR_AXI_VDMA_0_DEVICE_ID)) == NULL) {
		xil_printf("XAxiVdma_LookupConfig() failed\r\n");
		return XST_FAILURE;
	}
	if (XAxiVdma_CfgInitialize(&vdma, vdma_config, vdma_config->BaseAddress) != XST_SUCCESS) {
		xil_printf("XAxiVdma_CfgInitialize() failed\r\n");
		return XST_FAILURE;
	}

	if (XAxiVdma_Selftest(&vdma) != XST_SUCCESS) {
		xil_printf("XAxiVdma_Selftest() failed\r\n");
		return XST_FAILURE;
	}

	memset(&dma_setup, 0, sizeof(XAxiVdma_DmaSetup));
	dma_setup.VertSizeInput = VIDEO_ROWS;
	dma_setup.HoriSizeInput = VIDEO_COLUMNS*(vdma_config->Mm2SStreamWidth>>3);
	dma_setup.Stride = dma_setup.HoriSizeInput;
	dma_setup.FrameDelay = 0;
	dma_setup.EnableCircularBuf = 1;
	dma_setup.EnableSync = 1;
	dma_setup.PointNum = 0;
	dma_setup.EnableFrameCounter = 0;
    dma_setup.FixedFrameStoreAddr = 0;
    dma_setup.GenLockRepeat = 0;
    dma_setup.EnableVFlip = 0;

    if (XAxiVdma_DmaConfig(&vdma, XAXIVDMA_WRITE, &dma_setup) != XST_SUCCESS) {
    	xil_printf("XAxiVdma_DmaConfig() for write engine failed\r\n");
		return XST_FAILURE;
    }
    if (XAxiVdma_DmaConfig(&vdma, XAXIVDMA_READ, &dma_setup) != XST_SUCCESS) {
    	xil_printf("XAxiVdma_DmaConfig() for read engine failed\r\n");
		return XST_FAILURE;
    }

	addr = VDMA_BUFFER_ADDR;

	for (int i = 0; i < MAX_NUM_FRAMES; i++) {
		dma_setup.FrameStoreStartAddr[i] = addr;
		addr += dma_setup.HoriSizeInput*dma_setup.VertSizeInput;
	}

    if (XAxiVdma_DmaSetBufferAddr(&vdma, XAXIVDMA_WRITE, dma_setup.FrameStoreStartAddr) != XST_SUCCESS) {
    	xil_printf("XAxiVdma_DmaSetBufferAddr() for write engine failed\r\n");
		return XST_FAILURE;
    }

    if (XAxiVdma_DmaSetBufferAddr(&vdma, XAXIVDMA_READ, dma_setup.FrameStoreStartAddr) != XST_SUCCESS) {
    	xil_printf("XAxiVdma_DmaSetBufferAddr() for read engine failed\r\n");
		return XST_FAILURE;
    }

    if (XAxiVdma_DmaStart(&vdma, XAXIVDMA_WRITE) != XST_SUCCESS) {
    	xil_printf("XAxiVdma_DmaStart() for write engine failed\r\n");
		return XST_FAILURE;
    }

    if (XAxiVdma_DmaStart(&vdma, XAXIVDMA_READ) != XST_SUCCESS) {
    	xil_printf("XAxiVdma_DmaStart() for read engine failed\r\n");
		return XST_FAILURE;
    }

    xil_printf("Video DMA initialized\r\n");

	return XST_SUCCESS;
}

