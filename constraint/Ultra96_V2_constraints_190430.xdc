# ----------------------------------------------------------------------------  
#       __ __
#      / / \ \
#     / /   \ \
#    / /     \ \ 
#   / / AVNET \ \          www.ultra96.org
#
# ----------------------------------------------------------------------------
# 
#  Created With Avnet Constraints Generator V0.8.0 
#     Date: Tuesdat, April 30, 2019 
#     Time: 12:40 PM 
# 
#  This design is the property of Avnet.  Publication of this
#  design is not authorized without written consent from Avnet.
#  
#  Please direct any questions to:
#     Avnet Ultra96 Forums
#     http://avnet.me/ultra96-community	
# 
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2019 Avnet, Inc.
#                              All rights reserved.
# 
# ----------------------------------------------------------------------------
# 
#  Notes: 
# 				2019 Apr 19 -- Initial version
#
#     IO standard for Bank 26 Vcco supply is fixed at 1.8V
#     IO standard for Bank 65 Vcco supply is fixed at 1.2V
# 
#     Net names are not allowed to contain hyphen characters '-' since this
#     is not a legal VHDL87 or Verilog character within an identifier.  
#     HDL net names are adjusted to contain no hyphen characters '-' but 
#     rather use underscore '_' characters.  Comment net name with the hyphen 
#     characters will remain in place since these are intended to match the 
#     schematic net names in order to better enable schematic search.
#
# ----------------------------------------------------------------------------
 

# ----------------------------------------------------------------------------
# Bluetooth
# ---------------------------------------------------------------------------- 
#set_property PACKAGE_PIN B5   [get_ports {BT_HCI_CTS             }];  # "B5.BT_HCI_CTS"
#set_property PACKAGE_PIN B7   [get_ports {BT_HCI_RTS             }];  # "B7.BT_HCI_RTS"
#set_property PACKAGE_PIN A9   [get_ports {RADIO_LED0             }];  # "A9.RADIO_LED0"
#set_property PACKAGE_PIN B9   [get_ports {RADIO_LED1             }];  # "B9.RADIO_LED1"

# ----------------------------------------------------------------------------
# High-speed expansion connector
# ---------------------------------------------------------------------------- 
# Bank 65
set_property PACKAGE_PIN P1   [get_ports {mipi_phy_if_0_clk_n               }];  # "P1.CSI0_C_N"
set_property PACKAGE_PIN N2   [get_ports {mipi_phy_if_0_clk_p               }];  # "N2.CSI0_C_P"
set_property PACKAGE_PIN N4   [get_ports {mipi_phy_if_0_data_n[0]              }];  # "N4.CSI0_D0_N"
set_property PACKAGE_PIN N5   [get_ports {mipi_phy_if_0_data_p[0]              }];  # "N5.CSI0_D0_P"
set_property PACKAGE_PIN M1   [get_ports {mipi_phy_if_0_data_n[1]              }];  # "M1.CSI0_D1_N"
set_property PACKAGE_PIN M2   [get_ports {mipi_phy_if_0_data_p[1]              }];  # "M2.CSI0_D1_P"
#set_property PACKAGE_PIN M4   [get_ports {CSI0_D2_N              }];  # "M4.CSI0_D2_N"
#set_property PACKAGE_PIN M5   [get_ports {CSI0_D2_P              }];  # "M5.CSI0_D2_P"
#set_property PACKAGE_PIN L1   [get_ports {CSI0_D3_N              }];  # "L1.CSI0_D3_N"
#set_property PACKAGE_PIN L2   [get_ports {CSI0_D3_P              }];  # "L2.CSI0_D3_P"
#set_property PACKAGE_PIN T2   [get_ports {CSI1_C_N               }];  # "T2.CSI1_C_N"
#set_property PACKAGE_PIN T3   [get_ports {CSI1_C_P               }];  # "T3.CSI1_C_P"
#set_property PACKAGE_PIN R3   [get_ports {CSI1_D0_N              }];  # "R3.CSI1_D0_N"
#set_property PACKAGE_PIN P3   [get_ports {CSI1_D0_P              }];  # "P3.CSI1_D0_P"
#set_property PACKAGE_PIN U1   [get_ports {CSI1_D1_N              }];  # "U1.CSI1_D1_N"
#set_property PACKAGE_PIN U2   [get_ports {CSI1_D1_P              }];  # "U2.CSI1_D1_P"
#set_property PACKAGE_PIN H5   [get_ports {DSI_CLK_N              }];  # "H5.DSI_CLK_N"
#set_property PACKAGE_PIN J5   [get_ports {DSI_CLK_P              }];  # "J5.DSI_CLK_P"
#set_property PACKAGE_PIN F1   [get_ports {DSI_D0_N               }];  # "F1.DSI_D0_N"
#set_property PACKAGE_PIN G1   [get_ports {DSI_D0_P               }];  # "G1.DSI_D0_P"
#set_property PACKAGE_PIN E3   [get_ports {DSI_D1_N               }];  # "E3.DSI_D1_N"
#set_property PACKAGE_PIN E4   [get_ports {DSI_D1_P               }];  # "E4.DSI_D1_P"
#set_property PACKAGE_PIN D1   [get_ports {DSI_D2_N               }];  # "D1.DSI_D2_N"
#set_property PACKAGE_PIN E1   [get_ports {DSI_D2_P               }];  # "E1.DSI_D2_P"
#set_property PACKAGE_PIN C3   [get_ports {DSI_D3_N               }];  # "C3.DSI_D3_N"
#set_property PACKAGE_PIN D3   [get_ports {DSI_D3_P               }];  # "D3.DSI_D3_P"
#set_property PACKAGE_PIN C2   [get_ports {HSIC_DATA              }];  # "C2.HSIC_DATA"

