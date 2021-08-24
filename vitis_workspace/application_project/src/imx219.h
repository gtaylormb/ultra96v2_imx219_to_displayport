/*
FILENAME: imx219.h
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
#ifndef SRC_IMX219_H_
#define SRC_IMX219_H_

#define I2C_BUS_FREQ 400000 // in Hz

#define IMX219_ENABLE_GPIO_PIN 37
#define IMX219_I2C_SLAVE_ADDR  0x10

#define ULTRA_96_I2C_EXPANDER_RESET_N_GPIO_PIN    12
#define ULTRA_96_I2C_EXPANDER_SLAVE_ADDR          0x75
#define ULTRA_96_I2C_EXPANDER_HSEXP_I2C2_BIT_MASK 0b00000100

#define KV260_I2C_EXPANDER_SLAVE_ADDR			  0x74
#define KV260_I2C_EXPANDER_RPI_BIT_MASK			  0b00000100

/* Lens */
/* infinity, 0 current */
#define IMX219_LENS_MIN					0
/* macro, max current */
#define IMX219_LENS_MAX					255
#define IMX219_LENS_STEP				1
/* AEC */
#define IMX219_DEFAULT_EXP		                10000
#define IMX219_DEFAULT_GAIN		                UINT8P8(1.0)
#define IMX219_GAIN_MIN					UINT8P8(1.0)
#define IMX219_GAIN_MAX					UINT8P8(8.0)
#define IMX219_EXP_MIN					1
#define IMX219_ANA_GAIN_GLOBAL                          0x0157
#define IMX219_COARSE_INT_TIME_HI                       0x015A
#define IMX219_COARSE_INT_TIME_LO                       0x015B
#define IMX219_FRM_LENGTH_HI                            0x0160
#define IMX219_FRM_LENGTH_LO                            0x0161

int imx219_init();
int imx219_write(u16 addr, u8 data);
int imx219_read(u16 addr, u8 *data);

#endif /* SRC_IMX219_H_ */
