/*
 * vproc.c
 *
 *  Created on: Sep 12, 2019
 *      Author: centos
 *
#include "xvprocss.h"

int vproc_init() {
	XVprocSs vproc;
	XVprocSs_Config *vproc_config;

	xil_printf("Initializing Video Processing Subsystem\r\n");

	if ( (vproc_config = XVprocSs_LookupConfig(XPAR_V_PROC_SS_0_DEVICE_ID)) == NULL) {
		xil_printf("XVprocSs_LookupConfig() returned NULL\r\n");
	}
	else {
		xil_printf("XVprocSs_LookupConfig() succeeded\r\n");

	}

	XVprocSs_SetFrameBufBaseaddr(&vproc, XPAR_DDR_MEM_BASEADDR + 0x20000000);
	XVprocSs_LogReset(&vproc);

	if (XVprocSs_CfgInitialize(&vproc, vproc_config, vproc_config->BaseAddress) != XST_SUCCESS) {
		xil_printf("XVprocSs_CfgInitialize() failed\r\n");
	}
	else {
		xil_printf("XVprocSs_CfgInitialize() succeeded\r\n");
	}

//	if (XVprocSs_SetSubsystemConfig(&vproc) != XST_SUCCESS) {
//		xil_printf("XVprocSs_SetSubsystemConfig() failed\r\n");
//	}
//
//	XVprocSs_ReportSubsystemCoreInfo(&vproc);

	return XST_SUCCESS;
}
*/
