`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:35:48 10/07/2014 
// Design Name: 
// Module Name:    NOT_n_bit 
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
module NOT_n_bit(NOT_out, R2);

parameter	word_size = 32;		// the default size of this n bit adder

input		[word_size-1:0]	R2;
output	[word_size-1:0]	NOT_out;

not NOT1[word_size-1:0]	(NOT_out, R2);

endmodule
