`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:11 10/10/2014 
// Design Name: 
// Module Name:    REG_1_bit 
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
module REG_1_bit(Q, D, clk);

input 	D, clk;
output	Q;
wire 		out1, out2, out3a, out3b, out3, out4, Q_not;

NAND_1_bit	N1 (out1, out4, out2);
NAND_1_bit	N2 (out2, out1, clk);
and			A1 (out3a, out2, out4);
and			A2 (out3b, out3a, clk);
not			A3 (out3, out3b); 
NAND_1_bit	N4	(out4, out3, D);
NAND_1_bit	N5 (Q, out2, Q_not);
NAND_1_bit	N6 (Q_not, Q, out3);

endmodule
