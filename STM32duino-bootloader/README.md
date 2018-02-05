# Upload programs only through the USB installation guide for STM32duino-bootloader

***Instalacja w jęzuku polskim:***
http://aiiot.c0.pl/web/2017/04/11/bootloader-stm32-arduino-ide-programowanie-przez-usb-dzieki-stm32duino/

This manual is for STM32F103C8T6 and installation under Windows

***Essential files available in the bootlader folder:***
* stm32flash.exe // flash program under Windows
* generic_boot20_pc13.bin // bootlader STM32duino for stm32f103c8t6

Current files can be downloaded from:
* Last STM32duino-bootloader:
https://github.com/rogerclarkmelbourne/STM32duino-bootloader
* Last stm32flash under Windows:
https://sourceforge.net/projects/stm32flash/
* Latest drivers:
https://github.com/rogerclarkmelbourne/Arduino_STM32/

***Connection STM32 with converter:***
* Power to 5V
* Gnd to gnd
* RX to A9
* TX to A10

We also need to put the jumper from BOOT0 to 1 (2 pin next to reset)
To make our board booted in code upload mode via serial port.

***Uploading bootloader:***
In the folder with necessary files (bootloader), click the "shift" and "PPM" (right mouse button)
And select "open the command window here"

In the console, enter:
```
stm32flash.exe -f -v -w generic_boot20_pc13.bin COM8 
```
Where COM8 is the port number of USB UART converter

If we have problems we can use FLASH.BAT however, it has some limitations,
(Such as not informing us about the proper loading of the bootloader, the console window closes after the bootloader uploads need to observe the upload process,
To know that was successful, limited number of com ports to choose from 1 to 15 port)

***Drivers:***
We run "install_drivers.bat" from the "drivers\win" folder.

***Startup:***
You will need an Arduino IDE version of at least 1.6.9.
We go into the settings and add an extra tile definition URL: 
```
http://dan.drown.org/arduino/package_STM32duino_index.json
```
Then on the "Tools" menu, select the "Boards" option "Board Manager", search for "STM32" and install definitions for "STM32F1 *".
Next, select "STM32F103C", program through STM32duino-bootloader, select "Blink" from the examples,
(We change it "13" to "PC13") we connect, select "Tools" in its serial port and click "Upload".
