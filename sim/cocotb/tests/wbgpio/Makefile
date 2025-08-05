# Makefile

REPO = $(shell git rev-parse --show-toplevel)

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
WAVES = 1

VERILOG_SOURCES += $(REPO)/rtl/gpio/wbgpio.sv

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = wbgpio

# MODULE is the basename of the Python test file
MODULE = test_wbgpio

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim