/*
FILENAME: displayport.c
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
#include "xdpdma.h"			/* DPDMA device driver */
#include "xscugic.h"		/* Interrupt controller device driver */
#include "xdppsu.h"			/* DP controller device driver */
#include "xavbuf.h"    		/* AVBUF is the video pipeline driver */
#include "xavbuf_clk.h"		/* Clock Driver for Video(VPLL) and Audio(RPLL) clocks */
#include "xscugic.h"		/* Interrupt controller device driver */
#include "displayport.h"

XDpPsu dppsu;
XDpDma dpdma;

static int dummy_user_data = 0;

int displayport_init() {
	XDpPsu_Config *dppsu_config;
	XAVBuf avbuf;
	XDpDma_Config *dpdma_config;

	memset(&avbuf, 0, sizeof(XAVBuf)); // XAVBuf_CfgInitialize does not properly initialize

	if ( (dppsu_config = XDpPsu_LookupConfig(XPAR_PSU_DP_DEVICE_ID)) == NULL) {
		xil_printf("XDpPsu_LookupConfig() failed\r\n");
		return XST_FAILURE;
	}
	XDpPsu_CfgInitialize(&dppsu, dppsu_config, dppsu_config->BaseAddr);
	XAVBuf_CfgInitialize(&avbuf, dppsu_config->BaseAddr, XPAR_PSU_DP_DEVICE_ID);
	if ( (dpdma_config = XDpDma_LookupConfig(XPAR_PSU_DPDMA_DEVICE_ID)) == NULL) {
		xil_printf("XDpDma_LookupConfig() failed\r\n");
		return XST_FAILURE;
	}
	XDpDma_CfgInitialize(&dpdma, dpdma_config);

	if (XDpPsu_InitializeTx(&dppsu) != XST_SUCCESS) {
		xil_printf("XDpPsu_InitializeTx() failed\r\n");
		return XST_FAILURE;
	}

	XDpDma_SetQOS(&dpdma, 11);
	if (XAVBuf_SetInputLiveVideoFormat(&avbuf, INPUT_VIDEO_FORMAT) != XST_SUCCESS) {
		xil_printf("XAVBuf_SetInputLiveVideoFormat() failed\r\n");
		return XST_FAILURE;
	}
	XAVBuf_EnableVideoBuffers(&avbuf, 1);
	if (XAVBuf_SetOutputVideoFormat(&avbuf, INPUT_VIDEO_FORMAT) != XST_SUCCESS) {
		xil_printf("XAVBuf_SetOutputVideoFormat() failed\r\n");
		return XST_FAILURE;
	}
	XAVBuf_InputVideoSelect(&avbuf, XAVBUF_VIDSTREAM1_LIVE, XAVBUF_VIDSTREAM2_NONE);
	XAVBuf_ConfigureOutputVideo(&avbuf);
	XAVBuf_SetBlenderAlpha(&avbuf, 0, 0); 	// Disable the global alpha
	XDpPsu_CfgMsaEnSynchClkMode(&dppsu, 0);
	XAVBuf_SetAudioVideoClkSrc(&avbuf, XAVBUF_PL_CLK, XAVBUF_PS_CLK);
	XAVBuf_SoftReset(&avbuf);

	xil_printf("Displayport initialized\r\n");

	return XST_SUCCESS;
}

int displayport_setup_interrupts() {
	XScuGic	ic;
	XScuGic_Config *ic_config;

	u32 interrupt_mask = XDPPSU_INTR_HPD_IRQ_MASK | XDPPSU_INTR_HPD_EVENT_MASK;

	XDpPsu_WriteReg(dppsu.Config.BaseAddr, XDPPSU_INTR_DIS, 0xFFFFFFFF);
	XDpPsu_WriteReg(dppsu.Config.BaseAddr, XDPPSU_INTR_MASK, 0xFFFFFFFF);

	XDpPsu_SetHpdEventHandler(&dppsu, displayport_hpd_event_isr, &dummy_user_data);
	XDpPsu_SetHpdPulseHandler(&dppsu, displayport_hpd_pulse_isr, &dummy_user_data);

	if ( (ic_config = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID)) == NULL) {
		xil_printf("XScuGic_LookupConfig() failed\r\n");
		return XST_FAILURE;
	}
	if (XScuGic_CfgInitialize(&ic, ic_config, ic_config->CpuBaseAddress) != XST_SUCCESS) {
		xil_printf("XScuGic_CfgInitialize() failed\r\n");
		return XST_FAILURE;
	}

	/* Register ISRs. */
	if (XScuGic_Connect(&ic, DPPSU_INTR_ID,
			(Xil_InterruptHandler) XDpPsu_HpdInterruptHandler, &dppsu) != XST_SUCCESS) {
		xil_printf("XScuGic_Connect() failed\r\n");
		return XST_FAILURE;
	}

	/* Trigger DP interrupts on rising edge. */
	XScuGic_SetPriorityTriggerType(&ic, DPPSU_INTR_ID, 0x0, 0x03);

	/* Connect DPDMA Interrupt */
	if (XScuGic_Connect(&ic, DPDMA_INTR_ID,
			(Xil_ExceptionHandler) XDpDma_InterruptHandler, &dppsu) != XST_SUCCESS) {
		xil_printf("XScuGic_Connect() failed\r\n");
		return XST_FAILURE;
	}

	/* Initialize exceptions. */
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
			(Xil_ExceptionHandler) XScuGic_DeviceInterruptHandler,
			XPAR_SCUGIC_0_DEVICE_ID);

	/* Enable exceptions for interrupts. */
	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);
	Xil_ExceptionEnable();

	/* Enable DP interrupts. */
	XScuGic_Enable(&ic, DPPSU_INTR_ID);
	XDpPsu_WriteReg(dppsu.Config.BaseAddr, XDPPSU_INTR_EN, interrupt_mask);

	/* Enable DPDMA Interrupts */
	XScuGic_Enable(&ic, DPDMA_INTR_ID);
	XDpDma_InterruptEnable(&dpdma, XDPDMA_IEN_VSYNC_INT_MASK);

	return XST_SUCCESS;
}

void displayport_hpd_event_isr() {
	u8 aux_data = 0x1;
	u8 count = 0;
	u32 status;

	xil_printf("Displayport hot-plug event detected\r\n");

	XDpPsu_EnableMainLink(&dppsu, 0);

	if (!XDpPsu_IsConnected(&dppsu)) {
		xil_printf("Displayport monitor disconnected.\n\r");
		return;
	}
	else {
		xil_printf("Displayport monitor connected\n\r");
	}

	if (XDpPsu_AuxWrite(&dppsu, XDPPSU_DPCD_SET_POWER_DP_PWR_VOLTAGE, 1, &aux_data) != XST_SUCCESS) {
		xil_printf("\t! 1st power wake-up - AUX write failed.\n\r");
	}
	if (XDpPsu_AuxWrite(&dppsu, XDPPSU_DPCD_SET_POWER_DP_PWR_VOLTAGE, 1, &aux_data) != XST_SUCCESS) {
		xil_printf("\t! 2nd power wake-up - AUX write failed.\n\r");
	}

	do {
		usleep(100000);
		count++;

		status = display_port_hpd_train();
		if (status == XST_DEVICE_NOT_FOUND) {
			xil_printf("Lost connection\n\r");
			return;
		}
		else if (status != XST_SUCCESS)
			continue;

		displayport_setup_video_stream();
		XDpPsu_EnableMainLink(&dppsu, 1);

		status = XDpPsu_CheckLinkStatus(&dppsu, dppsu.LinkConfig.LaneCount);
		if (status == XST_DEVICE_NOT_FOUND)
			return;
	} while ((status != XST_SUCCESS) && (count < 2));
}

