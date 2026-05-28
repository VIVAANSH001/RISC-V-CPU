#!/bin/bash
iverilog -o sim 11-alu/alu.v 11-alu/alu_tb.v  && vvp sim && gtkwave sequence_detector.vcd

