# Makefile for building the C userspace library

# Libtock-c root path
LIBTOCK_SRC := ..

# Build directory name
BUILD := build
BUILD_DIR := $(LIBTOCK_SRC)/$(BUILD)

# Library name in the userland tree
TOCK_USERLAND_BASE_DIR ?= libtock-c

# C Userspace library directory name
LIBNAME := libtock
$(LIBNAME)_DIR := $(TOCK_USERLAND_BASE_DIR)/$(LIBNAME)

# Target architectures
TOCK_TARGETS ?= cortex-m0 cortex-m3 cortex-m4

# C and C++ standard libraries, architecture non-specific
LIBS_TO_BUILD := newlib libc++
GENERAL_CORTEX := cortex-m

# Build the C userspace library
include $($(LIBNAME)_DIR)/Makefile

define \n


endef

all:
	# Create the root directory for the userspace libraries
	mkdir -p $(BUILD_DIR)

	# Create the architecture non-specific directory for C and C++ standard libraries
	mkdir -p $(BUILD_DIR)/$(GENERAL_CORTEX)

	# Create architecture specific directories for the libraries
	$(foreach arch, $(TOCK_TARGETS), mkdir -p $(BUILD_DIR)/$(arch) ${\n})
	
	# Copy each architecture specific library from C userspace 
	$(foreach arch, $(TOCK_TARGETS), cp $($(LIBNAME)_DIR)/$(BUILD)/$(arch)/$(LIBNAME).a $(BUILD_DIR)/$(arch)/$(LIBNAME)-c.a ${\n})
	
	# Copy the C and C++ standard libraries for all architectures
	$(foreach build_lib, $(LIBS_TO_BUILD), cp $(TOCK_USERLAND_BASE_DIR)/$(build_lib)/$(GENERAL_CORTEX)/*.a $(BUILD_DIR)/$(GENERAL_CORTEX)/ ${\n})


clean::
	rm -rf $(BUILD_DIR)
