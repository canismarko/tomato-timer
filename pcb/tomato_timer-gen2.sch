EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:freetronics_schematic
LIBS:xbee
LIBS:tomato_timer-gen2-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L LED D1
U 1 1 5A45ECAF
P 8350 1800
F 0 "D1" H 8350 1900 50  0000 C CNN
F 1 "Red" H 8350 1700 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 8350 1800 50  0001 C CNN
F 3 "" H 8350 1800 50  0001 C CNN
	1    8350 1800
	-1   0    0    -1  
$EndComp
$Comp
L LED D7
U 1 1 5A45EEE2
P 8650 2000
F 0 "D7" H 8650 2100 50  0000 C CNN
F 1 "Red" H 8650 1900 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 8650 2000 50  0001 C CNN
F 3 "" H 8650 2000 50  0001 C CNN
	1    8650 2000
	-1   0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 5A45EF0F
P 8350 2200
F 0 "D2" H 8350 2300 50  0000 C CNN
F 1 "Red" H 8350 2100 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 8350 2200 50  0001 C CNN
F 3 "" H 8350 2200 50  0001 C CNN
	1    8350 2200
	-1   0    0    -1  
$EndComp
$Comp
L LED D8
U 1 1 5A45EF3B
P 8650 2400
F 0 "D8" H 8650 2500 50  0000 C CNN
F 1 "Red" H 8650 2300 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 8650 2400 50  0001 C CNN
F 3 "" H 8650 2400 50  0001 C CNN
	1    8650 2400
	-1   0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5A45EFEB
P 7700 1800
F 0 "R7" V 7780 1800 50  0000 C CNN
F 1 "470" V 7700 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7630 1800 50  0001 C CNN
F 3 "" H 7700 1800 50  0001 C CNN
	1    7700 1800
	0    1    1    0   
$EndComp
$Comp
L LED D3
U 1 1 5A45F0BA
P 8350 2600
F 0 "D3" H 8350 2700 50  0000 C CNN
F 1 "Red" H 8350 2500 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 8350 2600 50  0001 C CNN
F 3 "" H 8350 2600 50  0001 C CNN
	1    8350 2600
	-1   0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 5A45F2B9
P 7950 2000
F 0 "R13" V 8030 2000 50  0000 C CNN
F 1 "470" V 7950 2000 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7880 2000 50  0001 C CNN
F 3 "" H 7950 2000 50  0001 C CNN
	1    7950 2000
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 5A45F2EF
P 7700 2200
F 0 "R8" V 7780 2200 50  0000 C CNN
F 1 "470" V 7700 2200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7630 2200 50  0001 C CNN
F 3 "" H 7700 2200 50  0001 C CNN
	1    7700 2200
	0    1    1    0   
$EndComp
$Comp
L R R14
U 1 1 5A45F336
P 7950 2400
F 0 "R14" V 8030 2400 50  0000 C CNN
F 1 "470" V 7950 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7880 2400 50  0001 C CNN
F 3 "" H 7950 2400 50  0001 C CNN
	1    7950 2400
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 5A45F378
P 7700 2600
F 0 "R9" V 7780 2600 50  0000 C CNN
F 1 "470" V 7700 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7630 2600 50  0001 C CNN
F 3 "" H 7700 2600 50  0001 C CNN
	1    7700 2600
	0    1    1    0   
$EndComp
Text Label 7300 1800 0    60   ~ 0
RED0
Text Label 7300 2000 0    60   ~ 0
RED1
Text Label 7300 2200 0    60   ~ 0
RED2
Text Label 7300 2400 0    60   ~ 0
RED3
Text Label 7300 2600 0    60   ~ 0
RED4
$Comp
L LED D4
U 1 1 5A461482
P 8350 3000
F 0 "D4" H 8350 3100 50  0000 C CNN
F 1 "Green" H 8350 2900 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 8350 3000 50  0001 C CNN
F 3 "" H 8350 3000 50  0001 C CNN
	1    8350 3000
	-1   0    0    -1  
$EndComp
$Comp
L LED D9
U 1 1 5A461488
P 8650 3200
F 0 "D9" H 8650 3300 50  0000 C CNN
F 1 "Green" H 8650 3100 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 8650 3200 50  0001 C CNN
F 3 "" H 8650 3200 50  0001 C CNN
	1    8650 3200
	-1   0    0    -1  
$EndComp
$Comp
L LED D5
U 1 1 5A46148E
P 8350 3400
F 0 "D5" H 8350 3500 50  0000 C CNN
F 1 "Green" H 8350 3300 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 8350 3400 50  0001 C CNN
F 3 "" H 8350 3400 50  0001 C CNN
	1    8350 3400
	-1   0    0    -1  
