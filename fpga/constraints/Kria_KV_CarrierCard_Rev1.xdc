# Xilinx design constraints (XDC) file for Kria KV Carrier Card - Rev 1

# copied over from Kria_K26_SOM_Rev1.xdc so we only have to add 1 .xdc file
set_property PACKAGE_PIN F11      [get_ports "rpi_enable"] ;# Bank  45 VCCO - som240_1_b13 - IO_L6N_HDGC_45 (som240_1_a15)
set_property PACKAGE_PIN F10      [get_ports "IIC_1_0_sda_io"] ;# Bank  45 VCCO - som240_1_b13 - IO_L5N_HDGC_45 (som240_1_d17)
set_property PACKAGE_PIN G11      [get_ports "IIC_1_0_scl_io"] ;# Bank  45 VCCO - som240_1_b13 - IO_L5P_HDGC_45 (som240_1_d16)
#set_property PACKAGE_PIN F6       [get_ports "mipi_phy_if_0_data_n[1]"] ;# Bank  66 VCCO - som240_1_d1 - IO_L15N_T2L_N5_AD11N_66 (som240_1_a10)
#set_property PACKAGE_PIN G6       [get_ports "mipi_phy_if_0_data_p[1]"] ;# Bank  66 VCCO - som240_1_d1 - IO_L15P_T2L_N4_AD11P_66 (som240_1_a9)
#set_property PACKAGE_PIN D5       [get_ports "mipi_phy_if_0_data_n[0]"] ;# Bank  66 VCCO - som240_1_d1 - IO_L14N_T2L_N3_GC_66 (som240_1_b11)
#set_property PACKAGE_PIN E5       [get_ports "mipi_phy_if_0_data_p[0]"] ;# Bank  66 VCCO - som240_1_d1 - IO_L14P_T2L_N2_GC_66 (som240_1_b10)
#set_property PACKAGE_PIN D6       [get_ports "mipi_phy_if_0_clk_n"] ;# Bank  66 VCCO - som240_1_d1 - IO_L13N_T2L_N1_GC_QBC_66 (som240_1_c13)
#set_property PACKAGE_PIN D7       [get_ports "mipi_phy_if_0_clk_p"] ;# Bank  66 VCCO - som240_1_d1 - IO_L13P_T2L_N0_GC_QBC_66 (som240_1_c12)

