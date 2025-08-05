# -------------------------------------------------------------------
# Copyright 2025 by Heqing Huang (feipenghhq@gamil.com)
# -------------------------------------------------------------------
#
# Project: Wishbone IP
# Author: Heqing Huang
# Date Created: 08/04/2025
#
# -------------------------------------------------------------------
# Basic Test for hack_top
# -------------------------------------------------------------------

import cocotb
from cocotb.triggers import FallingEdge, RisingEdge, Timer, ReadWrite
from cocotb.clock import Clock

import sys
sys.path.append('../../tb')

from WbHostBFM import WbHostBFM
from Env import init

@cocotb.test()
async def test_gpio_read(dut):
    wb = WbHostBFM(dut, 3, 32, True)
    dut.cfg.value = 0 # config GPIO as read
    dut.gpio.value = 0
    await init(dut)
    dut.gpio.value = 0xbeefcafe | (0xabcd1234 << 32)
    await RisingEdge(dut.clk)
    await ReadWrite()
    data = await wb.single_read(0)
    assert data == 0xbeefcafe
    data = await wb.single_read(4)
    assert data == 0xabcd1234

@cocotb.test()
async def test_gpio_write(dut):
    wb = WbHostBFM(dut, 3, 32, True)
    dut.cfg.value = 3 # config GPIO as read
    await init(dut)
    await wb.single_write(0, 0x11112222, 0xF)
    await wb.single_write(4, 0x33334444, 0xF)
    assert dut.gpio.value == 0x3333444411112222
