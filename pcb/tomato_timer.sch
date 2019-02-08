EESchema Schematic File Version 4
LIBS:tomato_timer-cache
EELAYER 26 0
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
L Device:Speaker_Crystal LS1
U 1 1 5A4636B7
P 3100 4200
F 0 "LS1" H 3400 4250 50  0000 R CNN
F 1 "Speaker_Crystal" H 3850 4100 50  0000 R CNN
F 2 "tomato_timer:Buzzer160" H 3065 4150 50  0001 C CNN
F 3 "" H 3065 4150 50  0001 C CNN
	1    3100 4200
	-1   0    0    1   
$EndComp
Text Label 3650 3850 0    60   ~ 0
BUZZER
$Comp
L Device:R R5
U 1 1 5A463ABF
P 6500 5300
F 0 "R5" V 6580 5300 50  0000 C CNN
F 1 "10K" V 6500 5300 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6430 5300 50  0001 C CNN
F 3 "" H 6500 5300 50  0001 C CNN
	1    6500 5300
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5A463B64
P 7700 5300
F 0 "R6" V 7780 5300 50  0000 C CNN
F 1 "10K" V 7700 5300 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7630 5300 50  0001 C CNN
F 3 "" H 7700 5300 50  0001 C CNN
	1    7700 5300
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
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
L Switch:SW_Push SW4
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
Text Label 7100 5850 1    60   ~ 0
GND
$Comp
L Switch:SW_Push SW2
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
	7600 5050 7700 5050
Wire Wire Line
	7000 5050 7100 5050
Connection ~ 7100 5050
Wire Wire Line
	6500 5550 7100 5550
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
	6500 4800 6500 5050
Wire Wire Line
	7150 4050 7150 4800
Wire Wire Line
	7150 4800 7700 4800
Wire Wire Line
	7700 4800 7700 5050
Wire Wire Line
	4150 3150 3700 3150
Wire Wire Line
	7100 5050 7100 5300
Text Label 7100 5300 1    60   ~ 0
5V
Text Label 3000 3150 0    60   ~ 0
GND
Wire Wire Line
	3000 3150 3300 3150
$Comp
L tomato-timer:ARDUINO_SHIELD TOMATO_SHIELD1
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
NoConn ~ 4150 2950
NoConn ~ 4150 3050
NoConn ~ 4150 3650
Text Label 3900 3550 0    60   ~ 0
GND
Text Label 3300 3650 0    60   ~ 0
GND
Wire Wire Line
	3900 3550 4150 3550
Text Label 3300 3350 0    60   ~ 0
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
L Transistor_FET:BSS138 Q2
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
L Device:R R4
U 1 1 5A481AD9
P 3250 5950
F 0 "R4" V 3330 5950 50  0000 C CNN
F 1 "10K" V 3250 5950 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3180 5950 50  0001 C CNN
F 3 "" H 3250 5950 50  0001 C CNN
	1    3250 5950
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5A481CF0
P 3150 5350
F 0 "R3" V 3230 5350 50  0000 C CNN
F 1 "10K" V 3150 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3080 5350 50  0001 C CNN
F 3 "" H 3150 5350 50  0001 C CNN
	1    3150 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3400 5150 3400 5350
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
L Transistor_FET:BSS138 Q1
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
L Device:R R2
U 1 1 5A482886
P 2100 5950
F 0 "R2" V 2180 5950 50  0000 C CNN
F 1 "10K" V 2100 5950 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 2030 5950 50  0001 C CNN
F 3 "" H 2100 5950 50  0001 C CNN
	1    2100 5950
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5A48288F
P 2000 5350
F 0 "R1" V 2080 5350 50  0000 C CNN
F 1 "10K" V 2000 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1930 5350 50  0001 C CNN
F 3 "" H 2000 5350 50  0001 C CNN
	1    2000 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2250 5150 2250 5350
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
	3950 5300 3950 5550
Text Label 3950 5300 3    60   ~ 0
3V3
NoConn ~ 6050 2650
$Comp
L tomato-timer:XBeeSeries1 U1
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
Text Label 3800 6850 0    60   ~ 0
GND
$Comp
L Device:C C1
U 1 1 5A4990AD
P 4200 5550
F 0 "C1" H 4225 5650 50  0000 L CNN
F 1 "0.1uF" H 4225 5450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4238 5400 50  0001 C CNN
F 3 "" H 4200 5550 50  0001 C CNN
	1    4200 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 5550 4350 5300
