ALU_REG

This Verilog project implements a 32-bit ALU and output register. The code is completely structural (gate-level). AND, OR, and NOT gates are used as primitives. The design is also hierarchical and parameterized to any word size. To change the word size from 32 bits to another value, edit the "word_size" parameter value in Top_Module.v. The code was compiled and debugged using Xilinx ISE 14.2. The ISE simulator, ISim, was used to test the program. A sample testbench (Top_Module_Test.v) is included. 

Design Hierarchy:
The highest module in the hierarchy (Top_Module) instantiates the ALU module (MUX_8) and the register module (REG_n_bit). The register instantiates 1-bit registers (REG_1_bit), which instantiate NAND (NAND_1_bit), AND, and NOT gates. The ALU instantiates each of the seven n-bit operation modules (MOV_n_bit, NOT_n_bit, ADD_n_bit, SUB_n_bit, OR_n_bit, AND_n_bit, and SLT_n_bit), as well as 2-by-1 MUXs (MUX_2).
The MOV module instantiates 1-bit MOV modules (MOV_1_bit). The n-bit adder instantiates 1-bit full adders (ADD_1_bit). The n-bit subtractor instantiates an n-bit NOT module and an n-bit adder. The n-bit SLT module instantiates an n-bit subtractor.

Module Descriptions

Top_Module:
This module instantiates the ALU and register. It has two 32-bit inputs, R2 and R3. It also has a 3-bit opcode input and a 1-bit clock input. R0 is the 32-bit output. This module instantiates a MUX_8 module and a REG_n_bit module, and it overrides their parameters. R2, R3, and the opcode are the inputs of the MUX_8 module. The output of the MUX_8 module and the clock are the inputs of the REG_n_bit module. The output of the REG_n_bit module is the output of Top_Module.


Opcode	Function
000	MOV	R0 = R2
001	NOT	R0 = ~R2
010	ADD	R0 = R2 + R3
011	SUB	R0 = R2 - R3
100	OR	R0 = R2 | R3
101	AND	R0 = R2 & R3
110	SLT	R0 = 1 if R2 < R3, else 0

NAND_1_bit:
This module is a 1-bit NAND gate. It has two 1-bit inputs, R2 and R3. The 1-bit output equals R2 NAND R3. To perform the operation, a 1-bit AND module is instantiated with R2 and R3 as inputs. A 1-bit NOT module is instantiated with the output of the AND gate as the input. The output of the NOT module is the output of NAND_1_bit.

REG_1_bit:
This module is a 1-bit positive edge-triggered register. It has two 1-bit inputs, the data input and the clock. The 1-bit output is equal to the data input on the positive edge of the clock. To implement the two-input NAND gates, five NAND_1_bit modules are instantiated. To implement one 3-input NAND gate, two 1-bit AND gates are instantiated, and the result is inverted by a 1-bit NOT gate.

REG_n_bit:
This module is an n-bit positive edge-triggered register. It has an n-bit data input and a 1-bit clock input. The n-bit output equals the data input on the positive edge of the clock. An array of n REG_1_bit modules is instantiated.

MUX_2:
This module is a 2-by-1 MUX. It has two 1-bit inputs, a and b, as well as a 1-bit select input. It performs the following operation: output = (b AND select) OR (a AND (NOT select)). So, if select equals 0, the output equals a. If select equals 1, the output equals b.

MUX_8:
This parameterized module acts as the ALU. Its inputs are the n-bit operands R2 and R3, as well as the 3-bit opcode. Its n-bit output R1 is the result of the operation selected by the opcode. Each of the seven n-bit operation modules is instantiated with R2 and/or R3 as inputs. The parameters of these modules are overridden. The results of these operations are the inputs to the 8-by-1 MUX, which is formed by 7 arrays of n MUX_2 modules. The select of the first four MUX_2 modules is the least significant bit of the opcode. The select of the fifth and sixth MUX_2 modules is the second-most significant bit of the opcode. The select of the seventh MUX_2 module is the most significant bit of the opcode. So, by inputting the results of the operations in the order 000 --> 010, the correct result is selected by the MUX. This value is the output of MUX_8.

MOV_1_bit:
This module performs a 1-bit MOV operation. The 1-bit output is equal to the 1-bit input, R2. To assign the value of R2 to the output, a 1-bit AND module is instantiated to perform the operation R2 && 1. This operation outputs the value of R2.

MOV_n_bit:
This parameterized module performs n-bit MOV operations. The n-bit output is equal to the n-bit input, R2. To perform the bitwise MOV operation, an array of n MOV_1_bit modules is instantiated.

NOT_n_bit:
This parameterized module performs n-bit NOT operations. It has an n-bit input, R2, and and n-bit output, which equals ~R2. To perform the bitwise NOT operation, an array of n 1-bit NOT modules is instantiated.

ADD_1_bit:
This module is a 1-bit full adder. It has three 1-bit inputs, the operands a & b, as well as the carry-in. The 1-bit outputs are the sum and carry-out. 

ADD_n_bit:
This parameterized module performs n-bit additions. It has a 1-bit carry-in and two n-bit inputs, R2 and R3. The sum of R2 and R3 is the n-bit output. It also has a 1-bit carry-out. To perform the addition, an array of n ADD_1_bit modules is instantiated. The carry-out of each adder is set as the carry-in of the next.

SUB_n_bit:
This is a parameterized n-bit subtractor. It has two n-bit inputs, R2 and R3. It outputs a 1-bit carry-out and the n-bit difference R2 – R3. The subtraction is performed by adding R2 to the 2’s complement of R3. A NOT_n_bit module is instantiated to invert R3, forming the 1’s complement. An ADD_n_bit module is instantiated with R2, the 1’s complement of R3, and a carry-in of 1 as inputs. Utilizing the carry-in of 1 is equivalent to adding 1 to the 1’s complement of R3 (in order to form the 2’s complement).

OR_n_bit:
This parameterized module performs n-bit OR operations. It has two n-bit inputs, R2 and R3. The n-bit output equals R2 | R3. To perform the bitwise OR operation, an array of n 1-bit OR modules is instantiated.

AND_n_bit:
This parameterized module performs n-bit AND operations. It has two n-bit inputs, R2 and R3. The n-bit output equals R2 & R3. To perform the bitwise AND operation, an array of n 1-bit AND modules is instantiated.

SLT_n_bit:
This parameterized module performs n-bit, signed SLT (set-less-than) operations. It has two n-bit inputs, R2 and R3. The 1-bit output equals 1 if R2 < R3, and 0 otherwise. To compare the two inputs, R3 is subtracted from R2 (by instantiating a SUB_n_bit module and overriding its parameter). If the result of the subtraction is negative, it means that R2 < R3. We can determine the sign of the result by checking the most significant bit. This bit will be 1 if it is negative (meaning that R2 < R3) and 0 if it is 0 or positive (meaning that R2 >= R3). Therefore, the most significant bit of the subtraction result is set as the output of the SLT_n_bit module.

This program was designed as a solution to an assignment for the Boston University course ENG EC413 (Fall 2014, Professor Herbordt). 