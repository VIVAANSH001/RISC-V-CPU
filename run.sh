#!/bin/bash
iverilog -o sim 08-counters/counter_up4.v 08-counters/counter_up4_tb.v  && vvp sim && gtkwave dff.vcd

