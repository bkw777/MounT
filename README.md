# MounT
Mount a microcontroller dev board on a "Model T"

This repo has a few different adapter boards to attach some common small DIP form factor microcontroller boards directly to "Model T" computers by the serial port.

Particularly, boards with integrated SD card readers, for use with [PDDuino](https://github.com/bkw777/PDDuino).

You can power the microcontroller board from the computer using a [BCR-USB power adapter](https://github.com/bkw777/BCR_Breakout)

These adapter boards take the place of a serial cable, gender/null-modem adapters, rs-232/ttl level-shifter module, and breadboard, and let you stick the microcontroller board directly onto the serial port of a TRS-80 Model 100 or any of it's clones.

"Model T" computers are:  
 TRS-80/TANDY Model 100, 102, 200, 600  
 NEC PC-8201, PC-8201a, PC-8300  
 Olivetti M10  
 Kyotronic KC-85  

There is also one adapter for Adafruit Feather to Cambridge Z88

These adapters employ a staggered row footprint for the pin headers, which acts like a friction fit socket to connect the microcontroller board to the adatpter board without having to solder it permanently and without needing actual sockets.<br>
This way the microcontroller board is still removable like with a socket, yet low profile as if you had soldered it with no sockets.<br>

You can still install real sockets if you want to, or solder the microcontroller board permanently if you want to.

One feature of normal socket headers that can be either good or bad, is they are 8.5mm tall. That makes the controller board stick out more than it needs to, but it also provides a handy space between the microcontroller board and the adapter board where you can stuff a lipo battery, or stuff the excess usb cable from the BCR port adapter.

These adapers (so far), make the following connections between the "Model T" and the microcontroller:
<pre>
Model T              MCU
TX  --> MAX3232 -->  RX  (first/main non-usb hardware serial port RX pin)
RX  <-- MAX3232 <--  TX  (first/main non-usb hardware serial port TX pin)
DTR --> MAX3232 -->  5   (Arduino pin 5)
DSR <-+ MAX3232 <--  6   (Arduino pin 6)
DCD <-+
CTS --- \jumper
RTS --- /
</pre>

## Microcontroller Boards  

### Adafruit Feather
![](MounT_Feather_1.jpg)  
![](MounT_Feather_2.jpg)  
![](MounT_Feather.svg)  

PCB: <https://oshpark.com/shared_projects/2dQFvuVI><br>
BOM: <https://www.digikey.com/short/zf3z0p>

Adafruit Feather Adalogger boards can be powered by a lipo battery instead of, or as well as, the BCR port adapter (or other usb power source).<br>
The Feather board includes both a JST connector for a lipo cell, and an on-board lipo cell manager so that it charges when you supply power to the usb port, and provides power when there is no power from the usb port.<br>

Avoid connecting a battery and the BCR port adapter at the same time. The charging circuit on the Feather board will try to charge the battery at 100ma any time there is power available from the usb port. But that is too much current to draw from the BCR port. So, either connect a battery, OR the BCR port adapter, not both at the same time.<br>
If you are going to use a battery, you can charge it by just connecting any usb power source (except the BCR port adapter) to the usb port.

### Teensy
![](MounT_Teensy_1.jpg)  
![](MounT_Teensy_2.jpg)  
![](MounT_Teensy.svg)  

PCB: <https://oshpark.com/shared_projects/Gh6jiWGC><br>
BOM: <https://www.digikey.com/short/zfjrd3>

### Heltec HTIT-W8266
coming

### Heltec HTIT-WB32
coming

## Cambridge Z88
There is a version of the Feather board for the Cambridge Z88  
PCB: <https://oshpark.com/shared_projects/Ml5O1TZa>  
BOM: <https://www.digikey.com/short/zfw4vt>  
![](MounT_Feather_Z88_1.jpg)  
![](MounT_Feather_Z88_2.jpg)  
![](MounT_Feather_Z88.svg)  

## TANDY WP-2
There is a version of the Feather board for the TANDY WP-2  
PCB: <https://oshpark.com/shared_projects/j4kSufvM>  
BOM: <https://www.digikey.com/short/z25pz5>  
![](MounT_Feather_WP-2_1.jpg)  
![](MounT_Feather_WP-2_2.jpg)  
![](MounT_Feather_WP-2.svg)  
