# General Userland Makefile for building examples 

all:

# C and D userland libraries locations
C_LIBTOCK			= $(USERLAND_ROOT)/libtock-c
D_LIBTOCK			= $(USERLAND_ROOT)/libtock

# D standard runtime
# D_RUNTIME_SRC			= /home/tock/runtime_thumb/ldc-build-runtime.tmp/ldc-src/runtime/druntime/src/

# Build directory name
BUILD_DIR			= build

# C and D userland libraries build path
D_LIBRARY			= $(D_LIBTOCK)/$(BUILD_DIR)
C_LIBRARY			= $(C_LIBTOCK)/$(BUILD_DIR)

# C and D libraries names
C_LIBRARY_NAME		= libtock-c
D_LIBRARY_NAME		= libtock

# C and C++ standard libraries names
C_CPP_LIBR 			= libc libgcc libm
#librdimon librdpmon

# D standard library
D_LIBR				= runtime

# Compiler name and compilation flags
CC                 	= ldc2
CFLAGS              	= -betterC -mtriple=thumb-none-linux-eabi -c -relocation-model=pic -I$(D_LIBTOCK)/ -I/usr/import/

# Linker name, location and flags
LD					= arm-none-eabi-gcc
LINKER				= $(USERLAND_ROOT)/userland_generic.ld
LDFLAGS				= -std=gnu11 -Wbad-function-cast -Wjump-misses-init  -Wmissing-prototypes -Wnested-externs  -Wold-style-definition  -frecord-gcc-switches -gdwarf-2 -Os -fdata-sections -ffunction-sections -fstack-usage -Wstack-usage=2048 -Wall -Wextra -Wl,--warn-common -Wl,--gc-sections -Wl,--emit-relocs -fPIC -include -Wdate-time  -Wfloat-equal  -Wformat-nonliteral -Wformat-security  -Wformat-y2k  -Winit-self  -Wlogical-op  -Wmissing-declarations -Wmissing-field-initializers  -Wmissing-format-attribute  -Wmissing-noreturn  -Wmultichar -Wpointer-arith  -Wredundant-decls  -Wshadow  -Wtrampolines  -Wunused-macros -Wunused-parameter  -Wwrite-strings -mthumb -mfloat-abi=soft -msingle-pic-base -mpic-register=r9 -mno-pic-data-is-text-relative --entry=_start -Xlinker --defsym=STACK_SIZE=2048 -Xlinker --defsym=APP_HEAP_SIZE=1024 -Xlinker --defsym=KERNEL_HEAP_SIZE=1024 -T $(LINKER) -nostdlib

# elf2tab flags and application name
ELF 				= elf2tab
APP 				= app
ELFFLAGS 			= -n app --stack 2048 --app-heap 2048 --kernel-heap 1024 -v

# Target architectures
TOCK_ARCHS			= cortex-m4

# Standard libraries full paths
STD_LIBR := $(foreach lang, $(C_CPP_LIBR), $(C_LIBRARY)/cortex-m/$(lang).a)

# Object files generated after compilation
OBJS := $(foreach platform, $(TOCK_ARCHS), $(patsubst %.d,$(BUILD_DIR)/$(platform)/%.o,$(D_SRCS)))

# Rule for building the userland application
.PHONY: all
all: $(BUILD_DIR)/$(APP).tab

# Rules to create object files for a given architecure.
#
# - argument $(1) represents the architecture (e.g. cortex-m0)
define BUILD_ARCH

# Create the architecture specific directory 
$$(BUILD_DIR)/$(1):
	@mkdir -p $(BUILD_DIR)/$(1)

# Compile the source files and create the corresponding object files
$$(BUILD_DIR)/$(1)/%.o: $(D_SRCS) | $$(BUILD_DIR)/$(1)
	@$(CC) -mcpu=$(1) $$(CFLAGS) $$(D_SRCS) -of $$@

LIBS_$(1) = $(D_LIBRARY)/$(1)/$(D_LIBRARY_NAME).a
LIBS_$(1) += $(C_LIBRARY)/$(1)/$(C_LIBRARY_NAME).a
endef

# Rule to create the architecture specific .elf application based 
# on the generated object files
#
# - argument $(1) represents the architecture (e.g. cortex-m0)
define ELF_APP

$$(BUILD_DIR)/$(1)/$(1).elf: $(OBJS)
	@$(LD) -mcpu=$(1) $(LDFLAGS) -Wl,--start-group $(OBJS) $$(LIBS_$(1)) $(STD_LIBR) -Wl,--end-group -Wl,-Map=$(BUILD_DIR)/$(1)/$(1).Map -o $$@
endef

$(foreach platform, $(TOCK_ARCHS), $(eval $(call BUILD_ARCH,$(platform))))
$(foreach platform, $(TOCK_ARCHS), $(eval $(call ELF_APP,$(platform))))


# Tab file generation
$(BUILD_DIR)/$(APP).tab: $(foreach platform, $(TOCK_ARCHS), $(BUILD_DIR)/$(platform)/$(platform).elf)
	@$(ELF) $(ELFFLAGS) -o $@ $^ 

clean :
	rm -rf $(BUILD_DIR)