# Bank 66
#set_property PACKAGE_PIN A2   [get_ports {HSIC_STR               }];  # "A2.HSIC_STR"
# Bank 26
#set_property PACKAGE_PIN E8   [get_ports {CSI0_MCLK              }];  # "E8.CSI0_MCLK"
#set_property PACKAGE_PIN D8   [get_ports {CSI1_MCLK              }];  # "D8.CSI1_MCLK"

# ----------------------------------------------------------------------------
# Fan control
# ---------------------------------------------------------------------------- 
# Bank 65
#set_property PACKAGE_PIN F4   [get_ports {FAN_PWM                }];  # "F4.FAN_PWM"

# ----------------------------------------------------------------------------
# Low-speed expansion connector
# ---------------------------------------------------------------------------- 
# Bank 65
#set_property PACKAGE_PIN D7   [get_ports {HD_GPIO_0              }];  # "D7.HD_GPIO_0"
#set_property PACKAGE_PIN F8   [get_ports {HD_GPIO_1              }];  # "F8.HD_GPIO_1"
#set_property PACKAGE_PIN F7   [get_ports {HD_GPIO_2              }];  # "F7.HD_GPIO_2"
#set_property PACKAGE_PIN G7   [get_ports {HD_GPIO_3              }];  # "G7.HD_GPIO_3"
#set_property PACKAGE_PIN F6   [get_ports {HD_GPIO_4              }];  # "F6.HD_GPIO_4"
#set_property PACKAGE_PIN G5   [get_ports {HD_GPIO_5              }];  # "G5.HD_GPIO_5"
#set_property PACKAGE_PIN A6   [get_ports {HD_GPIO_6              }];  # "A6.HD_GPIO_6"
#set_property PACKAGE_PIN A7   [get_ports {HD_GPIO_7              }];  # "A7.HD_GPIO_7"
#set_property PACKAGE_PIN G6   [get_ports {HD_GPIO_8              }];  # "G6.HD_GPIO_8"
#set_property PACKAGE_PIN E6   [get_ports {HD_GPIO_9              }];  # "E6.HD_GPIO_9"
#set_property PACKAGE_PIN E5   [get_ports {HD_GPIO_10             }];  # "E5.HD_GPIO_10"
#set_property PACKAGE_PIN D6   [get_ports {HD_GPIO_11             }];  # "D6.HD_GPIO_11"
#set_property PACKAGE_PIN D5   [get_ports {HD_GPIO_12             }];  # "D5.HD_GPIO_12"
#set_property PACKAGE_PIN C7   [get_ports {HD_GPIO_13             }];  # "C7.HD_GPIO_13"
#set_property PACKAGE_PIN B6   [get_ports {HD_GPIO_14             }];  # "B6.HD_GPIO_14"
#set_property PACKAGE_PIN C5   [get_ports {HD_GPIO_15             }];  # "C5.HD_GPIO_15"

