@Echo Off
title stm32flash: STM32duino-bootloader Flasher - Napisane przez AIIoT 
ECHO.
ECHO Wgrywanie STM32duino-bootloader dla STM32F103C8T6 
ECHO Plik bin: generic_boot20_pc13.bin
ECHO Stworzone przez: AIIoT strona: http://aiiot.c0.pl/
ECHO.
ECHO Przelacz zworke BOOT0 na 1 (2 zworka od pinu reset) jes to trybie wgrywania kodu przez port szeregowy.
ECHO Podlacz konwerter Uart, RX do A9 i TX do A10 GND do GND nie zapomnij o zasilaniu.
ECHO Jesli najpierw podlaczyles zasilania a pozniej przelaczyles zworke, kliknij reset.
ECHO.
ECHO Wybierz port COM 
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
CHOICE /C ABCDEFGHIJKLMNO /N /T 100 /D C /M "Domyslny port to COM4."
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
ECHO Wybrano port: %DRIVE% 

:begin
pause
START bootloader\stm32flash.exe -f -v -w bootloader\generic_boot20_pc13.bin %DRIVE%
If errorlevel 0 Goto reetap
If errorlevel 1 Goto end

:reetap
ECHO.
ECHO Jesli okno wgrywania nie wyskoczylo, sprawdz podlaczone urzadzenie i sprobuj ponownie.
Goto begin         

:end 
