/*
FILENAME: imx219.c
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
#include "sleep.h"
#include "platform.h"
#include "xgpiops.h"
#include "xiicps.h"
#include "imx219.h"
#include "parameters.h"

static XGpioPs gpio;
static XIicPs iic;

int imx219_init() {
	XGpioPs_Config *gpio_config;
	XIicPs_Config *iic_config;
	u8 bit_mask;
	u8 i2c_expander_slave_addr;
	u8 i2c_expander_control_bitmask;
	u8 addr[2];
	u8 camera_model_id[2];

	if (BOARD == ULTRA96) {	
		if ( (gpio_config = XGpioPs_LookupConfig(XPAR_PSU_GPIO_0_DEVICE_ID)) == NULL) {
			xil_printf("XGpioPs_LookupConfig() failed\r\n");
			return XST_FAILURE;
		}
		if (XGpioPs_CfgInitialize(&gpio, gpio_config, gpio_config->BaseAddr)) {
			xil_printf("XGpioPs_CfgInitialize() failed\r\n");
			return XST_FAILURE;
		}

		// Reset and enable IMX219 power supplies
		XGpioPs_SetDirectionPin(&gpio, IMX219_ENABLE_GPIO_PIN, 1);
		XGpioPs_SetOutputEnablePin(&gpio, IMX219_ENABLE_GPIO_PIN, 1);
		XGpioPs_WritePin(&gpio, IMX219_ENABLE_GPIO_PIN, 0);
		usleep(100000);
		XGpioPs_WritePin(&gpio, IMX219_ENABLE_GPIO_PIN, 1);
		usleep(100000);

		xil_printf("Reset and enabled IMX219 power supplies\r\n");

		// Reset i2c expander
		XGpioPs_SetDirectionPin(&gpio, ULTRA_96_I2C_EXPANDER_RESET_N_GPIO_PIN, 1);
		XGpioPs_SetOutputEnablePin(&gpio, ULTRA_96_I2C_EXPANDER_RESET_N_GPIO_PIN, 1);
		XGpioPs_WritePin(&gpio, ULTRA_96_I2C_EXPANDER_RESET_N_GPIO_PIN, 0);
		XGpioPs_WritePin(&gpio, ULTRA_96_I2C_EXPANDER_RESET_N_GPIO_PIN, 1);
	}
	/*
	 * For KV260, IMX219 power supply is enabled by FPGA pin tied high,
	 * i2c expander reset_b is tied high on board
	 */

	if ( (iic_config = XIicPs_LookupConfig(XPAR_PSU_I2C_1_DEVICE_ID)) == NULL) {
		xil_printf("XIicPs_LookupConfig() failed\r\n");
		return XST_FAILURE;
	}
	if (XIicPs_CfgInitialize(&iic, iic_config, iic_config->BaseAddress) != XST_SUCCESS) {
		xil_printf("XIicPs_CfgInitialize() failed\r\n");
		return XST_FAILURE;
	}

	if (XIicPs_SelfTest(&iic) != XST_SUCCESS) {
		xil_printf("XIicPs_SelfTest() failed\r\n");
		return XST_FAILURE;
	}

	if (XIicPs_SetSClk(&iic, I2C_BUS_FREQ) != XST_SUCCESS) {
		xil_printf("XIicPs_SetSClk failed\r\n");
		return XST_FAILURE;
	}

	if (BOARD == ULTRA96) {
		i2c_expander_slave_addr = ULTRA_96_I2C_EXPANDER_SLAVE_ADDR;
		i2c_expander_control_bitmask = ULTRA_96_I2C_EXPANDER_HSEXP_I2C2_BIT_MASK;
	}
	else if (BOARD == KV260) {
		i2c_expander_slave_addr = KV260_I2C_EXPANDER_SLAVE_ADDR;
		i2c_expander_control_bitmask = KV260_I2C_EXPANDER_RPI_BIT_MASK;
	}
	// Read i2c expander chip control reg
	if (XIicPs_MasterRecvPolled(&iic, &bit_mask, 1, i2c_expander_slave_addr) != XST_SUCCESS) {
		xil_printf("i2c expander receive failed\r\n");
		return XST_FAILURE;
	}
	usleep(1000); // chip needs some delay for some reason
	bit_mask |= i2c_expander_control_bitmask;
	if (XIicPs_MasterSendPolled(&iic, &bit_mask, 1, i2c_expander_slave_addr) != XST_SUCCESS) {
		xil_printf("i2c expander send failed\r\n");
		return XST_FAILURE;
	}

	memset(addr, 0, sizeof(addr));
	if (XIicPs_MasterSendPolled(&iic, addr, 2, IMX219_I2C_SLAVE_ADDR) != XST_SUCCESS) {
		xil_printf("imx219 send failed\r\n");
		return XST_FAILURE;
	}
	if (XIicPs_MasterRecvPolled(&iic, camera_model_id, 2, IMX219_I2C_SLAVE_ADDR) != XST_SUCCESS) {
		xil_printf("imx219 receive failed\r\n");
		return XST_FAILURE;
	}

	if (camera_model_id[0] != 0x2 && camera_model_id[1] == 0x19) {
		xil_printf("could not read camera id\r\n");
		return XST_FAILURE;
	}
	else {
		xil_printf("I2C communication established with IMX219\r\n");
	}
	// config from https://android.googlesource.com/kernel/bcm/+/android-bcm-tetra-3.10-lollipop-wear-release/drivers/media/video/imx219.c
	/* 1920x1080P48 */
	imx219_write(0x30EB, 0x05);
	imx219_write(0x30EB, 0x0C);
	imx219_write(0x300A, 0xFF);
	imx219_write(0x300B, 0xFF);
	imx219_write(0x30EB, 0x05);
	imx219_write(0x30EB, 0x09);
	imx219_write(0x0114, 0x01); // 2-wire csi
	imx219_write(0x0128, 0x00); // auto MIPI global timing
	imx219_write(0x012A, 0x18); // INCK freq: 24.0Mhz
	imx219_write(0x012B, 0x00);
	imx219_write(0x0160, 0x04); // frame length lines = 1113
	imx219_write(0x0161, 0x59);
	imx219_write(0x0162, 0x0D); // line length pixels = 3448
	imx219_write(0x0163, 0x78);
	imx219_write(0x0164, 0x02); // x-start address = 680
	imx219_write(0x0165, 0xA8);
	imx219_write(0x0166, 0x0A); // x-end address = 2599
	imx219_write(0x0167, 0x27);
	imx219_write(0x0168, 0x02); // y-start address = 692
	imx219_write(0x0169, 0xB4);
	imx219_write(0x016A, 0x06); // y-end address = 1771
	imx219_write(0x016B, 0xEB);
	imx219_write(0x016C, 0x07); // x-output size = 1920
	imx219_write(0x016D, 0x80);
	imx219_write(0x016E, 0x04); // y-output size = 1080
	imx219_write(0x016F, 0x38);
	imx219_write(0x0170, 0x01); //
	imx219_write(0x0171, 0x01);
	imx219_write(0x0174, 0x00);
	imx219_write(0x0175, 0x00);
	imx219_write(0x018C, 0x0A);
	imx219_write(0x018D, 0x0A);
	imx219_write(0x0301, 0x05); // video timing pixel clock divider value = 5
	imx219_write(0x0303, 0x01); // video timing system clock divider value = 1
	imx219_write(0x0304, 0x03); // external clock 24-27MHz
	imx219_write(0x0305, 0x03); // external clock 24-27MHz
	imx219_write(0x0306, 0x00); // PLL Video Timing system multiplier value = 57
	imx219_write(0x0307, 0x39);
	imx219_write(0x0309, 0x0A); // output pixel clock divider value = 10
	imx219_write(0x030B, 0x01); // output system clock divider value = 1
	imx219_write(0x030C, 0x00); // PLL output system multiplier value = 114
	imx219_write(0x030D, 0x72);
	imx219_write(0x455E, 0x00);
	imx219_write(0x471E, 0x4B);
	imx219_write(0x4767, 0x0F);
	imx219_write(0x4750, 0x14);
	imx219_write(0x4540, 0x00);
	imx219_write(0x47B4, 0x14);
	imx219_write(0x4713, 0x30);
	imx219_write(0x478B, 0x10);
	imx219_write(0x478F, 0x10);
	imx219_write(0x4793, 0x10);
	imx219_write(0x4797, 0x0E);
	imx219_write(0x479B, 0x0E);
	imx219_write(0x0100, 0x01);
	xil_printf("Wrote initial configuration to IMX219 sensor\r\n");

	imx219_write(IMX219_ANA_GAIN_GLOBAL, 232);