# ----------------------------------------------------------------------------
# IOSTANDARD Constraints
#
# Note that these IOSTANDARD constraints are applied to all IOs currently
# assigned within an I/O bank.  If these IOSTANDARD constraints are 
# evaluated prior to other PACKAGE_PIN constraints being applied, then 
# the IOSTANDARD specified will likely not be applied properly to those 
# pins.  Therefore, bank wide IOSTANDARD constraints should be placed 
# within the XDC file in a location that is evaluated AFTER all 
# PACKAGE_PIN constraints within the target bank have been evaluated.
# ---------------------------------------------------------------------------- 

# Set the bank voltage for IO Bank 26 to 1.8V
#set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 26]];

# Set the bank voltage for IO Bank 65 to 1.2V
#set_property IOSTANDARD LVCMOS12 [get_ports -of_objects [get_iobanks 65]];

# Set the bank voltage for IO Bank 66 to 1.2V
#set_property IOSTANDARD LVCMOS12 [get_ports -of_objects [get_iobanks 66]];

# ----------------------------------------------------------------------------
# PS MIO - 
# For reference only - these are assigned in the FSBL
# Pin Location and IOSTANDARD constraints are not necessary
# ---------------------------------------------------------------------------- 

# J1 UART
#set_property PACKAGE_PIN U4   [get_ports {MIO0_UART1_TX          }];  # "U4.MIO0_UART1_TX"
#set_property PACKAGE_PIN W1   [get_ports {MIO1_UART1_RX          }];  # "W1.MIO1_UART1_RX"

#Bluetooth
#set_property PACKAGE_PIN V2   [get_ports {MIO2_UART0_RX_BT_HCI_TX}];  # "V2.MIO2_UART0_RX_BT_HCI_TX"
#set_property PACKAGE_PIN U5   [get_ports {MIO3_UART0_TX_BT_HCI_RX}];  # "U5.MIO3_UART0_TX_BT_HCI_RX"


#I2C Mux
#set_property PACKAGE_PIN U6   [get_ports {MIO4_I2C1_SCL          }];  # "U6.MIO4_I2C1_SCL"
#set_property PACKAGE_PIN AA1  [get_ports {MIO5_I2C1_SDA          }];  # "AA1.MIO5_I2C1_SDA"
#set_property PACKAGE_PIN AB2  [get_ports {MIO12_I2C_MUX_RESET_N  }];  # "AB2.MIO12_I2C_MUX_RESET_N"

# High-speed expansion connector
#set_property PACKAGE_PIN Y1   [get_ports {MIO6_SPI1_SCLK         }];  # "Y1.MIO6_SPI1_SCLK"
#set_property PACKAGE_PIN V5   [get_ports {MIO9_SPI1_CS           }];  # "V5.MIO9_SPI1_CS"
#set_property PACKAGE_PIN AA2  [get_ports {MIO10_SPI1_MISO        }];  # "AA2.MIO10_SPI1_MISO"
#set_property PACKAGE_PIN W2   [get_ports {MIO11_SPI1_MOSI        }];  # "W2.MIO11_SPI1_MOSI"

# microSD Card
#set_property PACKAGE_PIN W3   [get_ports {MIO13_SD0_DAT0         }];  # "W3.MIO13_SD0_DAT0"
#set_property PACKAGE_PIN W5   [get_ports {MIO14_SD0_DAT1         }];  # "W5.MIO14_SD0_DAT1"
#set_property PACKAGE_PIN Y4   [get_ports {MIO15_SD0_DAT2         }];  # "Y4.MIO15_SD0_DAT2"
#set_property PACKAGE_PIN Y3   [get_ports {MIO16_SD0_DAT3         }];  # "Y3.MIO16_SD0_DAT3"
#set_property PACKAGE_PIN W6   [get_ports {MIO21_SD0_CMD          }];  # "W6.MIO21_SD0_CMD"
#set_property PACKAGE_PIN AA6  [get_ports {MIO22_SD0_CLK          }];  # "AA6.MIO22_SD0_CLK"
#set_property PACKAGE_PIN AB6  [get_ports {MIO24_SD0_DETECT       }];  # "AB6.MIO24_SD0_DETECT"

# User LEDs
#set_property PACKAGE_PIN AA3  [get_ports {MIO17_PS_LED3          }];  # "AA3.MIO17_PS_LED3"
#set_property PACKAGE_PIN Y5   [get_ports {MIO18_PS_LED2          }];  # "Y5.MIO18_PS_LED2"
#set_property PACKAGE_PIN AA4  [get_ports {MIO19_PS_LED1          }];  # "AA4.MIO19_PS_LED1"
#set_property PACKAGE_PIN AB4  [get_ports {MIO20_PS_LED0          }];  # "AB4.MIO20_PS_LED0"

