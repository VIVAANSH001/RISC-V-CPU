#!/bin/bash
iverilog -o sim 09-registers/register_8bit.v 09-registers/register_8bit_tb.v  && vvp sim && gtkwave register_8bit.vcd

