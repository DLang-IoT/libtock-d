# Runtime Library Makefile

# Compiler name and flags
CC                 	= ldc2 # compiler name
CFLAGS              = -mtriple=thumb-none-linux-eabi -c -betterC -relocation-model=pic -Os --gcc=arm-none-eabi-gcc -Xcc=-msingle-pic-base -Xcc=-mpic-register=r9 -Xcc=-mno-pic-data-is-text-relative
LIBFLAGS			= -lib

# Final library name
LIB_NAME			= libtock

# Build directory name
BUILD_DIR			= build

## Target architectures
TOCK_ARCHS			= cortex-m0 cortex-m3 cortex-m4

# Source files to be compiled into the userland library
LIB_SRCS  := $(wildcard internal/*.d) $(wildcard *.d)

# Rule for building the target architecture specific userland library
.PHONY: all
all: $(foreach platform, $(TOCK_ARCHS), $(BUILD_DIR)/$(platform)/$(LIB_NAME).a)

# Rules to build the target specific userland library
#
# - argument $(1) represents the architecture (e.g. cortex-m0)
define BUILD_LIBRARY

# Create the architecture specific build directory
$$(BUILD_DIR)/$(1):
	@mkdir -p $(BUILD_DIR)/$(1)

# Create architecture specific object files from the source files
$$(BUILD_DIR)/$(1)/%.o: $(LIB_SRCS) | $$(BUILD_DIR)/$(1)
	@$(CC) -mcpu=$(1) $$(CFLAGS) $$(LIB_SRCS) -of $$@

LIB_OBJS_$(1) = $$(patsubst %.d,$$(BUILD_DIR)/$(1)/%.o, $$(filter %.d, $$(notdir $(LIB_SRCS))))

# Build the architecture specific userland library from the object files
$$(BUILD_DIR)/$(1)/$(LIB_NAME).a: $$(LIB_OBJS_$(1)) | $$(BUILD_DIR)/$(1)
	@$(CC) -mcpu=$(1) $$(CFLAGS) $$(LIBFLAGS) $$(LIB_OBJS_$(1)) -of $$@
endef

$(foreach platform, $(TOCK_ARCHS), $(eval $(call BUILD_LIBRARY,$(platform))))

clean:
	rm -rf $(BUILD_DIR)