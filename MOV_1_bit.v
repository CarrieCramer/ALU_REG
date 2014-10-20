`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:11 10/07/2014 
// Design Name: 
// Module Name:    MOV_1_bit 
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
module MOV_1_bit(MOV_out, R2);

input R2;
output MOV_out;

and AND1 (MOV_out, R2, 1'b1);

endmodule
