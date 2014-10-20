`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:25 10/07/2014 
// Design Name: 
// Module Name:    MUX_8 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MUX_8(R1, R2, R3, ALU_OP);

parameter	word_size = 32;	//the real size of this module

input		[word_size-1:0] R2, R3;
input 	[2:0]	ALU_OP;
output	[word_size-1:0] R1;
wire		[word_size-1:0] MOV_out, NOT_out, ADD_out, SUB_out, OR_out, AND_out, out1, out2, out3, out4, out5, out6;
wire		c_out_add, c_out_sub, SLT_out;

MOV_n_bit	#(word_size) MOV1 (MOV_out, R2);
NOT_n_bit	#(word_size) NOT1 (NOT_out, R2);
ADD_n_bit	#(word_size) ADD1 (c_out_add, ADD_out, R2, R3, 1'b0);
SUB_n_bit	#(word_size) SUB1 (c_out_sub, SUB_out, R2, R3);
OR_n_bit		#(word_size) OR1  (OR_out, R2, R3);
AND_n_bit	#(word_size) AND1 (AND_out, R2, R3);
SLT_n_bit	#(word_size) SLT1 (SLT_out, R2, R3);

MUX_2 MUX1[word_size-1:0]	(out1, MOV_out, NOT_out, ALU_OP[0]);
MUX_2 MUX2[word_size-1:0]	(out2, ADD_out, SUB_out, ALU_OP[0]);
MUX_2 MUX3[word_size-1:0]	(out3, OR_out, AND_out, ALU_OP[0]);
MUX_2 MUX4[word_size-1:0]	(out4, {31'b0,SLT_out}, 32'b0, ALU_OP[0]); 
MUX_2 MUX5[word_size-1:0]	(out5, out1, out2, ALU_OP[1]);
MUX_2 MUX6[word_size-1:0]	(out6, out3, out4, ALU_OP[1]);
MUX_2 MUX7[word_size-1:0]	(R1, out5, out6, ALU_OP[2]);

endmodule