$EndComp
$Comp
L LED D10
U 1 1 5A461494
P 8650 3600
F 0 "D10" H 8650 3700 50  0000 C CNN
F 1 "Green" H 8650 3500 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 8650 3600 50  0001 C CNN
F 3 "" H 8650 3600 50  0001 C CNN
	1    8650 3600
	-1   0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5A46149A
P 7700 3000
F 0 "R10" V 7780 3000 50  0000 C CNN
F 1 "470" V 7700 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7630 3000 50  0001 C CNN
F 3 "" H 7700 3000 50  0001 C CNN
	1    7700 3000
	0    1    1    0   
$EndComp
$Comp
L LED D6
U 1 1 5A4614A1
P 8350 3800
F 0 "D6" H 8350 3900 50  0000 C CNN
F 1 "Green" H 8350 3700 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 8350 3800 50  0001 C CNN
F 3 "" H 8350 3800 50  0001 C CNN
	1    8350 3800
	-1   0    0    -1  
$EndComp
$Comp
L R R15
U 1 1 5A4614A7
P 7950 3200
F 0 "R15" V 8030 3200 50  0000 C CNN
F 1 "470" V 7950 3200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7880 3200 50  0001 C CNN
F 3 "" H 7950 3200 50  0001 C CNN
	1    7950 3200
	0    1    1    0   
$EndComp
$Comp
L R R11
U 1 1 5A4614AD
P 7700 3400
F 0 "R11" V 7780 3400 50  0000 C CNN
F 1 "470" V 7700 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7630 3400 50  0001 C CNN
F 3 "" H 7700 3400 50  0001 C CNN
	1    7700 3400
	0    1    1    0   
$EndComp
$Comp
L R R16
U 1 1 5A4614B3
P 7950 3600
F 0 "R16" V 8030 3600 50  0000 C CNN
F 1 "470" V 7950 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7880 3600 50  0001 C CNN
F 3 "" H 7950 3600 50  0001 C CNN
	1    7950 3600
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 5A4614B9
P 7700 3800
F 0 "R12" V 7780 3800 50  0000 C CNN
F 1 "470" V 7700 3800 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7630 3800 50  0001 C CNN
F 3 "" H 7700 3800 50  0001 C CNN
	1    7700 3800
	0    1    1    0   
$EndComp
Text Label 7300 3000 0    60   ~ 0
GRN0
Text Label 7300 3200 0    60   ~ 0
GRN1
Text Label 7300 3400 0    60   ~ 0
GRN2
Text Label 7300 3600 0    60   ~ 0
GRN3
Text Label 7300 3800 0    60   ~ 0
GRN4
Text Label 6050 3450 0    60   ~ 0
RED4
Text Label 6050 3650 0    60   ~ 0
RED0
Text Label 6050 3750 0    60   ~ 0
RED3
Text Label 6050 3850 0    60   ~ 0
RED1
Text Label 6050 3950 0    60   ~ 0
RED2
Text Label 6050 2950 0    60   ~ 0
GRN0
Text Label 6050 3050 0    60   ~ 0
GRN1
Text Label 6050 3150 0    60   ~ 0
GRN2
Text Label 6050 3250 0    60   ~ 0
GRN3
Text Label 6050 3350 0    60   ~ 0
GRN4
$Comp
L SW_SPDT SW1
U 1 1 5A463556
P 2900 4000
F 0 "SW1" H 2900 4170 50  0000 C CNN
F 1 "SW_SPDT" H 2900 3800 50  0000 C CNN
F 2 "tomato_timer:Tomato_SPDT_Switch" H 2900 4000 50  0001 C CNN
F 3 "" H 2900 4000 50  0001 C CNN
	1    2900 4000
	-1   0    0    -1  
$EndComp
$Comp
L Speaker_Crystal LS1
U 1 1 5A4636B7
P 2150 4400
F 0 "LS1" H 2450 4450 50  0000 R CNN
F 1 "Speaker_Crystal" H 2900 4300 50  0000 R CNN
F 2 "tomato_timer:Buzzer160" H 2115 4350 50  0001 C CNN
F 3 "" H 2115 4350 50  0001 C CNN
	1    2150 4400
	-1   0    0    1   
$EndComp
Text Label 3650 3850 0    60   ~ 0
BUZZER
$Comp
L R R5
U 1 1 5A463ABF
P 6500 5300
F 0 "R5" V 6580 5300 50  0000 C CNN
F 1 "10K" V 6500 5300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6430 5300 50  0001 C CNN
F 3 "" H 6500 5300 50  0001 C CNN
	1    6500 5300
	-1   0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5A463B64