# User Push Button
#set_property PACKAGE_PIN AB5  [get_ports {MIO23_GPIO_PB          }];  # "AB5.MIO23_GPIO_PB"

# USB
#set_property PACKAGE_PIN Y6   [get_ports {MIO25_VBUS_DET         }];  # "Y6.MIO25_VBUS_DET"
#set_property PACKAGE_PIN G14  [get_ports {MIO52_USB0_CLK         }];  # "G14.MIO52_USB0_CLK"
#set_property PACKAGE_PIN F14  [get_ports {MIO53_USB0_DIR         }];  # "F14.MIO53_USB0_DIR"
#set_property PACKAGE_PIN G15  [get_ports {MIO54_USB0_DATA2       }];  # "G15.MIO54_USB0_DATA2"
#set_property PACKAGE_PIN C14  [get_ports {MIO55_USB0_NXT         }];  # "C14.MIO55_USB0_NXT"
#set_property PACKAGE_PIN E14  [get_ports {MIO56_USB0_DATA0       }];  # "E14.MIO56_USB0_DATA0"
#set_property PACKAGE_PIN B14  [get_ports {MIO57_USB0_DATA1       }];  # "B14.MIO57_USB0_DATA1"
#set_property PACKAGE_PIN A14  [get_ports {MIO58_USB0_STP         }];  # "A14.MIO58_USB0_STP"
#set_property PACKAGE_PIN E15  [get_ports {MIO59_USB0_DATA3       }];  # "E15.MIO59_USB0_DATA3"
#set_property PACKAGE_PIN D15  [get_ports {MIO60_USB0_DATA4       }];  # "D15.MIO60_USB0_DATA4"
#set_property PACKAGE_PIN G16  [get_ports {MIO61_USB0_DATA5       }];  # "G16.MIO61_USB0_DATA5"
#set_property PACKAGE_PIN C15  [get_ports {MIO62_USB0_DATA6       }];  # "C15.MIO62_USB0_DATA6"
#set_property PACKAGE_PIN F16  [get_ports {MIO63_USB0_DATA7       }];  # "F16.MIO63_USB0_DATA7"
#set_property PACKAGE_PIN E16  [get_ports {MIO64_USB1_CLK         }];  # "E16.MIO64_USB1_CLK"
#set_property PACKAGE_PIN B15  [get_ports {MIO65_USB1_DIR         }];  # "B15.MIO65_USB1_DIR"
#set_property PACKAGE_PIN D16  [get_ports {MIO66_USB1_DATA2       }];  # "D16.MIO66_USB1_DATA2"
#set_property PACKAGE_PIN G17  [get_ports {MIO67_USB1_NXT         }];  # "G17.MIO67_USB1_NXT"
#set_property PACKAGE_PIN B16  [get_ports {MIO68_USB1_DATA0       }];  # "B16.MIO68_USB1_DATA0"
#set_property PACKAGE_PIN A16  [get_ports {MIO69_USB1_DATA1       }];  # "A16.MIO69_USB1_DATA1"
#set_property PACKAGE_PIN A17  [get_ports {MIO70_USB1_STP         }];  # "A17.MIO70_USB1_STP"
#set_property PACKAGE_PIN F17  [get_ports {MIO71_USB1_DATA3       }];  # "F17.MIO71_USB1_DATA3"
#set_property PACKAGE_PIN C17  [get_ports {MIO72_USB1_DATA4       }];  # "C17.MIO72_USB1_DATA4"
#set_property PACKAGE_PIN D17  [get_ports {MIO73_USB1_DATA5       }];  # "D17.MIO73_USB1_DATA5"
#set_property PACKAGE_PIN D18  [get_ports {MIO74_USB1_DATA6       }];  # "D18.MIO74_USB1_DATA6"
#set_property PACKAGE_PIN B17  [get_ports {MIO75_USB1_DATA7       }];  # "B17.MIO75_USB1_DATA7"

# Power control
#set_property PACKAGE_PIN G9   [get_ports {MIO26_PWR_INT          }];  # "G9.MIO26_PWR_INT"
#set_property PACKAGE_PIN F13  [get_ports {MIO34_POWER_KILL_N     }];  # "F13.MIO34_POWER_KILL_N"
#set_property PACKAGE_PIN B18  [get_ports {MIO77_PWR_ALERT_N      }];  # "B18.MIO77_PWR_ALERT_N"


