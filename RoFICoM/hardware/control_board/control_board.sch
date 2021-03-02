EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L rofi:STM32G071GBU6 U1
U 1 1 5C8FB3FC
P 5700 4050
F 0 "U1" H 5700 5257 50  0000 C CNN
F 1 "STM32G071GBU6" H 5700 5166 50  0000 C CNN
F 2 "rofi:UFQFPN28" H 5700 5000 50  0000 C CIN
F 3 "" H 5700 3100 50  0000 C CNN
F 4 "STM32G071GBU6" H 5700 4050 50  0001 C CNN "manf#"
	1    5700 4050
	1    0    0    -1  
$EndComp
$Comp
L rofi:DRV8837C U2
U 1 1 5C8FBD42
P 8750 4100
F 0 "U2" H 8750 4525 50  0000 C CNN
F 1 "DRV8837C" H 8750 4434 50  0000 C CNN
F 2 "Package_SON:WSON-8-1EP_2x2mm_P0.5mm_EP0.9x1.6mm" H 8750 4400 50  0001 C CNN
F 3 "" H 8750 4400 50  0001 C CNN
F 4 "DRV8837CDSGR" H 0   0   50  0001 C CNN "manf#"
	1    8750 4100
	1    0    0    -1  
$EndComp
$Comp
L rofi:BU52272NUZ U3
U 1 1 5C8FC155
P 2250 7200
F 0 "U3" H 2250 7475 50  0000 C CNN
F 1 "BU52272NUZ" H 2250 7384 50  0000 C CNN
F 2 "rofi:VSON04Z1114A" H 2250 7200 50  0001 C CNN
F 3 "" H 2250 7200 50  0001 C CNN
F 4 "BU52272NUZ-ZE2" H 2250 7200 50  0001 C CNN "manf#"
	1    2250 7200
	1    0    0    -1  
$EndComp
Text GLabel 4700 4200 0    50   Input ~ 0
SDA
Text GLabel 4700 4100 0    50   Input ~ 0
SCL
Text GLabel 6700 3400 2    50   Input ~ 0
SPI_SCK
Text GLabel 4700 3600 0    50   Input ~ 0
SPI_SS
Text GLabel 4700 3800 0    50   Input ~ 0
SPI_MISO
Text GLabel 6700 3800 2    50   Input ~ 0
DBG_RX
Text GLabel 6700 3700 2    50   Input ~ 0
DBG_TX
Text GLabel 4700 3400 0    50   Input ~ 0
TX
Text GLabel 4700 3500 0    50   Input ~ 0
RX
Text GLabel 4700 4000 0    50   Input ~ 0
MOTOR_PWM
Text GLabel 4700 4850 0    50   Input ~ 0
MOTOR
Wire Wire Line
	6800 4800 6700 4800
$Comp
L power:GND #PWR0101
U 1 1 5C86B401
P 6800 4800
F 0 "#PWR0101" H 6800 4550 50  0001 C CNN
F 1 "GND" H 6805 4627 50  0000 C CNN
F 2 "" H 6800 4800 50  0001 C CNN
F 3 "" H 6800 4800 50  0001 C CNN
	1    6800 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0102
U 1 1 5C86B471
P 7350 4600
F 0 "#PWR0102" H 7350 4450 50  0001 C CNN
F 1 "+3V3" V 7365 4728 50  0000 L CNN
F 2 "" H 7350 4600 50  0001 C CNN
F 3 "" H 7350 4600 50  0001 C CNN
	1    7350 4600
	0    1    1    0   
$EndComp
$Comp
L Device:C C3
U 1 1 5C86B537
P 7100 4750
F 0 "C3" H 7215 4796 50  0000 L CNN
F 1 "470n" H 7215 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7138 4600 50  0001 C CNN
F 3 "~" H 7100 4750 50  0001 C CNN
F 4 "CC0402ZRY5V6BB474" H 0   0   50  0001 C CNN "manf#"
	1    7100 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4600 7350 4600
Connection ~ 7100 4600
Wire Wire Line
	6700 4600 7100 4600
$Comp
L power:GND #PWR0103
U 1 1 5C86B5BB
P 7100 4900
F 0 "#PWR0103" H 7100 4650 50  0001 C CNN
F 1 "GND" H 7105 4727 50  0000 C CNN
F 2 "" H 7100 4900 50  0001 C CNN
F 3 "" H 7100 4900 50  0001 C CNN
	1    7100 4900
	1    0    0    -1  
