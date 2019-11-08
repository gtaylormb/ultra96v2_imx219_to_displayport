/*
 * axis_switch.c
 *
 *  Created on: Aug 12, 2019
 *      Author: Greg Taylor
 *
#include "xaxis_switch.h"

int axis_switch_init() {
	XAxis_Switch axis_switch;
	XAxis_Switch_Config *axis_switch_config;

	axis_switch_config = XAxisScr_LookupConfig(XPAR_AXIS_SWITCH_0_DEVICE_ID);
	XAxisScr_CfgInitialize(&axis_switch, axis_switch_config, axis_switch_config->BaseAddress);

//	XAxisScr_MiPortEnable(&axis_switch, 0, 0);
//
//	if (XAxisScr_SelfTest(&axis_switch) != XST_SUCCESS) {
//		xil_printf("axis switch core failed self test\r\n");
//		return XST_FAILURE;
//	}

	xil_printf("Selecting Test Pattern Generator using AXI-S switch\r\n");
	XAxisScr_MiPortEnable(&axis_switch, 0, 0);

	if (XAxisScr_IsMiPortEnabled(&axis_switch, 0, 0)) {
		xil_printf("port switch is set\r\n");
	}
	else {
		xil_printf("port switch is not set\r\n");
	}

	return XST_SUCCESS;
}
*/