# Display Port
#set_property PACKAGE_PIN G11  [get_ports {MIO27_DP_AUX_OUT       }];  # "G11.MIO27_DP_AUX_OUT"
#set_property PACKAGE_PIN G12  [get_ports {MIO28_DP_HPD           }];  # "G12.MIO28_DP_HPD"
#set_property PACKAGE_PIN F9   [get_ports {MIO29_DP_OE            }];  # "F9.MIO29_DP_OE"
#set_property PACKAGE_PIN G10  [get_ports {MIO30_DP_AUX_IN        }];  # "G10.MIO30_DP_AUX_IN"

#PMBUS
#set_property PACKAGE_PIN F11  [get_ports {MIO31_MHTN_ALRT        }];  # "F11.MIO31_MHTN_ALRT"

# Low-speed expansion connector
#set_property PACKAGE_PIN D10  [get_ports {MIO36_PS_GPIO1_0       }];  # "D10.MIO36_PS_GPIO1_0"
#set_property PACKAGE_PIN E11  [get_ports {MIO37_PS_GPIO1_1       }];  # "E11.MIO37_PS_GPIO1_1"
#set_property PACKAGE_PIN C10  [get_ports {MIO39_PS_GPIO1_2       }];  # "C10.MIO39_PS_GPIO1_2"
#set_property PACKAGE_PIN D11  [get_ports {MIO40_PS_GPIO1_3       }];  # "D11.MIO40_PS_GPIO1_3"
#set_property PACKAGE_PIN B11  [get_ports {MIO44_PS_GPIO1_4       }];  # "B11.MIO44_PS_GPIO1_4"
#set_property PACKAGE_PIN A11  [get_ports {MIO45_PS_GPIO1_5       }];  # "A11.MIO45_PS_GPIO1_5"
#set_property PACKAGE_PIN C9   [get_ports {MIO38_SPI0_SCLK        }];  # "C9.MIO38_SPI0_SCLK"
#set_property PACKAGE_PIN B10  [get_ports {MIO41_SPI0_CS          }];  # "B10.MIO41_SPI0_CS"
#set_property PACKAGE_PIN D12  [get_ports {MIO42_SPI0_MISO        }];  # "D12.MIO42_SPI0_MISO"
#set_property PACKAGE_PIN E13  [get_ports {MIO43_SPI0_MOSI        }];  # "E13.MIO43_SPI0_MOSI"

#wi-Fi
#set_property PACKAGE_PIN V3   [get_ports {MIO8_RADIO_EN          }];  # "V3.MIO8_RADIO_EN"
#set_property PACKAGE_PIN V4   [get_ports {MIO7_RAD_RST_N         }];  # "V4.MIO7_RAD_RST_N"
#set_property PACKAGE_PIN C12  [get_ports {MIO46_SD1_D0           }];  # "C12.MIO46_SD1_D0"
#set_property PACKAGE_PIN B12  [get_ports {MIO47_SD1_D1           }];  # "B12.MIO47_SD1_D1"
#set_property PACKAGE_PIN A12  [get_ports {MIO48_SD1_D2           }];  # "A12.MIO48_SD1_D2"
#set_property PACKAGE_PIN D13  [get_ports {MIO49_SD1_D3           }];  # "D13.MIO49_SD1_D3"
#set_property PACKAGE_PIN A13  [get_ports {MIO50_SD1_CMD          }];  # "A13.MIO50_SD1_CMD"
#set_property PACKAGE_PIN C13  [get_ports {MIO51_SD1_CLK          }];  # "C13.MIO51_SD1_CLK"
#set_property PACKAGE_PIN F18  [get_ports {MIO76_WLAN_IRQ         }];  # "F18.MIO76_WLAN_IRQ"

# Test Points
#set_property PACKAGE_PIN F12  [get_ports {MIO32                  }];  # "F12.MIO32"
#set_property PACKAGE_PIN E9   [get_ports {MIO33                  }];  # "E9.MIO33"
#set_property PACKAGE_PIN E10  [get_ports {MIO35                  }];  # "E10.MIO35"

