`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:01 10/10/2014 
// Design Name: 
// Module Name:    REG_n_bit 
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
module REG_n_bit(Q, D, clk);

parameter word_size = 32;

input 	[word_size-1:0] D;
input		clk;
output	[word_size-1:0] Q;

REG_1_bit	RG1[word_size-1:0] (Q, D, clk);

endmodule
