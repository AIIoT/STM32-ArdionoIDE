@Echo Off
title stm32flash STM32duino-bootloader 
ECHO.
ECHO Uploading STM32duino-bootloader for STM32F103C8T6 
ECHO Bin file: generic_boot20_pc13.bin
ECHO Created by: AIIoT site: http://aiiot.c0.pl/
ECHO.
ECHO Turn jumper BOOT0 on 1 (2 jumper next pin reset) this is the mode of loading code through the serial port.
ECHO Connect UART converter, RX do A9 i TX do A10 do not forget about the power supply.
ECHO If you first plug in the power supply and then turn on the jumper, click reset.
ECHO.
ECHO Select a port COM 
ECHO A COM1 
ECHO B COM2
ECHO C COM3
ECHO D COM4
ECHO E COM5
ECHO F COM6
ECHO G COM7
ECHO H COM8
ECHO I COM9
ECHO J COM10
ECHO K COM11
ECHO L COM12
ECHO M COM13
ECHO N COM14
ECHO O COM15
CHOICE /C ABCDEFGHIJKLMNO /N /T 100 /D C /M "The default port is COM4."
IF ERRORLEVEL 1 SET DRIVE=COM1
IF ERRORLEVEL 2 SET DRIVE=COM2
IF ERRORLEVEL 3 SET DRIVE=COM3
IF ERRORLEVEL 4 SET DRIVE=COM4
IF ERRORLEVEL 5 SET DRIVE=COM5
IF ERRORLEVEL 6 SET DRIVE=COM6
IF ERRORLEVEL 7 SET DRIVE=COM7
IF ERRORLEVEL 8 SET DRIVE=COM8
IF ERRORLEVEL 9 SET DRIVE=COM9
IF ERRORLEVEL 10 SET DRIVE=COM10
IF ERRORLEVEL 11 SET DRIVE=COM11
IF ERRORLEVEL 12 SET DRIVE=COM12
IF ERRORLEVEL 13 SET DRIVE=COM13
IF ERRORLEVEL 14 SET DRIVE=COM14
IF ERRORLEVEL 15 SET DRIVE=COM15
ECHO.
ECHO Port selected: %DRIVE% 

:begin
pause
START bootloader\stm32flash.exe -f -v -w bootloader\generic_boot20_pc13.bin %DRIVE%
If errorlevel 0 Goto reetap
If errorlevel 1 Goto end

:reetap
ECHO.
ECHO If the upload window did not pop up, check the attached device and try again.
Goto begin         

:end 
