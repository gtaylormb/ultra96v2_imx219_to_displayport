/*
FILENAME: displayport.h
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
#ifndef SRC_DISPLAYPORT_H_
#define SRC_DISPLAYPORT_H_

#define DPPSU_INTR_ID		151
#define DPDMA_INTR_ID		154

#define COLOR_ENCODING 		XDPPSU_CENC_RGB
#define BPC					XVIDC_BPC_8  // my Dell P2214H only does 8BPC
#define VIDEO_MODE			XVIDC_VM_1920x1080_60_P
#define INPUT_VIDEO_FORMAT	RGB_10BPC

int displayport_init();
int displayport_setup_interrupts();
void displayport_hpd_event_isr();
void displayport_hpd_pulse_isr();
u32 display_port_hpd_train();
void displayport_setup_video_stream();

#endif /* SRC_DISPLAYPORT_H_ */
