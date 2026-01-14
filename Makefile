SIM ?= icarus
TOPLEVEL_LANG = verilog
WAVES ?= 1

PROJECT_ROOT := $(shell pwd)
SRC_DIR := $(PROJECT_ROOT)/src
TB_DIR := $(PROJECT_ROOT)/testbench
HELPERS_DIR := $(PROJECT_ROOT)/helpers

VERILOG_SOURCES := \
    $(SRC_DIR)/alu.v \
    $(SRC_DIR)/decoder.v \
    $(SRC_DIR)/fetcher.v \
    $(SRC_DIR)/scheduler.v \
    $(SRC_DIR)/compute_core.v

ifneq (,$(wildcard $(TB_DIR)/compute_core_tb.v))
    VERILOG_SOURCES += $(TB_DIR)/compute_core_tb.v
    TOPLEVEL := compute_core_tb
else
    TOPLEVEL := compute_core
endif

MODULE ?= testbench.test_execution

COMPILE_ARGS += -g2012
COMPILE_ARGS += -I$(SRC_DIR)


ifeq ($(SIM),icarus)
    COMPILE_ARGS += -DICARUS
endif

ifneq (,$(wildcard *.mem))
    PLUSARGS += +MEMFILE=$(wildcard *.mem)
endif

export PYTHONPATH := $(PROJECT_ROOT):$(HELPERS_DIR):$(PYTHONPATH)

include $(shell cocotb-config --makefiles)/Makefile.sim
