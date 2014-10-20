`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:03 10/07/2014 
// Design Name: 
// Module Name:    ADD_n_bit 
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
module ADD_n_bit(c_out, ADD_out, R2, R3, c_in);

parameter	word_size = 32;		// the default size of this n bit adder

input		[word_size-1:0]	R2, R3;
input								c_in;

output	[word_size-1:0]	ADD_out;
output							c_out;

wire		[word_size-1:0]	c_inner;

// the c_out of the ith 1-bit full aderr is the c_in of the (i+1)th full adder 
ADD_1_bit 	ADDER[word_size-1:0]	({c_out, c_inner[word_size-1:1]}, ADD_out, R2, R3, {c_inner[word_size-1:1], c_in});

endmodule
