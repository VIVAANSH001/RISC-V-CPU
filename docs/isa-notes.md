# Phase 2: Personal Notes for my RV32I learning journey.

## DAY 1:

## What is an ISA?
- An ISA (Instruction Set Architecture) is like a contract between the software and the hardware it tells what instructions exist and what they do , how many registers exist and how wide each of them are , how the memory is addressed and also how the data is represented. RISC-V for example is a open source ISA other examples are ARM and x86.

## What is RV32I?
- RV - RISC V
- 32 - 32 bit registers and address space
- I - base integer instruction set

## Why are you using RISC-V?
- Eventhough other ISA's exist RISC-V is the only open source one and is being heavily researched and expanded at the time by startups, people, companies, countries like India and China are heavily investing in it as it has no licensing fee required and ordinary learners like myself can use it to learn and develop.

## RISC vs CISC?
- They both are built on opposite philosophies RISC means the instructions are simple and standard allowing the hardware to be more simple in turn the compiler has a bit more work to do and for more complex tasks the instructions are to be compounded.
- In CISC the instructions tend to be complex as in multiple cycles and harder tasks making the compilers job easier in turn the hardware becomes a lot more complex as you need special circuitry to support such instructions.

## What are your 32 registers? (Using actual register/ABI)
- x0/zero : holds the value zero at all times cannot be written to and is helpful is many tasks inculding transferring values between registers.
- x1/ra : return address is held over here so we can jump back after a function call.
- x2/sp : tracks the top of the stack helping it grow and shrink.
- x3/gp : global pointer , points to the middle of the region of memory that hold global variables.
- x4/tp : thread pointer yet to fully understand what this does.
- t0-t6 (x5-x7 --> t0-t2 and x28-x31 --> t3-t6): these are temporaries they are registers that act as scratchpads as in functions can change and manipulate values within them to their liking.
- s0-s11 (x8-x9 --> s0-s1 and x18-x27 --> s2-s11): these are saved registers here the values can be chnaged within the function but before returing the intial value at function call must be restored within these registers.
- a0-a7 (x10-x17 --> a0-a7): these are argument registers they are used for passing function arguments and also the return value returns through a0.

## What do you know about the stack till now?
- The stack is a region of the memory that grows and shrinks while your program runs. Whenever you call a function it requires temporary space for it's local variables. That space is given by the stack and the when the function ends that space is then given back.