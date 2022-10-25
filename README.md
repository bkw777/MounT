# MounT
Mount a microcontroller dev board onto a "Model T" computer by it's serial port.

This repo has a few different variations of adapter boards to attach some common small DIP form-factor microcontroller boards directly to "Model T" computers by the serial port.

Particularly, boards with integrated SD card readers, for use with [PDDuino](https://github.com/bkw777/PDDuino), but not limited to that.

You can power the microcontroller board from the computer using a [BCR-USB power adapter](https://github.com/bkw777/BCR_Breakout)

These adapter boards take the place of a serial cable, gender/null-modem adapters, RS-232/TTL level-shifter module, and breadboard, and let you stick the whole assembly directly onto the serial port of a TRS-80 Model 100 or any of it's clones.

There are at least a few other machines are not in the same family as above but have the same form of serial port that could also use this:  

And there are also a few other variations for other machines with other serial port configurations.  
Namely one for the Cambridge Z88 and one for a standard 9-pin male PC com port or usb-serial adapter.  
The Cambridge Z88 can use a TPDD drive, and so can use PDDuino, and so has a use for an adapter like this.  
Similarly the TANDY WP-2 can use a TPDD drive, and so has a use for this, and the WP-2 serial port is the same as a standard PC com port.

All of these adapters employ a staggered row footprint for the main pin headers, which acts like a friction fit socket to connect the microcontroller board to the MounT board without having to solder it permanently and without needing actual sockets.  
This way the microcontroller board is still removable like with a socket, yet low profile as if you had soldered it with no sockets.

You can still install real sockets if you want to, or solder the microcontroller board permanently if you want to.

One feature of normal socket headers that can be either good or bad, is they are 8.5mm tall. That makes the controller board stick out more than it needs to, but it also provides a handy space between the microcontroller board and the adapter board where you can stuff a lipo battery, or stuff excess usb cable from the BCR port power adapter.

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

## Host Computer Compatibility
### K85 - KC-85 clones, aka "Model T", like TRS-80 Model 100
The source files with "K85" in the name are for the TRS-80 Model 100 and all the other KC-85 clone aka "Model T" machines.  
 TRS-80/TANDY Model 100, 102, 200  
 NEC PC-8201, PC-8201a, PC-8300  
 Olivetti M10  
 Kyotronic KC-85  

Also at least a few other machines are not in that family but have the same serial port configuration and are also compatible with the "K85" versions.  
 NEC PC-8401 "Starlet", PC-8501  
 TANDY 600  

Generically, the serial port of a KC-85 clone is a standard 25-pin DTE port, except that it's a female DB25 instead of male. The "K85" verions of these adapters would be compatible with any machine with that serial port configuration.

### Z88 - Cambridge Z88
Files with "Z88" in the name are for the Cambridge Z88.

The Z88 has a non-standard serial port and so these these are not compatible with anything else but the Z88.

### WP2 - TANDY WP-2
Files with "WP2" in the name are for the TANDY WP-2.

The TANDY WP-2 serial port is also the same as any generic PC 9-pin com port and most usb-serial adapters which are designed to replace legacy motherboard com ports.  
The WP2 versions are also compatible with any other machine with a standard 9-pin DTE male com port.

## Microcontroller Board Compatibility
Files with "Feather" in the name accept any Adafruit Feather form-factor microcontroller board.

Files with "Teensy" in the name accept Teensy 3.5, 3.6, or 4.1 microcontroller boards.

## MounT Adapters
### Adafruit Feather to KC-85 clone / "Model T"
![](../../raw/main/MounT_K85_Feather.jpg)  
![](../../raw/main/MounT_K85_Feather.b.jpg)  
![](../../raw/main/MounT_K85_Feather.svg)  

[MounT_K85_Feather PCB from PCBWAY](https://www.pcbway.com/project/shareproject/Feather_MounT.html)  
[MounT_K85_Feather PCB from OSHPark](https://oshpark.com/shared_projects/URa7jGeS)  
[](MounT_K85_Feather.BOM.csv) ([DigiKey cart](https://www.digikey.com/short/b35fdb5b))

Adafruit Feather boards are the ideal for this.  
* The pin rows are assymetrical, and so the board as a whole has polarity protection. You physically can't plug it in backwards or upside-down or any way but the correct way.  
* The boards all have built-in lipo battery chargers, JST connectors for lipo cells, and an Enable pin that allows an add-on board like MounT to provide an on/off switch without needing to unplug the battery or hack a switch in series between the battery and the Feather board.  
* There are many different microcontroller boards that all conform to the same physical and electrical pinout standard, and can all be used with this.

Adafruit Feather Adalogger boards can be powered by a lipo battery instead of, or as well as, the BCR port adapter (or other usb power source).  
The Feather board includes both a JST connector for a lipo cell, and an on-board lipo cell manager so that it charges when you supply power to the usb port, and provides power when there is no power from the usb port.

Avoid connecting a battery and the BCR port adapter at the same time. The charging circuit on the Feather board will try to charge the battery at 100ma any time there is power available from the usb port. But that is too much current to draw from the BCR port. So, either connect a battery, OR the BCR port adapter, not both at the same time.  
If you are going to use a battery, you can charge it by just connecting any usb power source (except the BCR port adapter) to the usb port.

There are many Adafruit Feather boards, and they would all work with this. But for PDDuino you want either Adalogger 32u4 or Adalogger M0 because they have built-in sd card readers.  
M0 has a newer more powerful cpu and more ram, but is actually a bit less reliable due to some problem with the Adafruit board support library. There is a known problem with the SPI timing, which apparently was a deliberate choice by Adafruit to get more performance for audio applications at the expense of stability.  
32u4 is an older and less powerful cpu, and has less flash and less ram, but it actually works perfect for PDDuino and the Adalogger 32u4 really the ideal board for PDDuino.  
Other Feather boards could possibly be used for wifi/rf or general use, but they don't have sd card readers built-in, so they aren't as useful for PDDuino.

### Teensy 3.5/3.6/4.1 to KC-85 clone / "Model T"
![](../../raw/main/MounT_K85_Teensy.jpg)  
![](../../raw/main/MounT_K85_Teensy.b.jpg)  
![](../../raw/main/MounT_K85_Teensy.svg)  

[MounT_K85_Teensy PCB from PCBWAY](https://www.pcbway.com/project/shareproject/Teensy_MounT_32836e10.html)  
[MounT_K85_Teensy PCB from OSHPark](https://oshpark.com/shared_projects/XVh5R6QG)  
[](MounT_K85_Teensy.BOM.csv) ([DigiKey cart](https://www.digikey.com/short/fwzdd8v9))

The Teensy 3.5 specifically is particularly interesting for vintage computer projects as it's i/o pins are 5v tolerant. Though this isn't needed   
The Teensy 3.5/3.6/4.1 are far more powerful and have far more built-in hardware & features, but do have a few downsides compared to Feather.  
The pins are physically symmetrical, which means there is no polarity protection. It's always possible to plug the teensy in backwards.  
The Teensy does not have a built-in lipo charger and connector. It can run off the BCR port, but it would take more added hardware to run off a battery, and even more to have that battery be automatically charged from the usb port.  
The Teensy does not have any pins wired up to the card-detect pin in the sd card reader. This means the arduino code can not automatically detect when the card is ejected. This means PDDuino can't automatically reset and return to "waiting-for-card" state the way Feather can and does. The card slot does have a sense switch, so you could manually solder connections to it and uncomment a few lines in the code to use it.  

## Adafruit Feather to TANDY WP-2 and/or generic PC
![](../../raw/main/MounT_WP2_Feather.jpg)  
![](../../raw/main/MounT_WP2_Feather.b.jpg)  
![](../../raw/main/MounT_WP2_Feather.svg)  

<!-- [MounT_WP2_Feather PCB from OSHPark](https://oshpark.com/shared_projects/67NyaQRs)  -->
[](MounT_WP2_Feather.BOM.csv) ([DigiKey cart](https://www.digikey.com/short/tnb09np7))

## Adafruit Feather to Cambridge Z88
![](../../raw/main/MounT_Z88_Feather.jpg)  
![](../../raw/main/MounT_Z88_Feather.b.jpg)  
![](../../raw/main/MounT_Z88_Feather.svg)  

<!-- [MounT_Z88_Feather PCB from OSHPark](https://oshpark.com/shared_projects/JzfpyaOQ)  -->
[](MounT_Z88_Feather.BOM.csv) ([DigiKey cart](https://www.digikey.com/short/80rf2r75))
