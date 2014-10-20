`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:35 10/07/2014 
// Design Name: 
// Module Name:    OR_n_bit 
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
module OR_n_bit(OR_out, R2, R3);

parameter	word_size = 32;		// the default size 

input		[word_size-1:0]	R2, R3;
output	[word_size-1:0]	OR_out;

or OR1[word_size-1:0]	(OR_out, R2, R3);

endmodule
