`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:13:02 10/12/2014
// Design Name:   Top_Module
// Module Name:   /ad/eng/users/c/a/carrie15/EC413/L5/Top_Module_Test.v
// Project Name:  L5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top_Module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_Module_Test;
	
	// Inputs
	reg [31:0] R2;
	reg [31:0] R3;
	reg [2:0] ALUOp;
	reg clk;

	// Outputs
	wire [31:0] R0;

	// Instantiate the Unit Under Test (UUT)
	Top_Module uut (
		.R0(R0), 
		.R2(R2), 
		.R3(R3), 
		.ALUOp(ALUOp), 
		.clk(clk)
	);

	parameter	word_size = 32;		// word_size default value = 32		

	wire [word_size-1:0] ALU_ideal_out;
	wire [word_size-1:0] error_bits;
	wire			error_flag;

	// ---- ideal ALU ------
	function [word_size:0]		ALU_ideal;  // include c_out;
	input		[word_size-1:0] 	R2, R3;
	input		[2:0]			ALUOp;
			
	begin
	case (ALUOp[2:0])
	3'h0: ALU_ideal = R2;
	3'h1: ALU_ideal = ~R2;
	3'h2: ALU_ideal = (R2 + R3);
	3'h3: ALU_ideal = (R2 - R3);
	3'h4: ALU_ideal = (R2 | R3);
	3'h5: ALU_ideal = (R2 & R3);
	3'h6: ALU_ideal = (($signed(R2) < $signed(R3))? 1:0);	
	endcase
	end
	
	endfunction
// ---- ideal ALU end------
		
	assign ALU_ideal_out = ALU_ideal(R2, R3, ALUOp);
	assign error_bits = ALU_ideal_out^R0;	//comparison
	assign error_flag = |error_bits;

	initial begin
		// Initialize Inputs
		R2 = 32'b0;
		R3 = 32'b0;
		ALUOp = 3'b0;
		clk = 0;

		#100;
        
		// MOV test
		R2 = 32'b001010001010011111;
		R3 = 32'b110001;
		ALUOp = 3'b000;
		
		#100;

		// NOT test
		R2 = 32'b11000101;
		R3 = 32'b1100001001;
		ALUOp = 3'b001;
		
		#100;

		// ADD test 
		R2 = 32'b1010101;
		R3 = 32'b1010;
		ALUOp = 3'b010;
		
		#100;
		
		// ADD test (with negative numbers)
		R2 = 2**32-1 - 2**16;
		R3 = 2**32-1 - 2**5;
		ALUOp = 3'b010;
		
		#100;
		
		// SUB test (R2 > R3)
		R2 = 2500;
		R3 = 500;
		ALUOp = 3'b011;
		
		#100;
		
		// SUB test (R2 < R3)
		R2 = 500;
		R3 = 2500;
		ALUOp = 3'b011;
		
		#100;
		
		// SUB test (R2 = R3)
		R2 = 32'b1100010010001;
		R3 = 32'b1100010010001;
		ALUOp = 3'b011;
		
		#100;
		
		// OR test
		R2 = 32'b10010001011000101;
		R3 = 32'b110001010010001;
		ALUOp = 3'b100;
		
		#100;
		
		// AND test
		R2 = 32'b111000001111000011;
		R3 = 32'b1100010010110;
		ALUOp = 3'b101;
		
		#100;
		
		// SLT test (R2 > R3)
		R2 = 32'b1001110001100010100;
		R3 = 32'b1100010;
		ALUOp = 3'b110;
		
		#100;
		
		// SLT test (R2 = R3)
		R2 = 32'b100010010001110001;
		R3 = 32'b100010010001110001;
		ALUOp = 3'b110;
		
		#100;
		
		// SLT test (R2 < R3)
		R2 = 32'b10010010;
		R3 = 32'b11010001010110;
		ALUOp = 3'b110;
		
		#100;
		
	end
   
	always begin
		#50 clk = ~clk;
	end
	
endmodule

