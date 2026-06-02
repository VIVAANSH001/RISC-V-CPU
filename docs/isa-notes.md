# Phase 2: Personal Notes for my RV32I learning journey.

## DAY 15: Introduction to ISA and Registers

### What is an ISA?
- An ISA (Instruction Set Architecture) is like a contract between the software and the hardware it tells what instructions exist and what they do , how many registers exist and how wide each of them are , how the memory is addressed and also how the data is represented. RISC-V for example is a open source ISA other examples are ARM and x86.

### What is RV32I?
- RV - RISC V
- 32 - 32 bit registers and address space
- I - base integer instruction set

### Why are you using RISC-V?
- Eventhough other ISA's exist RISC-V is the only open source one and is being heavily researched and expanded at the time by startups, people, companies, countries like India and China are heavily investing in it as it has no licensing fee required and ordinary learners like myself can use it to learn and develop.

### RISC vs CISC?
- They both are built on opposite philosophies RISC means the instructions are simple and standard allowing the hardware to be more simple in turn the compiler has a bit more work to do and for more complex tasks the instructions are to be compounded.
- In CISC the instructions tend to be complex as in multiple cycles and harder tasks making the compilers job easier in turn the hardware becomes a lot more complex as you need special circuitry to support such instructions.

### What are your 32 registers? (Using actual register/ABI)
- x0/zero : holds the value zero at all times cannot be written to and is helpful is many tasks inculding transferring values between registers.
- x1/ra : return address is held over here so we can jump back after a function call.
- x2/sp : tracks the top of the stack helping it grow and shrink.
- x3/gp : global pointer , points to the middle of the region of memory that hold global variables.
- x4/tp : thread pointer yet to fully understand what this does.
- t0-t6 (x5-x7 --> t0-t2 and x28-x31 --> t3-t6): these are temporaries they are registers that act as scratchpads as in functions can change and manipulate values within them to their liking.
- s0-s11 (x8-x9 --> s0-s1 and x18-x27 --> s2-s11): these are saved registers here the values can be chnaged within the function but before returing the intial value at function call must be restored within these registers.
- a0-a7 (x10-x17 --> a0-a7): these are argument registers they are used for passing function arguments and also the return value returns through a0.

### What do you know about the stack till now?
- The stack is a region of the memory that grows and shrinks while your program runs. Whenever you call a function it requires temporary space for it's local variables. That space is given by the stack and the when the function ends that space is then given back.

## DAY 16: Instruction Formats

### What are the 6 Formats and why are they needed?
- The six formats are R , I , S , B , U , J. They are needed because there are many types of instructions in the RISC-V ISA and all of them have different needs and thus to make sure that every instruction is 32 bits long all their needs are attended to and the hardware is as simple as possible we have these 6 types of instruction formats.

### R-type instructions (Register to Register)
- These are register to register instructions. So here we need two source registers to do something and we return the result to a destination register.
- Here is an image to show how the bits are allocated:
- ![R-type](images/rtype.png.png)
- opcode tells which family of instruction it is like r-type then funct3 is used to narrow it down to groups within the family and funct7 here does the final narrowing down usually do not need it but in cases like ADD and SUB the SUB has 30th bit as 1 rather than 0 like in ADD thus funct7 plays a role.

### I-type instructions (Immediate operations)
- Rather than two source registers ,this has one register and a constant baked into it directly. The constant is called an immediate.
- Here is an image to show how the bits are allocated:
- ![I-type](images/itype.png.png)
- The 12 bit immediate is extended to 32 bits using sign extension.
- This does not require funct7 as the opcode and funct3 are enough for distinguishing here.

### S-type instructions (Store instructions)
- It is used for storing data to memory. It basically takes a value sitting in a register and writes it to a memory address (base register + offset).
- Here is an image to show how the bits are allocated:
- ![S-type](images/stype.png.png)
- The immediate is split as RISC-V is designed in such a way that rs1 and rs2 bit positions should remain the same in all formats this allows the CPU to decode and perform register reading at the same time making it a lot more efficient.

### B-type instructions (Branch instructions)
- These are used for conditional branches --> if some part of the code is correct jump to a different part of the program.
- Here is an image to show how the bits are allocated:
- ![B-type](images/btype.png.png)
- Unlike S the splitting bits are reordered.
- So upon reassembly the offset would look like:
- ![B-type 2](images/btype,png.png)
- Cause of how RISC-V works the target address will always be at a even postion thus we always have a zero at the end giving us a 13 bit offset and more range. Thus to keep S and B as similar as possible and to try and keep the hardware as reused they had to reorder the bits.

### U-type instructions (Upper Immediate)
- The simplest instruction format basically takes a 20 bit immediate and a destination register and just copies the immediate to the top 20 bits of the rd and the rest are zeroes mostly used to copy immediates to registers this instruction gives 20 bits and the rest are from I type.
- Here is an image to show how the bits are allocated:
- ![U-type](images/utype.png.png)
- Only two instructions use this format and those being LUI and AUIPC.

### J-type instructions (Jump instruction)
- Only one instruction uses this JAL (jump and link). All it does it jumps to the new address (PC + offset) and then saves the return address into rd (PC +4).
- Here is an image to show how the bits are allocated:
- ![J-type](images/jtype.png.png)
- Has a 21 bit offset reassembled allowing the jump range to be +- 1 MB.

### Key things that connect all the types
- The opcode is always at [6:0], the rs1 is always at [19:15] and the rs2 is always at [24:20].