P 7700 5300
F 0 "R6" V 7780 5300 50  0000 C CNN
F 1 "10K" V 7700 5300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7630 5300 50  0001 C CNN
F 3 "" H 7700 5300 50  0001 C CNN
	1    7700 5300
	-1   0    0    -1  
$EndComp
$Comp
L SW_Push SW3
U 1 1 5A46426E
P 6800 5050
F 0 "SW3" H 6850 5150 50  0000 L CNN
F 1 "SW_Start" H 6800 4990 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 6800 5250 50  0001 C CNN
F 3 "" H 6800 5250 50  0001 C CNN
	1    6800 5050
	-1   0    0    1   
$EndComp
$Comp
L SW_Push SW4
U 1 1 5A464339
P 7400 5050
F 0 "SW4" H 7450 5150 50  0000 L CNN
F 1 "SW_Stop" H 7400 4990 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 7400 5250 50  0001 C CNN
F 3 "" H 7400 5250 50  0001 C CNN
	1    7400 5050
	1    0    0    1   
$EndComp
Text Label 6050 4150 0    60   ~ 0
BTN_START
Text Label 6050 4050 0    60   ~ 0
BTN_STOP
Text Label 7100 5600 3    60   ~ 0
GND1
$Comp
L SW_Push SW2
U 1 1 5A467038
P 3500 3150
F 0 "SW2" H 3550 3250 50  0000 L CNN
F 1 "SW_Reset" H 3500 3090 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 3500 3350 50  0001 C CNN
F 3 "" H 3500 3350 50  0001 C CNN
	1    3500 3150
	-1   0    0    -1  
$EndComp
Text Label 4050 3150 2    60   ~ 0
RESET
Wire Wire Line
	7850 1800 8200 1800
Wire Wire Line
	8100 2000 8500 2000
Wire Wire Line
	8200 2200 7850 2200
Wire Wire Line
	8100 2400 8500 2400
Wire Wire Line
	7850 2600 8200 2600
Wire Wire Line
	7550 1800 7300 1800
Wire Wire Line
	7800 2000 7300 2000
Wire Wire Line
	7550 2200 7300 2200
Wire Wire Line
	7800 2400 7300 2400
Wire Wire Line
	7550 2600 7300 2600
Wire Wire Line
	7850 3000 8200 3000
Wire Wire Line
	8100 3200 8500 3200
Wire Wire Line
	8200 3400 7850 3400
Wire Wire Line
	8100 3600 8500 3600
Wire Wire Line
	7850 3800 8200 3800
Wire Wire Line
	7550 3000 7300 3000
Wire Wire Line
	7800 3200 7300 3200
Wire Wire Line
	7550 3400 7300 3400
Wire Wire Line
	7800 3600 7300 3600
Wire Wire Line
	7550 3800 7300 3800
Wire Wire Line
	6050 3450 6300 3450
Wire Wire Line
	6050 3650 6300 3650
Wire Wire Line
	6050 3750 6300 3750
Wire Wire Line
	6050 3850 6300 3850
Wire Wire Line
	6050 3950 6300 3950
Wire Wire Line
	6050 2950 6300 2950
Wire Wire Line
	6050 3050 6300 3050
Wire Wire Line
	6050 3150 6300 3150
Wire Wire Line
	6050 3250 6300 3250
Wire Wire Line
	6050 3350 6300 3350
Wire Wire Line
	3500 3850 4150 3850
Wire Wire Line
	7600 5050 7700 5050
Wire Wire Line
	7000 5050 7200 5050
Connection ~ 7100 5050
Wire Wire Line
	6500 5550 7700 5550
Wire Wire Line
	7700 5550 7700 5450
Connection ~ 7700 5050
Wire Wire Line
	6500 5550 6500 5450
Wire Wire Line
	6500 5050 6600 5050
Connection ~ 6500 5050
Wire Wire Line
	7100 5850 7100 5550
Connection ~ 7100 5550
Wire Wire Line
	7050 4150 7050 4800
Wire Wire Line
	7050 4800 6500 4800
Wire Wire Line
	6500 4800 6500 5150
Wire Wire Line
	7150 4050 7150 4800
Wire Wire Line
	7150 4800 7700 4800
Wire Wire Line
	7700 4800 7700 5150
Wire Wire Line
	4150 3150 3700 3150
Wire Wire Line
	8500 1800 9000 1800
Wire Wire Line
	9000 1800 9000 4100
Wire Wire Line
	8500 3800 9000 3800
Connection ~ 9000 3800
Wire Wire Line
	8800 3600 9000 3600
