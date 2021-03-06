# libtock-d: D userland for TockOS

This repository contains libraries and examples of applications written in D for the userspace of the Tock Operating System.

## Prerequisites

1. Get familiar with TockOS by reading the [TockOS getting started guide](https://github.com/tock/tock/blob/master/doc/Getting_Started.md) and installing the tools you need for developing TockOS applications.

2. Clone this repository
    ```
    ~$ git clone https://github.com/DLang-IoT/libtock-d
    ~$ cd libtock-d
    ```

3. In order to develop and run TockOS applications, you need two specific cross compilers for embedded targets. The D userspace requires both `ldc2` for compiling D source files and an `arm-none-eabi` toolchain used for linking the object files with the libraries. Both support Cortex-M targets.

   For `ldc2` please visit the [Official LDC repository on Github](https://github.com/ldc-developers/ldc) and install the toolchain either from the command line or from source. Make sure the runtime library's source files can be found at the following path: `/usr/import/`.

   For the `arm-none-eabi`, install the toolchain from the command line.

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

4. Other toolchains you need are [elf2tab](https://crates.io/crates/elf2tab) and Rust's [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html). To correctly install the toolchains, please follow the [TockOS getting started guide](https://github.com/tock/tock/blob/master/doc/Getting_Started.md).

5. After installing all the required toolchains, the userspace library can be compiled by following the next steps:

    ```
    ~/libtock-d$ cd libtock
    ~/libtock-d/libtock$ make
    ```


## Compiling and Running Applications

The D userland provides a few examples with simple applications that can be easily compiled and run using TockOS in the `examples` directory.

Every example comes with a Makefile that compiles the source files and creates the `.tab` application that will further be merged with the kernel's application.
```
~$ cd examples/d_hello
~/examples/d_hello$ make 
```

The D userland works if it is linked with the runtime library of the C userspace. This library is architecture specific, and the supported targets so far are `cortex-m0`, `cortex-m3` and `cortex-m4`. Each pre-built library can be found in the corresponding directory, in `libtock-c/build`. The C userspace is a submodule of this repository and it is found at `libtock-c/libtock-c`. In order to get access to its source files and to re-build the C userspace library, follow the next steps:
```
~$ git submodule init 
~$ git submodule update
~$ cd libtock-c
~/libtock-c$ make
```

The standard runtime libraries of C and C++ for the Cortex-M targets can be also used by the D applications.

The D userspace applications are being compiled using the `betterC` option, so there are no available concepts like classes or Garbage Collection.

According to the board you are using, the final application can be flashed either using `tockloader` or `openocd`. 

- `tockloader` loads the `.tab` application generated by the Makefile in the `example` directory.

    - install an application:
        ```
        ~/libtock-d/examples$ tockloader install --board <board_name> --jlink <application_name>/build/<application_name>.tab
        ```
    - remove an application:
        ```
        ~/libtock-d/examples$ tockloader uninstall --board <board_name> --jlink <application_name>
        ```
    - remove all installed applicaions:
        ```
        ~/libtock-d/examples$ tockloader uninstall --board <board_name> --jlink
        ```
- `openocd` loads an application from the kernel directory. The Tock kernel provides for each supported board a Makefile that can be modified in order to link the correct userspace application to the kernel's executable and flashed on the board with this toolchain.

## Adding a new userspace library
New userspace libraries are easy to develop and compile. The `libtock` directory contains the source files of all userspace libraries and a Makefile that compiles them. After writing the source file, just re-compile everything like this:

```
~/libtock-d/libtock$ make
```

## License

Licensed under Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)