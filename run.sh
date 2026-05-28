#!/bin/bash
iverilog -o sim 10-fsm/traffic_light.v 10-fsm/traffic_light_tb.v  && vvp sim && gtkwave traffic_light.vcd

