# -------------------------------------------------------------------
# Copyright 2025 by Heqing Huang (feipenghhq@gamil.com)
# -------------------------------------------------------------------
#
# Author: Heqing Huang
# Date Created: 08/04/2025
#
# -------------------------------------------------------------------
# Environment
# -------------------------------------------------------------------

import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.clock import Clock

async def generate_reset(dut):
    """
    Generate rst_n pulses.
    """
    dut.rst_n.value = 0
    await Timer(20, units="ns")
    dut.rst_n.value = 1
    await RisingEdge(dut.clk)

async def init(dut, period=10):
    """
    Initialize the environment:
        - setup clock, and reset the design
    """
    # clock and reset
    cocotb.start_soon(Clock(dut.clk, period, units = 'ns').start()) # clock
    await generate_reset(dut)