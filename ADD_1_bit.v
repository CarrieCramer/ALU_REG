`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:44 10/07/2014 
// Design Name: 
// Module Name:    ADD_1_bit 
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
module ADD_1_bit(c_out, sum, a, b, c_in);

output	c_out, sum;
input		a, b, c_in;
wire		w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;

not	not1	(w1, a);
not	not2	(w2, b);
not	not3	(w3, c_in);

and	and1	(w4, a, w2, w3);			//
and	and2	(w5, w1, b, w3);			//	for sum
and	and3	(w6, w1, w2, c_in);		//
and	and4	(w7, a, b, c_in);			//

and	and5	(w8, a, b);				//
and	and6	(w9, a, c_in);			// for c_out
and	and7	(w10, b, c_in);		//

or	or_sum	(sum, w4, w5, w6, w7);			// sum
or	or_cout	(c_out, w8, w9, w10);		// c_out

endmodule
