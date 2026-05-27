#!/bin/bash
iverilog -o sim 09-registers/regfile.v 09-registers/regfile_tb.v  && vvp sim && gtkwave regfile.vcd