# LPDDR4
#set_property PACKAGE_PIN AA22 [get_ports {PS_DDR_CAA0            }];  # "AA22.PS_DDR_CAA0"
#set_property PACKAGE_PIN AB20 [get_ports {PS_DDR_CAA1            }];  # "AB20.PS_DDR_CAA1"
#set_property PACKAGE_PIN AB17 [get_ports {PS_DDR_CAA2            }];  # "AB17.PS_DDR_CAA2"
#set_property PACKAGE_PIN AB19 [get_ports {PS_DDR_CAA3            }];  # "AB19.PS_DDR_CAA3"
#set_property PACKAGE_PIN AB21 [get_ports {PS_DDR_CAA4            }];  # "AB21.PS_DDR_CAA4"
#set_property PACKAGE_PIN AB16 [get_ports {PS_DDR_CAA5            }];  # "AB16.PS_DDR_CAA5"
#set_property PACKAGE_PIN Y21  [get_ports {PS_DDR_CAB0            }];  # "Y21.PS_DDR_CAB0"
#set_property PACKAGE_PIN AA21 [get_ports {PS_DDR_CAB1            }];  # "AA21.PS_DDR_CAB1"
#set_property PACKAGE_PIN AA18 [get_ports {PS_DDR_CAB2            }];  # "AA18.PS_DDR_CAB2"
#set_property PACKAGE_PIN AA19 [get_ports {PS_DDR_CAB3            }];  # "AA19.PS_DDR_CAB3"
#set_property PACKAGE_PIN AA17 [get_ports {PS_DDR_CAB4            }];  # "AA17.PS_DDR_CAB4"
#set_property PACKAGE_PIN AA16 [get_ports {PS_DDR_CAB5            }];  # "AA16.PS_DDR_CAB5"
#set_property PACKAGE_PIN W20  [get_ports {PS_DDR_CKA_C           }];  # "W20.PS_DDR_CKA_C"
#set_property PACKAGE_PIN V20  [get_ports {PS_DDR_CKA_T           }];  # "V20.PS_DDR_CKA_T"
#set_property PACKAGE_PIN V19  [get_ports {PS_DDR_CKB_C           }];  # "V19.PS_DDR_CKB_C"
#set_property PACKAGE_PIN V18  [get_ports {PS_DDR_CKB_T           }];  # "V18.PS_DDR_CKB_T"
#set_property PACKAGE_PIN U22  [get_ports {PS_DDR_CKE0            }];  # "U22.PS_DDR_CKE0"
#set_property PACKAGE_PIN U21  [get_ports {PS_DDR_CKE1            }];  # "U21.PS_DDR_CKE1"
#set_property PACKAGE_PIN V22  [get_ports {PS_DDR_CS0_N           }];  # "V22.PS_DDR_CS0_N"
#set_property PACKAGE_PIN U20  [get_ports {PS_DDR_CS1_N           }];  # "U20.PS_DDR_CS1_N"
#set_property PACKAGE_PIN AB9  [get_ports {PS_DDR_DMA0            }];  # "AB9.PS_DDR_DMA0"
#set_property PACKAGE_PIN AB14 [get_ports {PS_DDR_DMA1            }];  # "AB14.PS_DDR_DMA1"
#set_property PACKAGE_PIN U9   [get_ports {PS_DDR_DMB0            }];  # "U9.PS_DDR_DMB0"
#set_property PACKAGE_PIN W13  [get_ports {PS_DDR_DMB1            }];  # "W13.PS_DDR_DMB1"
#set_property PACKAGE_PIN AB11 [get_ports {PS_DDR_DQ0             }];  # "AB11.PS_DDR_DQ0"
#set_property PACKAGE_PIN Y10  [get_ports {PS_DDR_DQ1             }];  # "Y10.PS_DDR_DQ1"
#set_property PACKAGE_PIN AA12 [get_ports {PS_DDR_DQ10            }];  # "AA12.PS_DDR_DQ10"
#set_property PACKAGE_PIN AB12 [get_ports {PS_DDR_DQ11            }];  # "AB12.PS_DDR_DQ11"
#set_property PACKAGE_PIN Y14  [get_ports {PS_DDR_DQ12            }];  # "Y14.PS_DDR_DQ12"
#set_property PACKAGE_PIN AA14 [get_ports {PS_DDR_DQ13            }];  # "AA14.PS_DDR_DQ13"
#set_property PACKAGE_PIN Y15  [get_ports {PS_DDR_DQ14            }];  # "Y15.PS_DDR_DQ14"
#set_property PACKAGE_PIN AB15 [get_ports {PS_DDR_DQ15            }];  # "AB15.PS_DDR_DQ15"
#set_property PACKAGE_PIN W8   [get_ports {PS_DDR_DQ16            }];  # "W8.PS_DDR_DQ16"
#set_property PACKAGE_PIN W7   [get_ports {PS_DDR_DQ17            }];  # "W7.PS_DDR_DQ17"
#set_property PACKAGE_PIN V7   [get_ports {PS_DDR_DQ18            }];  # "V7.PS_DDR_DQ18"
#set_property PACKAGE_PIN V10  [get_ports {PS_DDR_DQ19            }];  # "V10.PS_DDR_DQ19"
#set_property PACKAGE_PIN AB10 [get_ports {PS_DDR_DQ2             }];  # "AB10.PS_DDR_DQ2"
#set_property PACKAGE_PIN U7   [get_ports {PS_DDR_DQ20            }];  # "U7.PS_DDR_DQ20"
#set_property PACKAGE_PIN T9   [get_ports {PS_DDR_DQ21            }];  # "T9.PS_DDR_DQ21"
#set_property PACKAGE_PIN U10  [get_ports {PS_DDR_DQ22            }];  # "U10.PS_DDR_DQ22"
#set_property PACKAGE_PIN T10  [get_ports {PS_DDR_DQ23            }];  # "T10.PS_DDR_DQ23"
#set_property PACKAGE_PIN U11  [get_ports {PS_DDR_DQ24            }];  # "U11.PS_DDR_DQ24"
#set_property PACKAGE_PIN U12  [get_ports {PS_DDR_DQ25            }];  # "U12.PS_DDR_DQ25"
#set_property PACKAGE_PIN W12  [get_ports {PS_DDR_DQ26            }];  # "W12.PS_DDR_DQ26"
#set_property PACKAGE_PIN W11  [get_ports {PS_DDR_DQ27            }];  # "W11.PS_DDR_DQ27"
#set_property PACKAGE_PIN V14  [get_ports {PS_DDR_DQ28            }];  # "V14.PS_DDR_DQ28"
#set_property PACKAGE_PIN U14  [get_ports {PS_DDR_DQ29            }];  # "U14.PS_DDR_DQ29"
#set_property PACKAGE_PIN W10  [get_ports {PS_DDR_DQ3             }];  # "W10.PS_DDR_DQ3"
#set_property PACKAGE_PIN W15  [get_ports {PS_DDR_DQ30            }];  # "W15.PS_DDR_DQ30"
#set_property PACKAGE_PIN V15  [get_ports {PS_DDR_DQ31            }];  # "V15.PS_DDR_DQ31"
#set_property PACKAGE_PIN AA8  [get_ports {PS_DDR_DQ4             }];  # "AA8.PS_DDR_DQ4"
#set_property PACKAGE_PIN Y8   [get_ports {PS_DDR_DQ5             }];  # "Y8.PS_DDR_DQ5"
#set_property PACKAGE_PIN AB7  [get_ports {PS_DDR_DQ6             }];  # "AB7.PS_DDR_DQ6"
#set_property PACKAGE_PIN AA7  [get_ports {PS_DDR_DQ7             }];  # "AA7.PS_DDR_DQ7"
#set_property PACKAGE_PIN AA11 [get_ports {PS_DDR_DQ8             }];  # "AA11.PS_DDR_DQ8"
#set_property PACKAGE_PIN Y11  [get_ports {PS_DDR_DQ9             }];  # "Y11.PS_DDR_DQ9"
#set_property PACKAGE_PIN AA9  [get_ports {PS_DDR_DQSA0_C         }];  # "AA9.PS_DDR_DQSA0_C"
#set_property PACKAGE_PIN Y9   [get_ports {PS_DDR_DQSA0_T         }];  # "Y9.PS_DDR_DQSA0_T"
#set_property PACKAGE_PIN AA13 [get_ports {PS_DDR_DQSA1_C         }];  # "AA13.PS_DDR_DQSA1_C"
#set_property PACKAGE_PIN Y13  [get_ports {PS_DDR_DQSA1_T         }];  # "Y13.PS_DDR_DQSA1_T"
#set_property PACKAGE_PIN V8   [get_ports {PS_DDR_DQSB0_C         }];  # "V8.PS_DDR_DQSB0_C"
#set_property PACKAGE_PIN V9   [get_ports {PS_DDR_DQSB0_T         }];  # "V9.PS_DDR_DQSB0_T"
#set_property PACKAGE_PIN V13  [get_ports {PS_DDR_DQSB1_C         }];  # "V13.PS_DDR_DQSB1_C"
#set_property PACKAGE_PIN V12  [get_ports {PS_DDR_DQSB1_T         }];  # "V12.PS_DDR_DQSB1_T"
#set_property PACKAGE_PIN T18  [get_ports {PS_DDR_RST_N           }];  # "T18.PS_DDR_RST_N"