$EndComp
Text GLabel 4700 4400 0    50   Input ~ 0
SWCLK
Text GLabel 4700 4300 0    50   Input ~ 0
SWDIO
Text GLabel 6700 4100 2    50   Input ~ 0
RST
$Comp
L power:GND #PWR0104
U 1 1 5C86B942
P 5750 1800
F 0 "#PWR0104" H 5750 1550 50  0001 C CNN
F 1 "GND" H 5755 1627 50  0000 C CNN
F 2 "" H 5750 1800 50  0001 C CNN
F 3 "" H 5750 1800 50  0001 C CNN
	1    5750 1800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0106
U 1 1 5C86BBA9
P 4950 1500
F 0 "#PWR0106" H 4950 1350 50  0001 C CNN
F 1 "VCC" V 4968 1627 50  0000 L CNN
F 2 "" H 4950 1500 50  0001 C CNN
F 3 "" H 4950 1500 50  0001 C CNN
	1    4950 1500
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0107
U 1 1 5C86BC44
P 6500 1300
F 0 "#PWR0107" H 6500 1150 50  0001 C CNN
F 1 "+3V3" V 6515 1428 50  0000 L CNN
F 2 "" H 6500 1300 50  0001 C CNN
F 3 "" H 6500 1300 50  0001 C CNN
	1    6500 1300
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5C86BCA3
P 2800 7000
F 0 "C2" H 2915 7046 50  0000 L CNN
F 1 "470n" H 2915 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2838 6850 50  0001 C CNN
F 3 "~" H 2800 7000 50  0001 C CNN
F 4 "CC0402ZRY5V6BB474" H 0   0   50  0001 C CNN "manf#"
	1    2800 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5C86BE43
P 5150 1650
F 0 "C1" H 5265 1696 50  0000 L CNN
F 1 "470n" H 5265 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5188 1500 50  0001 C CNN
F 3 "~" H 5150 1650 50  0001 C CNN
F 4 "CC0402ZRY5V6BB474" H 0   100 50  0001 C CNN "manf#"
	1    5150 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5C86BE7F
P 5150 1800
F 0 "#PWR0109" H 5150 1550 50  0001 C CNN
F 1 "GND" H 5155 1627 50  0000 C CNN
F 2 "" H 5150 1800 50  0001 C CNN
F 3 "" H 5150 1800 50  0001 C CNN
	1    5150 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x09 J1
U 1 1 5C86C246
P 8750 1500
F 0 "J1" H 8830 1542 50  0000 L CNN
F 1 "Skirt Cable" H 8830 1451 50  0000 L CNN
F 2 "rofi:flat_cable_9" H 8750 1500 50  0001 C CNN
F 3 "~" H 8750 1500 50  0001 C CNN
	1    8750 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+48V #PWR0110
U 1 1 5C86C412
P 8550 1900
F 0 "#PWR0110" H 8550 1750 50  0001 C CNN
F 1 "+48V" V 8565 2028 50  0000 L CNN
F 2 "" H 8550 1900 50  0001 C CNN
F 3 "" H 8550 1900 50  0001 C CNN
	1    8550 1900
	0    -1   -1   0   
$EndComp
Text GLabel 8550 1800 0    50   Input ~ 0
SDA
Text GLabel 8550 1700 0    50   Input ~ 0
SCL
$Comp
L power:+3V3 #PWR0111
U 1 1 5C86C4A8
P 8550 1600
F 0 "#PWR0111" H 8550 1450 50  0001 C CNN
F 1 "+3V3" V 8565 1728 50  0000 L CNN
F 2 "" H 8550 1600 50  0001 C CNN
F 3 "" H 8550 1600 50  0001 C CNN
	1    8550 1600
	0    -1   -1   0   
$EndComp
Text GLabel 8550 1500 0    50   Input ~ 0
SENSE_A
Text GLabel 8550 1400 0    50   Input ~ 0
RX
Text GLabel 8550 1300 0    50   Input ~ 0
TX
Text GLabel 8550 1200 0    50   Input ~ 0
SENSE_B
$Comp
L power:GND #PWR0112
U 1 1 5C86C5EC
P 8550 1100
F 0 "#PWR0112" H 8550 850 50  0001 C CNN
F 1 "GND" V 8555 972 50  0000 R CNN
F 2 "" H 8550 1100 50  0001 C CNN
F 3 "" H 8550 1100 50  0001 C CNN
	1    8550 1100
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0113
U 1 1 5C86C7A5
P 9750 3900
F 0 "#PWR0113" H 9750 3750 50  0001 C CNN
F 1 "VCC" H 9767 4073 50  0000 C CNN
F 2 "" H 9750 3900 50  0001 C CNN
F 3 "" H 9750 3900 50  0001 C CNN
	1    9750 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0114
