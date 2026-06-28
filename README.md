# 4-bit ALU Design — Verilog HDL

## About This Project

So this is my second internship project. I had to design a 4-bit ALU 
(Arithmetic Logic Unit) using Verilog and verify it using a testbench.

Honestly when I first got this task I had to Google what an ALU even does 
in detail. I knew it was part of the processor but never thought I'd 
actually be building one. Turns out it's the part of the CPU that does 
all the math and logic operations — addition, subtraction, AND, OR etc. 
Designing it from scratch made me understand why we study all those logic 
gates in our first year.

## What I Learned

- How the ALU fits inside a processor and why it matters
- Using case statements in Verilog to handle multiple operations cleanly
- What carry flag and zero flag actually mean and why processors need them
- How left and right shift works at bit level
- Writing a testbench that actually covers all the cases properly

## Tools I Used

- Verilog HDL — for writing the design
- ModelSim — for simulating and checking waveforms
- Xilinx Vivado — for synthesis

## How It Works

The ALU takes two 4-bit numbers A and B, and a 3-bit opcode that tells 
it which operation to perform. It gives back a 4-bit result along with 
two flags — carry flag and zero flag.

I added the zero flag after reading about how real processors use flags 
for conditional instructions in assembly. It made sense to include it.

## Operations Supported
The ALU uses the 3-bit Opcode to route data to one of eight distinct operations, covering basic arithmetic, bitwise logic, and shifting.

| Opcode | Operation | Type | Description |
| :---: | :--- | :--- | :--- |
| `000` | **ADD** | Arithmetic | Adds A and B; triggers Carry flag on overflow |
| `001` | **SUB** | Arithmetic | Subtracts B from A |
| `010` | **AND** | Logical | Bitwise AND of A and B |
| `011` | **OR** | Logical | Bitwise OR of A and B |
| `100` | **XOR** | Logical | Bitwise XOR of A and B |
| `101` | **NOT** | Logical | Bitwise complement of A |
| `110` | **SHL** | Shift | Shifts A left by 1 bit |
| `111` | **SHR** | Shift | Shifts A right by 1 bit |

## Files in This Repository
| File Name | Description |
| :--- | :--- |
| [`alu_4bit.v`](./alu_4bit.v) | The main RTL design file containing the logic for all 8 operations. |
| [`alu_4bit_tb.v`](./alu_4bit_tb.v) | The exhaustive testbench file that simulates every operation with sample values. |

## Testbench Results
I wrote an exhaustive testbench to verify that every single operation works flawlessly. Here are the simulated results based on sample inputs:

| Operation | Input A | Input B | Result | Carry Flag | Zero Flag |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **ADD** | `0011` | `0101` | `1000` | `0` | `0` |
| **SUB** | `1000` | `0011` | `0101` | `0` | `0` |
| **AND** | `1100` | `1010` | `1000` | `0` | `0` |
| **OR** | `1100` | `1010` | `1110` | `0` | `0` |
| **XOR** | `1100` | `1010` | `0110` | `0` | `0` |
| **NOT** | `1010` | *N/A* | `0101` | `0` | `0` |
| **SHL** | `0011` | *N/A* | `0110` | `0` | `0` |
| **SHR** | `1100` | *N/A* | `0110` | `0` | `0` |

## How to Simulate

1. Download alu_4bit.v and alu_4bit_tb.v
2. Open ModelSim
3. Compile alu_4bit.v first, then alu_4bit_tb.v
4. Run the simulation
5. The terminal will print a result table automatically
6. You can also open the .vcd file to see the waveforms

## Challenges I Faced

The carry flag part was confusing at first. I kept getting wrong results 
until I realized I needed a 5-bit temporary register to capture the 
overflow bit properly. That was a small thing but took me a while to 
figure out.

The testbench also took more time than I expected. Making sure every 
single operation is tested with the right inputs and checking each output 
manually is actually a lot of work. But when the terminal finally printed 
all correct results it felt really good.

## What I Want to Add Later

- Extend it to 8-bit or 16-bit
- Add multiplication support
- Try connecting it to a register file to make a basic CPU
- Test it on an actual FPGA board

## About Me

2nd year ECE student, VLSI Technology — Gitam University  
Currently doing internship in VLSI domain