# PS status
#set_property PACKAGE_PIN K16  [get_ports {PS_ERR_OUT             }];  # "K16.PS_ERR_OUT"
#set_property PACKAGE_PIN K18  [get_ports {PS_ERR_STAT            }];  # "K18.PS_ERR_STAT"
#set_property PACKAGE_PIN K15  [get_ports {PS_INIT_N              }];  # "K15.PS_INIT_N"

# ----------------------------------------------------------------------------
# USB Transceiver -- 26 MHz clock
# ---------------------------------------------------------------------------- 
# Bank 505
#set_property PACKAGE_PIN L20  [get_ports {U26M_N                 }];  # "L20.U26M_N"
#set_property PACKAGE_PIN L19  [get_ports {U26M_P                 }];  # "L19.U26M_P"
#set_property PACKAGE_PIN D22  [get_ports {GTR_LANE2_RX_N         }];  # "D22.GTR_LANE2_RX_N"
#set_property PACKAGE_PIN D21  [get_ports {GTR_LANE2_RX_P         }];  # "D21.GTR_LANE2_RX_P"
#set_property PACKAGE_PIN C20  [get_ports {GTR_LANE2_TX_N         }];  # "C20.GTR_LANE2_TX_N"
#set_property PACKAGE_PIN C19  [get_ports {GTR_LANE2_TX_P         }];  # "C19.GTR_LANE2_TX_P"
#set_property PACKAGE_PIN B22  [get_ports {GTR_LANE3_RX_N         }];  # "B22.GTR_LANE3_RX_N"
#set_property PACKAGE_PIN B21  [get_ports {GTR_LANE3_RX_P         }];  # "B21.GTR_LANE3_RX_P"
#set_property PACKAGE_PIN A20  [get_ports {GTR_LANE3_TX_N         }];  # "A20.GTR_LANE3_TX_N"
#set_property PACKAGE_PIN A19  [get_ports {GTR_LANE3_TX_P         }];  # "A19.GTR_LANE3_TX_P"