U 1 1 5C86C892
P 8150 4100
F 0 "#PWR0114" H 8150 3950 50  0001 C CNN
F 1 "+3V3" V 8165 4228 50  0000 L CNN
F 2 "" H 8150 4100 50  0001 C CNN
F 3 "" H 8150 4100 50  0001 C CNN
	1    8150 4100
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0115
U 1 1 5C86CA0C
P 10350 4000
F 0 "#PWR0115" H 10350 3850 50  0001 C CNN
F 1 "+3V3" V 10365 4128 50  0000 L CNN
F 2 "" H 10350 4000 50  0001 C CNN
F 3 "" H 10350 4000 50  0001 C CNN
	1    10350 4000
	0    1    1    0   
$EndComp
Text GLabel 8150 3900 0    50   Input ~ 0
MOTOR
Text GLabel 8150 4000 0    50   Input ~ 0
MOTOR_PWM
$Comp
L power:GND #PWR0116
U 1 1 5C86CAA3
P 8150 4200
F 0 "#PWR0116" H 8150 3950 50  0001 C CNN
F 1 "GND" V 8155 4072 50  0000 R CNN
F 2 "" H 8150 4200 50  0001 C CNN
F 3 "" H 8150 4200 50  0001 C CNN
	1    8150 4200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5C86CAE6
P 9350 4300
F 0 "#PWR0117" H 9350 4050 50  0001 C CNN
F 1 "GND" V 9355 4172 50  0000 R CNN
F 2 "" H 9350 4300 50  0001 C CNN
F 3 "" H 9350 4300 50  0001 C CNN
	1    9350 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9350 4000 10050 4000
$Comp
L Device:C C5
U 1 1 5C86CD6A
P 10050 3850
F 0 "C5" H 10165 3896 50  0000 L CNN
F 1 "470n" H 10165 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10088 3700 50  0001 C CNN
F 3 "~" H 10050 3850 50  0001 C CNN
F 4 "CC0402ZRY5V6BB474" H 0   0   50  0001 C CNN "manf#"
	1    10050 3850
	1    0    0    -1  
$EndComp
Connection ~ 10050 4000
Wire Wire Line
	10050 4000 10350 4000
$Comp
L power:GND #PWR0118
U 1 1 5C86CE02
P 10050 3700
F 0 "#PWR0118" H 10050 3450 50  0001 C CNN
F 1 "GND" H 10055 3527 50  0000 C CNN
F 2 "" H 10050 3700 50  0001 C CNN
F 3 "" H 10050 3700 50  0001 C CNN
	1    10050 3700
	-1   0    0    1   
$EndComp
$Comp
L Device:C C4
U 1 1 5C86CF1D
P 9350 3750
F 0 "C4" H 9465 3796 50  0000 L CNN
F 1 "470n" H 9465 3705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9388 3600 50  0001 C CNN
F 3 "~" H 9350 3750 50  0001 C CNN
F 4 "CC0402ZRY5V6BB474" H 0   0   50  0001 C CNN "manf#"
	1    9350 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3900 9750 3900
Connection ~ 9350 3900
$Comp
L power:GND #PWR0119
U 1 1 5C86D04E
P 9350 3600
F 0 "#PWR0119" H 9350 3350 50  0001 C CNN
F 1 "GND" H 9355 3427 50  0000 C CNN
F 2 "" H 9350 3600 50  0001 C CNN
F 3 "" H 9350 3600 50  0001 C CNN
	1    9350 3600
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 5C86D231
P 9550 4100
F 0 "J2" H 9630 4142 50  0000 L CNN
F 1 "M+" H 9630 4051 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 9550 4100 50  0001 C CNN
F 3 "~" H 9550 4100 50  0001 C CNN
	1    9550 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 5C86D2DE
P 9950 4200
F 0 "J3" H 10030 4242 50  0000 L CNN
F 1 "M-" H 10030 4151 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 9950 4200 50  0001 C CNN
F 3 "~" H 9950 4200 50  0001 C CNN
	1    9950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 4200 9350 4200