Text Label 4350 5300 3    60   ~ 0
GND
Wire Wire Line
	4050 5550 3950 5550
Connection ~ 3950 5550
Text Label 3100 4400 0    60   ~ 0
GND
Wire Wire Line
	7100 5050 7200 5050
Wire Wire Line
	7700 5050 7700 5150
Wire Wire Line
	6500 5050 6500 5150
Wire Wire Line
	7100 5550 7700 5550
Wire Wire Line
	3400 5350 3400 5450
Wire Wire Line
	2250 5350 2250 5450
Wire Wire Line
	3950 5550 3950 5950
Wire Wire Line
	6050 2850 6300 2850
Text Label 6300 2850 2    50   ~ 0
GND
$Comp
L Device:R R7
U 1 1 5C489D66
P 7000 3750
F 0 "R7" V 6793 3750 50  0000 C CNN
F 1 "470" V 6884 3750 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6930 3750 50  0001 C CNN
F 3 "~" H 7000 3750 50  0001 C CNN
	1    7000 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 3750 6850 3750
$Comp
L LED:NeoPixel_THT D2
U 1 1 5C48DCF9
P 7650 3750
F 0 "D2" H 7700 3400 50  0000 L CNN
F 1 "NeoPixelRing" H 7700 3500 50  0000 L CNN
F 2 "tomato-timer:NeoPixelRing_12" H 7700 3450 50  0001 L TNN
F 3 "https://www.adafruit.com/product/1938" H 7750 3375 50  0001 L TNN
	1    7650 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3750 7350 3750
$Comp
L LED:NeoPixel_THT D1
U 1 1 5C495986
P 7650 2950
F 0 "D1" H 7700 3200 50  0000 L CNN
F 1 "NeoPixel_Strip" H 7700 2700 50  0000 L CNN
F 2 "tomato-timer:SSW-104-02-G-S-RA_4POS_Female_Header" H 7700 2650 50  0001 L TNN
F 3 "https://www.adafruit.com/product/1938" H 7750 2575 50  0001 L TNN
	1    7650 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4050 7650 4150
Wire Wire Line
	6050 3450 7100 3450
Wire Wire Line
	7100 2950 7350 2950
Wire Wire Line
	7650 2650 7650 2600
$Comp
L Device:R R8
U 1 1 5C4AD420
P 7100 3200
F 0 "R8" H 7170 3246 50  0000 L CNN
F 1 "470" H 7170 3155 50  0000 L CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7030 3200 50  0001 C CNN
F 3 "~" H 7100 3200 50  0001 C CNN
	1    7100 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2950 7100 3050
Wire Wire Line
	7100 3350 7100 3450
$Comp
L tomato-timer:Barrel_Jack J1
U 1 1 5C51A2A7
P 10500 3350
F 0 "J1" H 10271 3308 50  0000 R CNN
F 1 "External_Power" H 10271 3399 50  0000 R CNN
F 2 "Connectors:BARREL_JACK" H 10550 3310 50  0001 C CNN
F 3 "~" H 10550 3310 50  0001 C CNN
	1    10500 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7650 3450 8550 3450
Wire Wire Line
	8550 3450 8550 2600
Wire Wire Line
	7650 2600 8550 2600
Wire Wire Line
	7650 3250 8400 3250
Wire Wire Line
	8400 3250 8400 4150
Wire Wire Line
	7650 4150 8400 4150
$Comp
L Device:CP C2
U 1 1 5C539ABA
P 9600 3350
F 0 "C2" H 9400 3400 50  0000 L CNN
F 1 "1000uF" H 9200 3300 50  0000 L CNN
F 2 "tomato-timer:SMD-2824" H 9638 3200 50  0001 C CNN
F 3 "~" H 9600 3350 50  0001 C CNN
	1    9600 3350
	1    0    0    1   
$EndComp
Wire Wire Line
	9750 3500 9600 3500
Wire Wire Line
	9750 3200 9600 3200
Wire Wire Line
	9600 3500 9050 3500
