`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:23 10/07/2014 
// Design Name: 
// Module Name:    SUB_n_bit 
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
module SUB_n_bit(c_out, SUB_out, R2, R3);

parameter	word_size = 32;		// the default size of this n bit subtractor

input		[word_size-1:0]	R2, R3;

output	[word_size-1:0]	SUB_out;
output							c_out;

wire		[word_size-1:0]	c_inner, not_R3;

NOT_n_bit	#(word_size) NOTN (not_R3, R3);

// the 2's complement of R3 is added to R2 
// the carry-in is hardwired to 1 in order to add 1 to not_R3, the 1's complement of R3 
// the c_out of the ith 1-bit full adder is the c_in of the (i+1)th full adder
ADD_n_bit 	#(word_size) ADDER	(c_out, SUB_out, R2, not_R3, 1'b1);

endmodule