$Comp
L power:+3V3 #PWR0120
U 1 1 5C86D9DD
P 3050 7150
F 0 "#PWR0120" H 3050 7000 50  0001 C CNN
F 1 "+3V3" V 3065 7278 50  0000 L CNN
F 2 "" H 3050 7150 50  0001 C CNN
F 3 "" H 3050 7150 50  0001 C CNN
	1    3050 7150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5C86DA00
P 2750 7250
F 0 "#PWR0121" H 2750 7000 50  0001 C CNN
F 1 "GND" V 2755 7122 50  0000 R CNN
F 2 "" H 2750 7250 50  0001 C CNN
F 3 "" H 2750 7250 50  0001 C CNN
	1    2750 7250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5C86DE0E
P 1200 1800
F 0 "#PWR0122" H 1200 1550 50  0001 C CNN
F 1 "GND" H 1205 1627 50  0000 C CNN
F 2 "" H 1200 1800 50  0001 C CNN
F 3 "" H 1200 1800 50  0001 C CNN
	1    1200 1800
	1    0    0    -1  
$EndComp
Text GLabel 1200 1600 0    50   Input ~ 0
RST
$Comp
L Connector_Generic:Conn_01x05 J4
U 1 1 5C86E080
P 1400 1600
F 0 "J4" H 1480 1642 50  0000 L CNN
F 1 "SWD" H 1480 1551 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 1400 1600 50  0001 C CNN
F 3 "~" H 1400 1600 50  0001 C CNN
	1    1400 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0123
U 1 1 5C86E19A
P 950 1700
F 0 "#PWR0123" H 950 1550 50  0001 C CNN
F 1 "+3V3" V 965 1828 50  0000 L CNN
F 2 "" H 950 1700 50  0001 C CNN
F 3 "" H 950 1700 50  0001 C CNN
	1    950  1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	950  1700 1200 1700
$Comp
L rofi:BU52272NUZ U5
U 1 1 5C86EF3E
P 2250 6350
F 0 "U5" H 2250 6625 50  0000 C CNN
F 1 "BU52272NUZ" H 2250 6534 50  0000 C CNN
F 2 "rofi:VSON04Z1114A" H 2250 6350 50  0001 C CNN
F 3 "" H 2250 6350 50  0001 C CNN
F 4 "BU52272NUZ-ZE2" H 2250 6350 50  0001 C CNN "manf#"
	1    2250 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0124
U 1 1 5C86EF44
P 3050 6300
F 0 "#PWR0124" H 3050 6150 50  0001 C CNN
F 1 "+3V3" V 3065 6428 50  0000 L CNN
F 2 "" H 3050 6300 50  0001 C CNN
F 3 "" H 3050 6300 50  0001 C CNN
	1    3050 6300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5C86EF4A
P 2750 6400
F 0 "#PWR0125" H 2750 6150 50  0001 C CNN
F 1 "GND" V 2755 6272 50  0000 R CNN
F 2 "" H 2750 6400 50  0001 C CNN
F 3 "" H 2750 6400 50  0001 C CNN
	1    2750 6400
	0    -1   -1   0   
$EndComp
Text GLabel 1750 6300 0    50   Input ~ 0
LIMIT_1
Text GLabel 1750 7150 0    50   Input ~ 0
LIMIT_2
NoConn ~ 1750 6400
NoConn ~ 1750 7250
Text GLabel 6700 3500 2    50   Input ~ 0
LIMIT_1
Text GLabel 6700 3900 2    50   Input ~ 0
LIMIT_2
Text GLabel 6700 3200 2    50   Input ~ 0
POT_SENSE
$Comp
L Device:LED D1
U 1 1 5C86FF59
P 7400 1300
F 0 "D1" V 7438 1183 50  0000 R CNN
F 1 "LED" V 7347 1183 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 7400 1300 50  0001 C CNN
F 3 "~" H 7400 1300 50  0001 C CNN
F 4 "150060YS75000" H 0   0   50  0001 C CNN "manf#"
	1    7400 1300
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0126
U 1 1 5C87003B
P 7400 1150
F 0 "#PWR0126" H 7400 1000 50  0001 C CNN
F 1 "+3V3" H 7415 1323 50  0000 C CNN
F 2 "" H 7400 1150 50  0001 C CNN
F 3 "" H 7400 1150 50  0001 C CNN
	1    7400 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5C8700C5