#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a1"]; # Net name VCC_BATT
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_a3"]; # Net name HPA06_P
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_a4"]; # Net name HPA06_N
#set_property IOSTANDARD  LVCMOS12 [get_ports "som240_1_a6"]; # Net name HPA_CLK0_P_NC
#set_property IOSTANDARD  LVCMOS12 [get_ports "som240_1_a7"]; # Net name HPA_CLK0_N_NC
set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "mipi_phy_if_0_data_p[1]"]; # Net name HPA12_P (som240_1_a9)
set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "mipi_phy_if_0_data_n[1]"]; # Net name HPA12_N (som240_1_a10)
#set_property IOSTANDARD  LVCMOS12 [get_ports "som240_1_a12"]; # Net name HPA13_P_NC
#set_property IOSTANDARD  LVCMOS12 [get_ports "som240_1_a13"]; # Net name HPA13_N_NC
set_property IOSTANDARD  LVCMOS33 [get_ports "rpi_enable"]; # Net name HDA09 (som240_1_a15)
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_a16"]; # Net name HDA10
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_a17"]; # Net name HDA11
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a19"]; # Net name VCCOEN_PS_M2C
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a20"]; # Net name VCCOEN_PL_M2C
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a22"]; # Net name JTAG_TMS_C2M
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a23"]; # Net name JTAG_TDO_M2C
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a24"]; # Net name JTAG_TDI_C2M
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a25"]; # Net name JTAG_TCK_C2M
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a27"]; # Net name MODE0_C2M
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a28"]; # Net name MODE1_C2M
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a29"]; # Net name MODE2_C2M
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a30"]; # Net name MODE3_C2M
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a31"]; # Net name MIO32_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a32"]; # Net name MIO33_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a34"]; # Net name MIO41_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a35"]; # Net name MIO42_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a36"]; # Net name MIO43
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a38"]; # Net name MIO61
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a39"]; # Net name MIO62
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a40"]; # Net name MIO63
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a42"]; # Net name MIO73
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a43"]; # Net name MIO74
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a44"]; # Net name MIO75
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a47"]; # Net name GTR_DP1_M2C_P
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a48"]; # Net name GTR_DP1_M2C_N
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a51"]; # Net name GTR_REFCLK3_C2M_P_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a52"]; # Net name GTR_REFCLK3_C2M_N_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a55"]; # Net name GTR_DP0_C2M_P_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a56"]; # Net name GTR_DP0_C2M_N_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a59"]; # Net name SOM_5V0
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_a60"]; # Net name SOM_5V0
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_b1"]; # Net name HPA05_CC_P
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_b2"]; # Net name HPA05_CC_N
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_b4"]; # Net name HPA04_P
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_b5"]; # Net name HPA04_N
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_b7"]; # Net name HPA07_P
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_b8"]; # Net name HPA07_N
set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "mipi_phy_if_0_data_p[0]"]; # Net name HPA11_P (som240_1_b10)
set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "mipi_phy_if_0_data_n[0]"]; # Net name HPA11_N (som240_1_b11)
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b13"]; # Net name PL_3V3
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b14"]; # Net name PL_3V3
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_b16"]; # Net name HDA03
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_b17"]; # Net name HDA04
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_b18"]; # Net name HDA05_NC
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_b20"]; # Net name HDA15
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_b21"]; # Net name HDA16_CC
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_b22"]; # Net name HDA17
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b24"]; # Net name PS_ERROR_OUT_M2C
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b25"]; # Net name PS_ERROR_STATUS_M2C
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b26"]; # Net name PWROFF_C2M_B
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b28"]; # Net name MIO35
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b29"]; # Net name MIO36
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b30"]; # Net name MIO37
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b32"]; # Net name MIO38
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b33"]; # Net name MIO39
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b34"]; # Net name MIO40_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b36"]; # Net name MIO50
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b37"]; # Net name MIO51
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b38"]; # Net name MIO34_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b40"]; # Net name MIO58
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b41"]; # Net name MIO59
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b42"]; # Net name MIO60
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b44"]; # Net name MIO70
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b45"]; # Net name MIO71
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b46"]; # Net name MIO72
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b49"]; # Net name GTR_REFCLK1_C2M_P
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b50"]; # Net name GTR_REFCLK1_C2M_N
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b53"]; # Net name GTR_DP2_C2M_P
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b54"]; # Net name GTR_DP2_C2M_N
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b57"]; # Net name GTR_DP0_M2C_P
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b58"]; # Net name GTR_DP0_M2C_N
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_b60"]; # Net name SOM_5V0
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_c3"]; # Net name HPA00_CC_P
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_c4"]; # Net name HPA00_CC_N
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_c6"]; # Net name HPA03_P
#set_property IOSTANDARD  MIPI_DPHY_DCI  [get_ports "som240_1_c7"]; # Net name HPA03_N
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_c9"]; # Net name HPA08_P
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_c10"]; # Net name HPA08_N
set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "mipi_phy_if_0_clk_p"]; # Net name HPA10_CC_P (som240_1_c12)
set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "mipi_phy_if_0_clk_n"]; # Net name HPA10_CC_N (som240_1_c13)
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c15"]; # Net name PS_POR_B
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c16"]; # Net name PS_SRST_C2M_B
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_c18"]; # Net name HDA06_NC
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_c19"]; # Net name HDA07_NC
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_c20"]; # Net name HDA08_CC_NC
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_c22"]; # Net name HDA18
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_c23"]; # Net name HDA19_NC
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_c24"]; # Net name HDA20
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c26"]; # Net name I2C_SCK
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c27"]; # Net name I2C_SDA
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c28"]; # Net name FWUEN_C2M_B
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c30"]; # Net name MIO29
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c31"]; # Net name MIO30
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c32"]; # Net name MIO31
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c34"]; # Net name MIO47
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c35"]; # Net name MIO48
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c36"]; # Net name MIO49
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c38"]; # Net name MIO55
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c39"]; # Net name MIO56
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c40"]; # Net name MIO57
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c42"]; # Net name MIO67
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c43"]; # Net name MIO68
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c44"]; # Net name MIO69
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c45"]; # Net name SOM240_1_C45_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c47"]; # Net name GTR_REFCLK0_C2M_P
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c48"]; # Net name GTR_REFCLK0_C2M_N
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c51"]; # Net name GTR_DP3_M2C_P_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c52"]; # Net name GTR_DP3_M2C_N_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c55"]; # Net name GTR_DP1_C2M_P_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c56"]; # Net name GTR_DP1_C2M_N_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c59"]; # Net name SOM_5V0
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_c60"]; # Net name SOM_5V0
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d1"]; # Net name PL_1V2
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d2"]; # Net name PL_1V2
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_d4"]; # Net name HPA02_P
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_d5"]; # Net name HPA02_N
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_d7"]; # Net name HPA01_P
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_d8"]; # Net name HPA01_N
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_d10"]; # Net name HPA09_P
#set_property IOSTANDARD  MIPI_DPHY_DCI [get_ports "som240_1_d11"]; # Net name HPA09_N
#set_property IOSTANDARD  LVCMOS12 [get_ports "som240_1_d13"]; # Net name HPA14_P_NC
#set_property IOSTANDARD  LVCMOS12 [get_ports "som240_1_d14"]; # Net name HPA14_N_NC
set_property IOSTANDARD  LVCMOS33 [get_ports "IIC_1_0_scl_io"]; # Net name HDA00_CC (som240_1_d16)
set_property IOSTANDARD  LVCMOS33 [get_ports "IIC_1_0_sda_io"]; # Net name HDA01 (som240_1_d17)
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_d18"]; # Net name HDA02
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_d20"]; # Net name HDA12
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_d21"]; # Net name HDA13
#set_property IOSTANDARD  LVCMOS33 [get_ports "som240_1_d22"]; # Net name HDA14
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d24"]; # Net name PWRGD_FPD_M2C
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d25"]; # Net name PWRGD_LPD_M2C
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d26"]; # Net name PWRGD_PL_M2C
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d28"]; # Net name MIO26
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d29"]; # Net name MIO27
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d30"]; # Net name MIO28
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d32"]; # Net name MIO44
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d33"]; # Net name MIO45
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d34"]; # Net name MIO46
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d36"]; # Net name MIO52
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d37"]; # Net name MIO53
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d38"]; # Net name MIO54
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d40"]; # Net name MIO64
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d41"]; # Net name MIO65
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d42"]; # Net name MIO66
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d44"]; # Net name MIO76
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d45"]; # Net name MIO77
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d46"]; # Net name SOM240_1_D46_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d49"]; # Net name GTR_DP3_C2M_P_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d50"]; # Net name GTR_DP3_C2M_N_NC
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d53"]; # Net name GTR_REFCLK2_C2M_P
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d54"]; # Net name GTR_REFCLK2_C2M_N
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d57"]; # Net name GTR_DP2_M2C_P
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d58"]; # Net name GTR_DP2_M2C_N
#set_property IOSTANDARD  LVCMOSxx [get_ports "som240_1_d60"]; # Net name SOM_5V0

