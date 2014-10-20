`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:34:28 10/07/2014 
// Design Name: 
// Module Name:    MOV_n_bit 
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
module MOV_n_bit(MOV_out, R2);

parameter	word_size = 32;		// the default size 

input		[word_size-1:0]	R2;
output	[word_size-1:0]	MOV_out;

MOV_1_bit MOV1[word_size-1:0] (MOV_out, R2); 

endmodule
