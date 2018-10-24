# Ducky Builder

*Ducky Builder* is a build system for [USB rubber ducky](http://www.usbrubberducky.com/). It's purpose is to automatically build `inject.bin` and related files from many scripts and for many keyboards.

## Prerequisites

* Microsoft Windows - the build system is in fact single CMD file
* [Oracle Java Runtime](http://www.java.com) - because the Ducky Encoder requires it
* `encoder.jar` - the Ducky Encoder; included version is [my own fork](https://github.com/ridercz/USB-Rubber-Ducky) with support for *Czech (QWERTZ)* and *Czech (QWERTY)* keyboards.

## How it works

The builder is intended mainly for the Twin Duck firmware, which supports composite device of keyboard and mass storage device. To use the build system, run `build.cmd` file. It will build all payloads in `src` folder for all keyboard layouts specified in the `build.keyboards` file and place them in the `out` folder.

## Files and folders

### The `src` folder

This folder contains folders with payloads. The payload folder (see ie. `src\Demo_HotelWifi`) contains the `inject.txt` - the DuckyScript file, will be compiled into `inject.bin`. All other files and folders would be copied to the output folder.

### The `build.keyboards` file

This is a text file which contains names of supported keyboard layouts. Each payload will be compiled for each keyboard layout.

### The `out` folder

This folder is created when `build.cmd` is run. It contains folders for each combination of payload and keyboard layout. The contents is to be copied to the MicroSD card used in the Rubber Ducky.

Build process creates the `hideall.cmd` file. If you run this file, it will set all the files in its folder as *system* and *hidden* and then it will delete itself.

## Contributor Code of Conduct

This project adheres to No Code of Conduct. We are all adults. We accept anyone's contributions. Nothing else matters.

For more information please visit the [No Code of Conduct](https://github.com/domgetter/NCoC) homepage.