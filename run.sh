#!/bin/bash
iverilog -o sim 08-counters/counter_updown.v 08-counters/counter_updown_tb.v  && vvp sim && gtkwave dff.vcd