//	imx219_write(IMX219_COARSE_INT_TIME_HI, 0x02);

	return XST_SUCCESS;
}

int imx219_write(u16 addr, u8 data) {
	u8 buf[3];

	buf[0] = addr >> 8;
	buf[1] = addr & 0xff;
	buf[2] = data;

	while (TransmitFifoFill(&iic) || XIicPs_BusIsBusy(&iic)) { //while (XIicPs_BusIsBusy(&iic)) {
		usleep(1);
		xil_printf("waiting for transmit...\r\n");
	}

	if (XIicPs_MasterSendPolled(&iic, buf, 3, IMX219_I2C_SLAVE_ADDR) != XST_SUCCESS) {
		xil_printf("imx219 write failed, addr: %x\r\n", addr);
		return XST_FAILURE;
	}
	usleep(1000);

	return XST_SUCCESS;
}

int imx219_read(u16 addr, u8 *data) {
	u8 buf[2];

	buf[0] = addr >> 8;
	buf[1] = addr & 0xff;

	if (XIicPs_MasterSendPolled(&iic, buf, 2, IMX219_I2C_SLAVE_ADDR) != XST_SUCCESS) {
		xil_printf("imx219 write failed\r\n");
		return XST_FAILURE;
	}
	if (XIicPs_MasterRecvPolled(&iic, data, 1, IMX219_I2C_SLAVE_ADDR) != XST_SUCCESS) {
		xil_printf("imx219 receive failed\r\n");
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}