Connection ~ 9000 3600
Wire Wire Line
	8500 3400 9000 3400
Connection ~ 9000 3400
Wire Wire Line
	8800 3200 9000 3200
Connection ~ 9000 3200
Wire Wire Line
	8500 3000 9000 3000
Connection ~ 9000 3000
Wire Wire Line
	8500 2600 9000 2600
Connection ~ 9000 2600
Wire Wire Line
	8800 2400 9000 2400
Connection ~ 9000 2400
Wire Wire Line
	8500 2200 9000 2200
Connection ~ 9000 2200
Wire Wire Line
	8800 2000 9000 2000
Connection ~ 9000 2000
Wire Wire Line
	7100 5050 7100 5300
Text Label 7100 5300 1    60   ~ 0
5V
Text Label 3000 3150 0    60   ~ 0
GND1
Text Label 8650 4100 0    60   ~ 0
GND2
Wire Wire Line
	3000 3150 3300 3150
Wire Wire Line
	9000 4100 8650 4100
$Comp
L ARDUINO_SHIELD TOMATO_SHIELD1
U 1 1 5A47D418
P 5100 3550
F 0 "TOMATO_SHIELD1" H 4650 4700 60  0000 C CNN
F 1 "ARDUINO_SHIELD" H 5150 2600 60  0000 C CNN
F 2 "freetronics_footprints:ARDUINO_SHIELD" H 5100 3350 50  0001 C CNN
F 3 "" H 5100 3550 60  0000 C CNN
	1    5100 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4050 6050 4050
Wire Wire Line
	7050 4150 6050 4150
Wire Wire Line
	4150 3250 3900 3250
Wire Wire Line
	4150 3350 3900 3350
Wire Wire Line
	6050 2850 6300 2850
Text Label 6050 2850 0    60   ~ 0
GND3
NoConn ~ 4150 2950
NoConn ~ 4150 3050
NoConn ~ 4150 3650
Text Label 3900 3550 0    60   ~ 0
GND2
Text Label 3900 3450 0    60   ~ 0
GND1
Wire Wire Line
	4150 3450 3900 3450
Wire Wire Line
	3900 3550 4150 3550
Text Label 3900 3350 0    60   ~ 0
5V
Text Label 3900 3250 0    60   ~ 0
3V3
NoConn ~ 4150 3950
NoConn ~ 4150 4050
NoConn ~ 4150 4150
NoConn ~ 4150 4250
NoConn ~ 4150 4350
NoConn ~ 6050 2550
NoConn ~ 6050 2750
NoConn ~ 5000 2050
NoConn ~ 5000 2150
NoConn ~ 5000 2250
NoConn ~ 6050 2250
NoConn ~ 6050 2150
NoConn ~ 6050 2050
NoConn ~ 4050 6250
NoConn ~ 4050 6350
NoConn ~ 4050 6450
NoConn ~ 4050 6650
NoConn ~ 4050 6750
NoConn ~ 6150 6850
NoConn ~ 6150 6750
NoConn ~ 6150 6650
NoConn ~ 6150 6550
NoConn ~ 6150 6450
NoConn ~ 6150 6350
NoConn ~ 6150 6250
NoConn ~ 6150 6150
NoConn ~ 6150 6050
$Comp
L BSS138 Q2
U 1 1 5A481955
P 3300 5650
F 0 "Q2" H 3500 5725 50  0000 L CNN
F 1 "BSS138" H 3500 5650 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 3500 5575 50  0001 L CIN
F 3 "" H 3300 5650 50  0001 L CNN
	1    3300 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5650 3100 5950
$Comp
L R R4
U 1 1 5A481AD9
P 3250 5950
F 0 "R4" V 3330 5950 50  0000 C CNN
F 1 "10K" V 3250 5950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3180 5950 50  0001 C CNN
F 3 "" H 3250 5950 50  0001 C CNN
	1    3250 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	3400 5850 3400 6050
Connection ~ 3400 5950
$Comp
L R R3
U 1 1 5A481CF0
P 3150 5350
F 0 "R3" V 3230 5350 50  0000 C CNN
F 1 "10K" V 3150 5350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3080 5350 50  0001 C CNN
F 3 "" H 3150 5350 50  0001 C CNN
	1    3150 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3400 5150 3400 5450
Wire Wire Line
	3300 5350 3400 5350
Connection ~ 3400 5350
Text Label 3400 5150 3    60   ~ 0
RX
Text Label 2850 5950 0    60   ~ 0
3V3
Wire Wire Line
	3100 5950 2850 5950
Wire Wire Line
	3000 5350 2800 5350