P 7400 1600
F 0 "R1" H 7470 1646 50  0000 L CNN
F 1 "220R" H 7470 1555 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7330 1600 50  0001 C CNN
F 3 "~" H 7400 1600 50  0001 C CNN
F 4 "RC0402JR-13220RL" H 0   0   50  0001 C CNN "manf#"
	1    7400 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5C87010B
P 7400 1750
F 0 "#PWR0127" H 7400 1500 50  0001 C CNN
F 1 "GND" H 7405 1577 50  0000 C CNN
F 2 "" H 7400 1750 50  0001 C CNN
F 3 "" H 7400 1750 50  0001 C CNN
	1    7400 1750
	1    0    0    -1  
$EndComp
Text GLabel 4700 4950 0    50   Input ~ 0
INT_SW
Text GLabel 4700 3300 0    50   Input ~ 0
INT_U
Text GLabel 4700 3900 0    50   Input ~ 0
INT_I
Text GLabel 6700 3600 2    50   Input ~ 0
EXT_SW
Text GLabel 4700 3700 0    50   Input ~ 0
EXT_U
Text GLabel 6700 3300 2    50   Input ~ 0
EXT_I
Text GLabel 4700 4750 0    50   Input ~ 0
SENSE_A
Text GLabel 4700 4500 0    50   Input ~ 0
SENSE_B
Text GLabel 4700 3200 0    50   Input ~ 0
IN_U
$Sheet
S 2150 3050 750  500 
U 5C87E670
F0 "INT_SWITCH" 50
F1 "bi-switch.sch" 50
F2 "IO+" I L 2150 3100 50 
F3 "IO-" I R 2900 3100 50 
F4 "CTLR" I L 2150 3250 50 
F5 "VOLTAGE" I L 2150 3350 50 
F6 "CURRENT" I L 2150 3450 50 
$EndSheet
$Sheet
S 2150 4000 750  500 
U 5C883562
F0 "EXT_SWTICH" 50
F1 "bi-switch.sch" 50
F2 "IO+" I L 2150 4050 50 
F3 "IO-" I R 2900 4050 50 
F4 "CTLR" I L 2150 4200 50 
F5 "VOLTAGE" I L 2150 4300 50 
F6 "CURRENT" I L 2150 4400 50 
$EndSheet
Text GLabel 2150 3250 0    50   Input ~ 0
INT_SW
Text GLabel 2150 3350 0    50   Input ~ 0
INT_U
Text GLabel 2150 3450 0    50   Input ~ 0
INT_I
$Comp
L power:+48V #PWR0128
U 1 1 5C883AAD
P 2150 3100
F 0 "#PWR0128" H 2150 2950 50  0001 C CNN
F 1 "+48V" V 2165 3228 50  0000 L CNN
F 2 "" H 2150 3100 50  0001 C CNN
F 3 "" H 2150 3100 50  0001 C CNN
	1    2150 3100
	0    -1   -1   0   
$EndComp
Text GLabel 2900 3100 2    50   Input ~ 0
INT
Text GLabel 2900 4050 2    50   Input ~ 0
EXT
Text GLabel 2150 4300 0    50   Input ~ 0
EXT_U
Text GLabel 2150 4400 0    50   Input ~ 0
EXT_I
Text GLabel 2150 4200 0    50   Input ~ 0
EXT_SW
$Comp
L power:+48V #PWR0129
U 1 1 5C883C67
P 2150 4050
F 0 "#PWR0129" H 2150 3900 50  0001 C CNN
F 1 "+48V" V 2165 4178 50  0000 L CNN
F 2 "" H 2150 4050 50  0001 C CNN
F 3 "" H 2150 4050 50  0001 C CNN
	1    2150 4050
	0    -1   -1   0   
$EndComp
Text Notes 1950 6000 0    50   ~ 0
Limit switches
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 5C885928
P 2300 1700
F 0 "J5" H 2380 1742 50  0000 L CNN
F 1 "DBG_UART" H 2380 1651 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2300 1700 50  0001 C CNN
F 3 "~" H 2300 1700 50  0001 C CNN
	1    2300 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0142