set_property SLEW SLOW [get_ports "IIC_1_0_scl_io"]; # Net name HDA00_CC
set_property SLEW SLOW [get_ports "IIC_1_0_sda_io"]; # Net name HDA01
#set_property SLEW SLOW [get_ports "som240_1_d18"]; # Net name HDA02
#set_property SLEW SLOW [get_ports "som240_1_b16"]; # Net name HDA03
#set_property SLEW SLOW [get_ports "som240_1_b17"]; # Net name HDA04
set_property SLEW SLOW [get_ports "rpi_enable"]; # Net name HDA09 (som240_1_a15)
#set_property SLEW SLOW [get_ports "som240_1_a17"]; # Net name HDA11
#set_property SLEW SLOW [get_ports "som240_1_d20"]; # Net name HDA12
#set_property SLEW SLOW [get_ports "som240_1_d21"]; # Net name HDA13
#set_property SLEW SLOW [get_ports "som240_1_d22"]; # Net name HDA14
#set_property SLEW SLOW [get_ports "som240_1_b20"]; # Net name HDA15
#set_property SLEW SLOW [get_ports "som240_1_b21"]; # Net name HDA16_CC
#set_property SLEW SLOW [get_ports "som240_1_c22"]; # Net name HDA18
#set_property SLEW SLOW [get_ports "som240_1_b22"]; # Net name HDA17
#set_property SLEW SLOW [get_ports "som240_1_c24"]; # Net name HDA20

