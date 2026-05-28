#!/bin/bash
iverilog -o sim 10-fsm/sequence_detector.v 10-fsm/sequence_detector_tb.v  && vvp sim && gtkwave sequence_detector.vcd

