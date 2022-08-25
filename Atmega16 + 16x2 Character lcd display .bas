'======================================================================='

' Title: LCD Display Ohm Meter
' Last Updated :  01.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : Atmega16 + 16x2 Character lcd display

'======================================================================='

$regfile = "m16def.dat"
$crystal = 1000000
Config Lcdpin = Pin , Db4 = Portd.4 , Db5 = Portd.5 , Db6 = Portd.6 , _
Db7 = Portd.7 , E = Portd.3 , Rs = Portd.2
Config Lcd = 16 * 2
Config Adc = Single , Prescaler = Auto
Config Portb = Input
Dim A As Word
Dim B As Byte
Dim I As Single
Dim R As Single
Dim V1 As Single
Dim V2 As Single
Start Adc
Cursor Off
Locate 1 , 6
Lcd "PLEASE"
Locate 2 , 3
Lcd "SELECT RANGE"

'*****************************************

Do

Main:

A = Getadc(0)
V2 = A * 0.004887
V1 = 5 - V2
I = V1 / 1000
R = V2 / I

B = Pinb

Select Case B

Case Is = &B00000001
Cls
Home
Lcd " Ohm"
Lowerline
Lcd " R =" ; R
Waitms 100

Goto Main


Case Is = &B00000010
R = R / 1000
Cls
Home
Lcd " Kilo Ohm"
Lowerline
Lcd " R =" ; R
Waitms 100

Goto Main

End Select

Loop

End



