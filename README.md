# libtock-d: D userland for TockOS

This repository contains libraries and examples of applications written in D for the userspace of the Tock Operating System.

## Prerequisites

1. Get familiar with TockOS by reading the [TockOS getting started guide](https://github.com/tock/tock/blob/master/doc/Getting_Started.md) and installing some tools you need for developing TockOS applications.

2. Clone this repository
    ```
    ~$ git clone https://github.com/DLang-IoT/libtock-d
    ~$ cd libtock-d
    ```

3. In order to develop and run TockOS applications, you need different cross compilers for embedded targets. The D userspace requires both `ldc2` for compiling D source files and an `arm-none-eabi` toolchain used for linking the object files with the libraries. Both support Cortex-M targets.

   For `ldc2` please visit the [Official LDC repository on Github](https://github.com/ldc-developers/ldc) and install the toolchain either from the command line or from source. Make sure the runtime library's source files can be found at the following path: `/usr/import/`.

   For the `arm-none-eabi`, install from the command line the toolchain.

   **MacOS**:
   ```
   ~$ brew tap ARMmbed/homebrew-formulae && brew update && brew install arm-none-eabi-gcc
   ```

   **Ubuntu (18.04LTS or later)**:
   ```
   ~$ sudo apt install gcc-arm-none-eabi
   ```

   **Arch**:
   ```
   ~$ sudo pacman -Syu arm-none-eabi-gcc
   ```

    Unfortunately, the RISC-V targets are not yet supported by the D languange.

4. Another toolchains you need are [elf2tab](https://crates.io/crates/elf2tab) and Rust's [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html). By following the [TockOS getting started guide](https://github.com/tock/tock/blob/master/doc/Getting_Started.md), every toolchain should be correctly installed.

5. After installing all the required toolchains, the userspace library can be compiled by following the next steps:

    ```
    ~/libtock-d$ cd libtock
    ~/libtock-d/libtock$ make
    ```

## Compiling and Running Applications

The D userland provides a few examples with simple applications that can be easily compiled and run using TockOS in the `examples` directory.

Every example comes with a Makefile that compiles the source files and creates the `.tab` application that will further will be merged with the kernel's application.
```
~$ cd examples/d_hello
~/examples/d_hello$ make 
```

The D userland works if it's linked with the C userspace's runtime library. This library is architecture specific, and the supported targets so far are `cortex-m0`, `cortex-m3` and `cortex-m4`. Each library can be found in the corresponding directory, in `libtock-c/build`. The standard runtime libraries of C and C++ for the Cortex-M targers can be also used by the D applications.

The D userspace applications are being compiled using the `betterC` option, so there are no available concepts like classes or Garbage Collection.

Since the targets supported by the D userspace are not supported by the default application loader, `tockloader`, you need to load these applications using another toolchain, `openocd`. The Tock kernel provides for each supported board a Makefile that can be modified in order to link the correct userspace application to the kernel's executable.

## Adding a new userspace library
New userspace libraries are easy to develop and compile. The `libtock` directory contains the source files of all userspace libraries and a Makefile that compiles them. After writing the source file, just re-compile everything like this:

```
~/libtock-d/libtock$ make
```

## License

Licensed under Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)