set_property DRIVE 4   [get_ports "IIC_1_0_scl_io"]; # Net name HDA00_CC
set_property DRIVE 4   [get_ports "IIC_1_0_sda_io"]; # Net name HDA01
#set_property DRIVE 4   [get_ports "som240_1_d18"]; # Net name HDA02
#set_property DRIVE 4   [get_ports "som240_1_b16"]; # Net name HDA03
#set_property DRIVE 4   [get_ports "som240_1_b17"]; # Net name HDA04
set_property DRIVE 4   [get_ports "rpi_enable"]; # Net name HDA09
#set_property DRIVE 4   [get_ports "som240_1_a17"]; # Net name HDA11
#set_property DRIVE 4   [get_ports "som240_1_d20"]; # Net name HDA12
#set_property DRIVE 4   [get_ports "som240_1_d21"]; # Net name HDA13
#set_property DRIVE 4   [get_ports "som240_1_d22"]; # Net name HDA14
#set_property DRIVE 4   [get_ports "som240_1_b20"]; # Net name HDA15
#set_property DRIVE 4   [get_ports "som240_1_b21"]; # Net name HDA16_CC
#set_property DRIVE 4   [get_ports "som240_1_c22"]; # Net name HDA18
#set_property DRIVE 4   [get_ports "som240_1_b22"]; # Net name HDA17
#set_property DRIVE 4   [get_ports "som240_1_c24"]; # Net name HDA20
#
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_c4"];  # Net name HPA00_CC_N
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_c3"];  # Net name HPA00_CC_P
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_d8"];  # Net name HPA01_N
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_d7"];  # Net name HPA01_P
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_d5"];  # Net name HPA02_N
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_d4"];  # Net name HPA02_P
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_c7"];  # Net name HPA03_N
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_c6"];  # Net name HPA03_P
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_b5"];  # Net name HPA04_N
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_b4"];  # Net name HPA04_P
#
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_b2"];  # Net name HPA05_CC_N
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_b1"];  # Net name HPA05_CC_P
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_a4"];  # Net name HPA06_N
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_a3"];  # Net name HPA06_P
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_b8"];  # Net name HPA07_N
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_b7"];  # Net name HPA07_P
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_c10"]; # Net name HPA08_N
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_c9"];  # Net name HPA08_P
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_d11"]; # Net name HPA09_N
#set_property DIFF_TERM_ADV TERM_100 [get_ports "som240_1_d10"]; # Net name HPA09_P
#
set_property DIFF_TERM_ADV TERM_100 [get_ports "mipi_phy_if_0_clk_n"]; # Net name HPA10_CC_N
set_property DIFF_TERM_ADV TERM_100 [get_ports "mipi_phy_if_0_clk_p"]; # Net name HPA10_CC_P
set_property DIFF_TERM_ADV TERM_100 [get_ports "mipi_phy_if_0_data_n[0]"]; # Net name HPA11_N
set_property DIFF_TERM_ADV TERM_100 [get_ports "mipi_phy_if_0_data_p[0]"]; # Net name HPA11_P
set_property DIFF_TERM_ADV TERM_100 [get_ports "mipi_phy_if_0_data_n[1]"]; # Net name HPA12_N
set_property DIFF_TERM_ADV TERM_100 [get_ports "mipi_phy_if_0_data_p[1]"];  # Net name HPA12_P