U 1 1 5C885970
P 2100 1800
F 0 "#PWR0142" H 2100 1550 50  0001 C CNN
F 1 "GND" H 2105 1627 50  0000 C CNN
F 2 "" H 2100 1800 50  0001 C CNN
F 3 "" H 2100 1800 50  0001 C CNN
	1    2100 1800
	1    0    0    -1  
$EndComp
Text GLabel 2100 1700 0    50   Input ~ 0
DBG_RX
Text GLabel 2100 1600 0    50   Input ~ 0
DBG_TX
$Comp
L Device:R R12
U 1 1 5C8860B1
P 1100 3600
F 0 "R12" H 1170 3646 50  0000 L CNN
F 1 "100k" H 1170 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 1030 3600 50  0001 C CNN
F 3 "~" H 1100 3600 50  0001 C CNN
F 4 "RC0402JR-13100KL" H 0   0   50  0001 C CNN "manf#"
	1    1100 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 5C886167
P 1100 3900
F 0 "R13" H 1170 3946 50  0000 L CNN
F 1 "6k8" H 1170 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 1030 3900 50  0001 C CNN
F 3 "~" H 1100 3900 50  0001 C CNN
F 4 "RC0402FR-076K8L" H 0   0   50  0001 C CNN "manf#"
	1    1100 3900
	1    0    0    -1  
$EndComp
Text GLabel 1450 3750 2    50   Input ~ 0
IN_U
Wire Wire Line
	1450 3750 1100 3750
Connection ~ 1100 3750
$Comp
L power:GND #PWR0143
U 1 1 5C886557
P 1100 4050
F 0 "#PWR0143" H 1100 3800 50  0001 C CNN
F 1 "GND" H 1105 3877 50  0000 C CNN
F 2 "" H 1100 4050 50  0001 C CNN
F 3 "" H 1100 4050 50  0001 C CNN
	1    1100 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+48V #PWR0144
U 1 1 5C8865F1
P 1100 3450
F 0 "#PWR0144" H 1100 3300 50  0001 C CNN
F 1 "+48V" H 1115 3623 50  0000 C CNN
F 2 "" H 1100 3450 50  0001 C CNN
F 3 "" H 1100 3450 50  0001 C CNN
	1    1100 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x07 J6
U 1 1 5C8871C8
P 3850 1500
F 0 "J6" H 3930 1542 50  0000 L CNN
F 1 "SYS_CON" H 3930 1451 50  0000 L CNN
F 2 "rofi:pogo_row_4_3" H 3850 1500 50  0001 C CNN
F 3 "~" H 3850 1500 50  0001 C CNN
	1    3850 1500
	1    0    0    -1  
$EndComp
Text GLabel 3650 1300 0    50   Input ~ 0
INT
Text GLabel 3650 1200 0    50   Input ~ 0
EXT
$Comp
L power:GND #PWR0145
U 1 1 5C8876CF
P 3650 1400
F 0 "#PWR0145" H 3650 1150 50  0001 C CNN
F 1 "GND" V 3655 1272 50  0000 R CNN
F 2 "" H 3650 1400 50  0001 C CNN
F 3 "" H 3650 1400 50  0001 C CNN
	1    3650 1400
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0146
U 1 1 5C887716
P 3650 1500
F 0 "#PWR0146" H 3650 1350 50  0001 C CNN
F 1 "VCC" V 3668 1627 50  0000 L CNN
F 2 "" H 3650 1500 50  0001 C CNN
F 3 "" H 3650 1500 50  0001 C CNN
	1    3650 1500
	0    -1   -1   0   
$EndComp
Text GLabel 3650 1700 0    50   Input ~ 0
SPI_SS
Text GLabel 3650 1800 0    50   Input ~ 0
SPI_SCK
Text GLabel 3650 1600 0    50   Input ~ 0
SPI_MISO
$Comp
L Connector:TestPoint TP1
U 1 1 5C8883B8
P 4350 7000
F 0 "TP1" V 4250 7000 50  0000 L CNN
F 1 "TestPoint" V 4450 6850 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 4550 7000 50  0001 C CNN
F 3 "~" H 4550 7000 50  0001 C CNN
	1    4350 7000
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5C88849C
P 5550 7000
F 0 "TP2" V 5650 7000 50  0000 C CNN
F 1 "TestPoint" V 5450 7000 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5750 7000 50  0001 C CNN
F 3 "~" H 5750 7000 50  0001 C CNN
	1    5550 7000
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0147
U 1 1 5C888528
P 4350 7000
F 0 "#PWR0147" H 4350 6850 50  0001 C CNN
F 1 "+3V3" V 4365 7128 50  0000 L CNN
F 2 "" H 4350 7000 50  0001 C CNN
F 3 "" H 4350 7000 50  0001 C CNN
	1    4350 7000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0148
