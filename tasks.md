# Modules Built

## Basic Gates
- `and_gate.v` : 2-input AND gate
- `or_gate.v` : 2-input OR gate
- `not_gate.v` : single input NOT gate
- `xor_gate.v` : 2-input XOR gate
- `nand_gate.v` : 2-input NAND gate
- `nor_gate.v` : 2-input NOR gate
- `xnor_gate.v` : 2-input XNOR gate

## Multi-bit
- `and8.v` : 8-bit bitwise AND

## Multiplexers
- `mux2.v` : 2:1 mux using ternary operator
- `mux4.v` : 4:1 mux using three mux2 instances
- `mux8.v` : 8:1 mux using case statement

## Encoders and Decoders
- `decoder3to8.v` : 3-to-8 decoder, activates one of 8 output lines
- `priority_encoder.v` : 8-to-3 priority encoder with valid signal

## Adders
- `half_adder.v` : adds two single bits, outputs sum and carry
- `full_adder.v` : adds two bits plus carry in, built using two half adders
- `ripple_carry_adder.v` : 4-bit adder using four full adders chained together, carry ripples through each stage

## Comparators and Subtractors
- `comparator4.v` : 4-bit comparator, outputs eq, lt, gt using Verilog comparison operators
- `ripplecarry8.v` : 8-bit ripple carry adder with cin port for reusability
- `subtractor8.v` : 8-bit two's complement subtractor built using ripplecarry8 with ~b and cin=1

## Flip Flops
- `dff.v` : D flip flop with asynchronous reset, captures d on rising clock edge
- `dff_sync.v` : D flip flop with synchronous reset, reset only takes effect on clock edge
- `notes.md` : personal notes on difference between always @(*) and always @(posedge clk)