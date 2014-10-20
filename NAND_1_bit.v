`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:56 10/10/2014 
// Design Name: 
// Module Name:    NAND_1_bit 
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
module NAND_1_bit(NAND_out, R2, R3);

input 	R2, R3;
output	NAND_out;
wire		AND_out;

and	A1	(AND_out, R2, R3);
not	N1	(NAND_out, AND_out);

endmodule