U 1 1 5C88858B
P 5550 7000
F 0 "#PWR0148" H 5550 6750 50  0001 C CNN
F 1 "GND" V 5555 6872 50  0000 R CNN
F 2 "" H 5550 7000 50  0001 C CNN
F 3 "" H 5550 7000 50  0001 C CNN
	1    5550 7000
	0    -1   -1   0   
$EndComp
Wire Notes Line
	4450 6950 5450 6950
Wire Notes Line
	5450 6950 5450 7050
Wire Notes Line
	5450 7050 4450 7050
Wire Notes Line
	4450 7050 4450 6950
Text Notes 4600 7050 0    50   ~ 0
PCB potentionmeter
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 5C88967A
P 4950 6850
F 0 "J7" V 4823 6930 50  0000 L CNN
F 1 "SLIDER" V 4914 6930 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 4950 6850 50  0001 C CNN
F 3 "~" H 4950 6850 50  0001 C CNN
	1    4950 6850
	0    1    1    0   
$EndComp
Text GLabel 4950 6650 1    50   Input ~ 0
POT_SENSE
$Comp
L Mechanical:MountingHole H2
U 1 1 5C88AF91
P 8350 5900
F 0 "H2" H 8450 5946 50  0000 L CNN
F 1 "Motor Clamp" H 8450 5855 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 8350 5900 50  0001 C CNN
F 3 "~" H 8350 5900 50  0001 C CNN
	1    8350 5900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5C88B13B
P 8350 6100
F 0 "H3" H 8450 6146 50  0000 L CNN
F 1 "Motor Clamp" H 8450 6055 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 8350 6100 50  0001 C CNN
F 3 "~" H 8350 6100 50  0001 C CNN
	1    8350 6100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5C88B18B
P 8350 5700
F 0 "H1" H 8450 5746 50  0000 L CNN
F 1 "Motor Clamp" H 8450 5655 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 8350 5700 50  0001 C CNN
F 3 "~" H 8350 5700 50  0001 C CNN
	1    8350 5700
	1    0    0    -1  
$EndComp
Text GLabel 1200 1400 0    50   Input ~ 0
SWCLK
Text GLabel 1200 1500 0    50   Input ~ 0
SWDIO
Wire Wire Line
	3050 6300 2800 6300
Wire Wire Line
	3050 7150 2800 7150
$Comp
L Device:C C8
U 1 1 5C890AED
P 2800 6150
F 0 "C8" H 2915 6196 50  0000 L CNN
F 1 "470n" H 2915 6105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2838 6000 50  0001 C CNN
F 3 "~" H 2800 6150 50  0001 C CNN
F 4 "CC0402ZRY5V6BB474" H 0   0   50  0001 C CNN "manf#"
	1    2800 6150
	1    0    0    -1  
$EndComp
Connection ~ 2800 6300
Wire Wire Line
	2800 6300 2750 6300
$Comp
L power:GND #PWR0108
U 1 1 5C890C98
P 2800 6000
F 0 "#PWR0108" H 2800 5750 50  0001 C CNN
F 1 "GND" V 2805 5872 50  0000 R CNN
F 2 "" H 2800 6000 50  0001 C CNN
F 3 "" H 2800 6000 50  0001 C CNN
	1    2800 6000
	-1   0    0    1   
$EndComp
Connection ~ 2800 7150
Wire Wire Line
	2800 7150 2750 7150
$Comp
L power:GND #PWR0149
U 1 1 5C890F51
P 2800 6850
F 0 "#PWR0149" H 2800 6600 50  0001 C CNN
F 1 "GND" V 2805 6722 50  0000 R CNN
F 2 "" H 2800 6850 50  0001 C CNN
F 3 "" H 2800 6850 50  0001 C CNN
	1    2800 6850
	-1   0    0    1   
$EndComp
Wire Wire Line
	6250 1300 6500 1300
Wire Wire Line
	4950 1500 5150 1500