# ----------------------------------------------------------------------------
# Display Port -- 27 MHz clock
# ---------------------------------------------------------------------------- 
# Bank 505
#set_property PACKAGE_PIN J20  [get_ports {U27M_N                 }];  # "J20.U27M_N"
#set_property PACKAGE_PIN J19  [get_ports {U27M_P                 }];  # "J19.U27M_P"
#set_property PACKAGE_PIN K22  [get_ports {GTR_LANE0_TX_N         }];  # "K22.GTR_LANE0_TX_N"
#set_property PACKAGE_PIN K21  [get_ports {GTR_LANE0_TX_P         }];  # "K21.GTR_LANE0_TX_P"
#set_property PACKAGE_PIN F22  [get_ports {GTR_LANE1_TX_N         }];  # "F22.GTR_LANE1_TX_N"
#set_property PACKAGE_PIN F21  [get_ports {GTR_LANE1_TX_P         }];  # "F21.GTR_LANE1_TX_P"
#set_property PACKAGE_PIN D22  [get_ports {GTR_LANE2_RX_N         }];  # "D22.GTR_LANE2_RX_N"
#set_property PACKAGE_PIN D21  [get_ports {GTR_LANE2_RX_P         }];  # "D21.GTR_LANE2_RX_P"
#set_property PACKAGE_PIN C20  [get_ports {GTR_LANE2_TX_N         }];  # "C20.GTR_LANE2_TX_N"
#set_property PACKAGE_PIN C19  [get_ports {GTR_LANE2_TX_P         }];  # "C19.GTR_LANE2_TX_P"
#set_property PACKAGE_PIN B22  [get_ports {GTR_LANE3_RX_N         }];  # "B22.GTR_LANE3_RX_N"
#set_property PACKAGE_PIN B21  [get_ports {GTR_LANE3_RX_P         }];  # "B21.GTR_LANE3_RX_P"
#set_property PACKAGE_PIN A20  [get_ports {GTR_LANE3_TX_N         }];  # "A20.GTR_LANE3_TX_N"
#set_property PACKAGE_PIN A19  [get_ports {GTR_LANE3_TX_P         }];  # "A19.GTR_LANE3_TX_P"
