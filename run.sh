#!/bin/bash
iverilog -o sim reg4.v dff.v reg4_tb.v  && vvp sim && gtkwave dff.vcd