Text Label 2800 5350 0    60   ~ 0
5V
$Comp
L BSS138 Q1
U 1 1 5A48287F
P 2150 5650
F 0 "Q1" H 2350 5725 50  0000 L CNN
F 1 "BSS138" H 2350 5650 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2350 5575 50  0001 L CIN
F 3 "" H 2150 5650 50  0001 L CNN
	1    2150 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 5650 1950 5950
$Comp
L R R2
U 1 1 5A482886
P 2100 5950
F 0 "R2" V 2180 5950 50  0000 C CNN
F 1 "10K" V 2100 5950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2030 5950 50  0001 C CNN
F 3 "" H 2100 5950 50  0001 C CNN
	1    2100 5950
	0    1    1    0   
$EndComp
Connection ~ 2250 5950
$Comp
L R R1
U 1 1 5A48288F
P 2000 5350
F 0 "R1" V 2080 5350 50  0000 C CNN
F 1 "10K" V 2000 5350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1930 5350 50  0001 C CNN
F 3 "" H 2000 5350 50  0001 C CNN
	1    2000 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2250 5150 2250 5450
Wire Wire Line
	2150 5350 2250 5350
Connection ~ 2250 5350
Text Label 2250 5150 3    60   ~ 0
TX
Text Label 1700 5950 0    60   ~ 0
3V3
Wire Wire Line
	1950 5950 1700 5950
Wire Wire Line
	1850 5350 1650 5350
Text Label 1650 5350 0    60   ~ 0
5V
Wire Wire Line
	2250 5850 2250 6150
Wire Wire Line
	2250 6150 4050 6150
Wire Wire Line
	3400 6050 4050 6050
Wire Wire Line
	6050 4350 6300 4350
Text Label 6300 4350 2    60   ~ 0
RX
Wire Wire Line
	6050 4250 6300 4250
Text Label 6300 4250 2    60   ~ 0
TX
Text Label 4050 6050 2    60   ~ 0
DOUT
Text Label 3900 6150 0    60   ~ 0
DIN
Wire Wire Line
	3950 5950 4050 5950
Wire Wire Line
	3950 5300 3950 5950
Text Label 3950 5300 3    60   ~ 0
3V3
NoConn ~ 6050 2650
$Comp
L XBeeSeries1 U1
U 1 1 5A497057
P 5100 6400
F 0 "U1" H 5100 7400 60  0000 C CNN
F 1 "XBeeSeries1" H 5100 5800 60  0000 C CNN
F 2 "tomato_timer:XBee802.154.4" H 5100 6400 60  0001 C CNN
F 3 "" H 5100 6400 60  0001 C CNN
	1    5100 6400
	1    0    0    -1  
$EndComp
NoConn ~ 4050 6550
NoConn ~ 6150 5950
Wire Wire Line
	4050 6850 3800 6850
Text Label 4050 6850 2    60   ~ 0
GND1
$Comp
L C C1
U 1 1 5A4990AD
P 4200 5550
F 0 "C1" H 4225 5650 50  0000 L CNN
F 1 "0.1uF" H 4225 5450 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 4238 5400 50  0001 C CNN
F 3 "" H 4200 5550 50  0001 C CNN
	1    4200 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 5550 4350 5300
Text Label 4350 5300 3    60   ~ 0
GND1
Wire Wire Line
	4050 5550 3950 5550
Connection ~ 3950 5550
Text Label 3050 4600 2    60   ~ 0
GND3
NoConn ~ 2700 3900
$Comp
L R R17
U 1 1 5A4AD62E
P 2550 4350
F 0 "R17" V 2630 4350 50  0000 C CNN
F 1 "1K" V 2550 4350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2480 4350 50  0001 C CNN
F 3 "" H 2550 4350 50  0001 C CNN
	1    2550 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4100 2700 4100
Wire Wire Line
	2350 4100 2350 4300
Wire Wire Line
	2550 4200 2550 4100
Connection ~ 2550 4100
Wire Wire Line
	2350 4400 2350 4600
Wire Wire Line
	2350 4600 3050 4600
Wire Wire Line
	2550 4500 2550 4600
Connection ~ 2550 4600
$Comp
L POT RV1
U 1 1 5A4ADEFF
P 3350 3850
F 0 "RV1" V 3175 3850 50  0000 C CNN
F 1 "POT" V 3250 3850 50  0000 C CNN
F 2 "tomato_timer:Bourns_3310P_Potentiometer" H 3350 3850 50  0001 C CNN
F 3 "" H 3350 3850 50  0001 C CNN
	1    3350 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4000 3350 4000
NoConn ~ 3350 3700
$EndSCHEMATC