u32 display_port_hpd_train() {
	XDpPsu_LinkConfig *link_config = &dppsu.LinkConfig;

	if (XDpPsu_GetRxCapabilities(&dppsu) != XST_SUCCESS) {
		xil_printf("\t! Error getting RX caps.\n\r");
		return XST_FAILURE;
	}

	if (XDpPsu_SetEnhancedFrameMode(&dppsu,
			link_config->SupportEnhancedFramingMode ? 1 : 0) != XST_SUCCESS) {
		xil_printf("\t! EFM set failed.\n\r");
		return XST_FAILURE;
	}

	if (XDpPsu_SetLaneCount(&dppsu, link_config->MaxLaneCount) != XST_SUCCESS) {
		xil_printf("\t! Lane count set failed.\n\r");
		return XST_FAILURE;
	}

	if (XDpPsu_SetLinkRate(&dppsu, link_config->MaxLinkRate) != XST_SUCCESS) {
		xil_printf("\t! Link rate set failed.\n\r");
		return XST_FAILURE;
	}

	if (XDpPsu_SetDownspread(&dppsu, link_config->SupportDownspreadControl)
			!= XST_SUCCESS) {
		xil_printf("\t! Setting downspread failed.\n\r");
		return XST_FAILURE;
	}

	xil_printf("Lane count = %d\n\r", dppsu.LinkConfig.LaneCount);
	xil_printf("Link rate = ");
	switch (dppsu.LinkConfig.LinkRate) {
	case 0x06:
		xil_printf("162Gbps\r\n");
		break;
	case 0x0A:
		xil_printf("270Gbps\r\n");
		break;
	case 0x14:
		xil_printf("540Gbps\r\n");
		break;
	default:
		xil_printf("Unknown\r\n");
	}

	// Link training sequence is done
	xil_printf("Starting Training...\n\r");
	if (XDpPsu_EstablishLink(&dppsu) == XST_SUCCESS)
		xil_printf("Training succeeded.\n\r");
	else
		xil_printf("\t! Training failed.\n\r");

	return XST_SUCCESS;
}

void displayport_setup_video_stream() {
	XDpPsu_MainStreamAttributes *msa_config = &dppsu.MsaConfig;

	XDpPsu_SetColorEncode(&dppsu, COLOR_ENCODING);
	XDpPsu_CfgMsaSetBpc(&dppsu, BPC);
	XDpPsu_CfgMsaUseStandardVideoMode(&dppsu, VIDEO_MODE);

	XAVBuf_SetPixelClock(msa_config->PixelClockHz);

	/* Reset the transmitter. */
	XDpPsu_WriteReg(dppsu.Config.BaseAddr, XDPPSU_SOFT_RESET, 0x1);
	usleep(10);
	XDpPsu_WriteReg(dppsu.Config.BaseAddr, XDPPSU_SOFT_RESET, 0x0);

	XDpPsu_SetMsaValues(&dppsu);
	/* Issuing a soft-reset (AV_BUF_SRST_REG). */
	XDpPsu_WriteReg(dppsu.Config.BaseAddr, 0xB124, 0x3); // Assert reset.
	usleep(10);
	XDpPsu_WriteReg(dppsu.Config.BaseAddr, 0xB124, 0x0); // De-ssert reset.

	XDpPsu_EnableMainLink(&dppsu, 1);
}

void displayport_hpd_pulse_isr() {
	u32 status;
	u8 count = 0;

	xil_printf("Displayport hot-plug pulse detected\r\n");

	if (XDpPsu_CheckLinkStatus(&dppsu, dppsu.LinkConfig.LaneCount) == XST_DEVICE_NOT_FOUND) {
		xil_printf("Lost connection .......... HPD pulse\n\r");
		return;
	}

	xil_printf("Re-training required.\n\r");

	XDpPsu_EnableMainLink(&dppsu, 0);

	do {
		count++;

		status = display_port_hpd_train();
		if (status == XST_DEVICE_NOT_FOUND) {
			xil_printf("Lost connection .......... HPD pulse\n\r");
			return;
		}
		else if (status != XST_SUCCESS) {
			continue;
		}

		displayport_setup_video_stream();
		XDpPsu_EnableMainLink(&dppsu, 1);

		status = XDpPsu_CheckLinkStatus(&dppsu, dppsu.LinkConfig.LaneCount);
		if (status == XST_DEVICE_NOT_FOUND) {
			xil_printf("Lost connection .......... HPD pulse\n\r");
			return;
		}
	} while ((status != XST_SUCCESS) && (count < 2));
}
