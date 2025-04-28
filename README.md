# TWRP Device Tree for Nokia FRT

This repository contains the device tree for building TWRP (Team Win Recovery Project) for the Nokia FRT device. It is intended to be used with the Android Open Source Project (AOSP) and TWRP build system.

## Table of Contents
- [About](#about)
- [Features](#features)
- [Requirements](#requirements)
- [How to Build](#how-to-build)
- [Contributing](#contributing)
- [License](#license)

## About
TWRP is a custom recovery for Android devices that allows users to install custom firmware, create backups, recover data, and perform many other system-level operations. This project provides the necessary configurations and files for building TWRP for the Nokia FRT device.

## Features
- Full support for Nokia FRT
- Custom recovery features like backup and restore
- Flashing custom ROMs and ZIP files
- Wiping partitions
- Terminal access
- ADB and Fastboot support

## Requirements
To use or build this project, you will need:
- A Linux-based operating system (Ubuntu/Debian recommended)
- A working AOSP build environment
- Basic knowledge of Android and TWRP build systems
- Nokia FRT device

## How to Build
Please leave a Star Before you clone the repository :wink:

Follow the steps below to build TWRP for Nokia FRT:

1. **Set up your build environment**:
   Ensure you have a properly configured AOSP build environment, including required dependencies like `repo`, `git`, and `Java`.
2. **Download the source code**:
   Clone the TWRP source code and sync it with the AOSP build system:
   
   ```bash
   repo init -u https://github.com/TeamWin/android_bootable_recovery.git -b twrp-12.1
   repo sync
   ```
   3.**Clone this repository**: 
  Clone the Nokia FRT device tree into the appropriate location:

   ```bash
   git clone https://github.com/Danidukiyu/twrp_device_nokia_frt.git device/nokia/frt
   ```
   4.**Build TWRP**:
  Run the following commands to start the build process:

   ```bash
   source build/envsetup.sh
   lunch twrp_frt-eng
   make recoveryimage
    ```
   5.**Flash TWRP**: 
  Once the build is complete, flash the generated recovery image onto your Nokia FRT device using Fastboot:

    ```bash
   fastboot flash recovery out/target/product/frt/recovery.img
    ```

    ## Contributing
   Contributions are welcome! If you'd like to improve this project, feel free to open an issue or submit a pull request. Please ensure your changes adhere to the project's coding standards and guidelines.

   ### License
   This project is licensed under the [GPLv3 License.](https://www.gnu.org/licenses/gpl-3.0.html)

   ### Disclaimer
    Your warranty is now void. I am not responsible for bricked devices, dead SD cards, thermonuclear war, or you getting fired because the alarm app failed. Please do some research if you have any concerns about features included in this software before flashing it! YOU are choosing to make these modifications,and if you point the finger at me for messing up your device, I will laugh at you.
      ```Code
      You can modify the content to better reflect the specifics of your project! Let me know if you need further refinements.
      ```
       
