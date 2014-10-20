`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:47 10/10/2014 
// Design Name: 
// Module Name:    Top_Module 
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
module Top_Module(R0, R2, R3, ALUOp, clk);

parameter	word_size = 32;

input		[word_size-1:0] R2, R3;
input		[2:0] ALUOp;
input		clk;
output	[word_size-1:0] R0;	
wire		[word_size-1:0] R1;

MUX_8			#(word_size) MX1 (R1, R2, R3, ALUOp);	//ALU
REG_n_bit 	#(word_size) RG1 (R0, R1, clk);			//Register

endmodule
