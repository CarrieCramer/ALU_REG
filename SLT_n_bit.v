`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:08 10/10/2014 
// Design Name: 
// Module Name:    SLT_n_bit 
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
module SLT_n_bit(SLT_out, R2, R3);

parameter	word_size = 32;

input		[word_size-1:0] R2, R3;
output	SLT_out;
wire		[word_size-1:0] SUB_out;
wire		c_out;

SUB_n_bit	#(word_size) S1 (c_out, {SLT_out, SUB_out[word_size-1:1]}, R2, R3);

endmodule