Connection ~ 9600 3500
Wire Wire Line
	9600 3200 9050 3200
Connection ~ 9600 3200
Text Label 6050 3750 0    50   ~ 0
PIXEL_RING_PIN
Text Label 6050 3450 0    50   ~ 0
PIXEL_STRIP_PIN
NoConn ~ 7950 3750
NoConn ~ 7950 2950
Wire Wire Line
	8550 3450 9050 3450
Wire Wire Line
	9050 3450 9050 3500
Connection ~ 8550 3450
Wire Wire Line
	8400 3250 9050 3250
Wire Wire Line
	9050 3250 9050 3200
Connection ~ 8400 3250
Text Label 9300 4150 2    50   ~ 0
GND
Text Label 9400 2600 2    50   ~ 0
5V
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 5C585EE1
P 8750 4150
F 0 "JP1" H 8750 4385 50  0000 C CNN
F 1 "Jumper_2_Open" H 8750 4294 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 8750 4150 50  0001 C CNN
F 3 "~" H 8750 4150 50  0001 C CNN
	1    8750 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4150 8550 4150
Connection ~ 8400 4150
Wire Wire Line
	8950 4150 9300 4150
$Comp
L Jumper:Jumper_2_Open JP2
U 1 1 5C58DD6A
P 8900 2600
F 0 "JP2" H 8900 2835 50  0000 C CNN
F 1 "Jumper_2_Open" H 8900 2744 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 8900 2600 50  0001 C CNN
F 3 "~" H 8900 2600 50  0001 C CNN
	1    8900 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2600 8700 2600
Connection ~ 8550 2600
Wire Wire Line
	9100 2600 9400 2600
NoConn ~ 6050 3350
NoConn ~ 6050 3250
NoConn ~ 6050 3150
NoConn ~ 6050 3050
NoConn ~ 6050 2950
NoConn ~ 6050 3650
NoConn ~ 6050 3850
NoConn ~ 6050 3950
Wire Wire Line
	2250 6150 2250 5950
Wire Wire Line
	2250 5950 2250 5850
Connection ~ 2250 5950
Wire Wire Line
	3400 6050 3400 5950
Wire Wire Line
	3400 5950 3400 5850
Connection ~ 3400 5950
Wire Wire Line
	9750 3450 9750 3500
Text Label 10200 3450 2    50   ~ 0
5V_IN
Text Label 10200 3250 2    50   ~ 0
GND_IN
Wire Wire Line
	9750 3200 9750 3250
Wire Wire Line
	9750 3250 10200 3250
Wire Wire Line
	9750 3450 10200 3450
$Comp
L Device:R_POT RV1
U 1 1 5C5939E4
P 3550 4100
F 0 "RV1" H 3480 4054 50  0000 R CNN
F 1 "10K" H 3480 4145 50  0000 R CNN
F 2 "tomato-timer:Whell_Potentiometer_3352T" H 3550 4100 50  0001 C CNN
F 3 "~" H 3550 4100 50  0001 C CNN
	1    3550 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3400 4100 3300 4100
Wire Wire Line
	4150 3850 3550 3850
Wire Wire Line
	3550 3850 3550 3950
Wire Wire Line
	3550 4250 3550 4400
Wire Wire Line
	3550 4400 3400 4400
Wire Wire Line
	3300 4200 3400 4200
Wire Wire Line
	3400 4200 3400 4400
Connection ~ 3400 4400
Wire Wire Line
	3400 4400 3100 4400
Wire Wire Line
	4150 3450 3850 3450
$Comp
L Device:C C3
U 1 1 5C5AD1FF
P 3700 3500
F 0 "C3" H 3586 3454 50  0000 R CNN
F 1 "0.1uF" H 3586 3545 50  0000 R CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3738 3350 50  0001 C CNN
F 3 "~" H 3700 3500 50  0001 C CNN
	1    3700 3500
	1    0    0    1   
$EndComp
Wire Wire Line
	3300 3350 3700 3350
Wire Wire Line
	3300 3650 3700 3650
Connection ~ 3700 3650
Wire Wire Line
	3700 3650 3850 3650
Connection ~ 3700 3350
Wire Wire Line
	3700 3350 4150 3350
Wire Wire Line
	3850 3450 3850 3650
$EndSCHEMATC
