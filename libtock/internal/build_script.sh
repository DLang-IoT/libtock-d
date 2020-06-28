#!/bin/bash

ldc2 -mtriple=thumb-none-linux-eabi -mcpu=cortex-m4 -c -betterC -relocation-model=pic -Os -I../ $1.d -of ../build/cortex-m4/$1.o

ldc2 -mtriple=thumb-none-linux-eabi -mcpu=cortex-m4 -c -betterC -relocation-model=pic -Os ../build/cortex-m4/*.o -lib -of ../build/cortex-m4/libtock.a