Connection ~ 5150 1500
Wire Wire Line
	5150 1500 5250 1500
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J9
U 1 1 5D741CB4
P 3800 2350
F 0 "J9" H 3850 2667 50  0000 C CNN
F 1 "SYS_CON_2" H 3850 2576 50  0000 C CNN
F 2 "rofi:molex-505006-0812" H 3800 2350 50  0001 C CNN
F 3 "~" H 3800 2350 50  0001 C CNN
	1    3800 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0150
U 1 1 5D74293A
P 3600 2250
F 0 "#PWR0150" H 3600 2000 50  0001 C CNN
F 1 "GND" V 3605 2122 50  0000 R CNN
F 2 "" H 3600 2250 50  0001 C CNN
F 3 "" H 3600 2250 50  0001 C CNN
	1    3600 2250
	0    1    1    0   
$EndComp
Text GLabel 4100 2550 2    50   Input ~ 0
EXT
Text GLabel 3600 2550 0    50   Input ~ 0
INT
$Comp
L power:VCC #PWR0151
U 1 1 5D743187
P 4100 2250
F 0 "#PWR0151" H 4100 2100 50  0001 C CNN
F 1 "VCC" V 4118 2377 50  0000 L CNN
F 2 "" H 4100 2250 50  0001 C CNN
F 3 "" H 4100 2250 50  0001 C CNN
	1    4100 2250
	0    1    1    0   
$EndComp
Text GLabel 3600 2350 0    50   Input ~ 0
SPI_MISO
Text GLabel 3600 2450 0    50   Input ~ 0
SPI_SS
Text GLabel 4100 2350 2    50   Input ~ 0
SPI_SCK
NoConn ~ 4100 2450
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J8
U 1 1 5D752682
P 1700 2350
F 0 "J8" H 1750 2667 50  0000 C CNN
F 1 "DBG" H 1750 2576 50  0000 C CNN
F 2 "rofi:molex-505006-0812" H 1700 2350 50  0001 C CNN
F 3 "~" H 1700 2350 50  0001 C CNN
	1    1700 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0152
U 1 1 5D753C01
P 1500 2550
F 0 "#PWR0152" H 1500 2300 50  0001 C CNN
F 1 "GND" H 1505 2377 50  0000 C CNN
F 2 "" H 1500 2550 50  0001 C CNN
F 3 "" H 1500 2550 50  0001 C CNN
	1    1500 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0153
U 1 1 5D753F95
P 2000 2250
F 0 "#PWR0153" H 2000 2100 50  0001 C CNN
F 1 "+3V3" V 2015 2378 50  0000 L CNN
F 2 "" H 2000 2250 50  0001 C CNN
F 3 "" H 2000 2250 50  0001 C CNN
	1    2000 2250
	0    1    1    0   
$EndComp
Text GLabel 2000 2550 2    50   Input ~ 0
SWCLK
Text GLabel 2000 2450 2    50   Input ~ 0
DBG_RX
Text GLabel 2000 2350 2    50   Input ~ 0
DBG_TX
$Comp
L power:VCC #PWR0154
U 1 1 5D756A68
P 1500 2250
F 0 "#PWR0154" H 1500 2100 50  0001 C CNN
F 1 "VCC" V 1518 2377 50  0000 L CNN
F 2 "" H 1500 2250 50  0001 C CNN
F 3 "" H 1500 2250 50  0001 C CNN
	1    1500 2250
	0    -1   -1   0   
$EndComp
$Comp
L Regulator_Linear:XC6220B331MR U4
U 1 1 5D78320C
P 5750 1400
F 0 "U4" H 5750 1767 50  0000 C CNN
F 1 "NCP718ASN330T1G" H 5750 1676 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5750 1400 50  0001 C CNN
F 3 "https://www.torexsemi.com/file/xc6220/XC6220.pdf" H 6500 400 50  0001 C CNN
F 4 "NCP718ASN330T1G" H 5750 1400 50  0001 C CNN "manf#"
	1    5750 1400
	1    0    0    -1  
$EndComp
Text GLabel 1500 2450 0    50   Input ~ 0
SWDIO
Text GLabel 1500 2350 0    50   Input ~ 0
RST
$Comp
L power:VCC #PWR0105
U 1 1 5F468B95
P 5250 1300
F 0 "#PWR0105" H 5250 1150 50  0001 C CNN
F 1 "VCC" V 5268 1427 50  0000 L CNN
F 2 "" H 5250 1300 50  0001 C CNN
F 3 "" H 5250 1300 50  0001 C CNN
	1    5250 1300
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
