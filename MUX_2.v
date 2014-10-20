`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:02 10/07/2014 
// Design Name: 
// Module Name:    MUX_2 
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
module MUX_2(out, a, b, sel);

input a, b, sel;
output out;
wire not_sel, sel_and_a, not_sel_and_b;

not 	not1(not_sel, sel);
and	and1(sel_and_b, sel, b);
and	and2(not_sel_and_a, not_sel, a);
or		or1(out, sel_and_b, not_sel_and_a);

endmodule
