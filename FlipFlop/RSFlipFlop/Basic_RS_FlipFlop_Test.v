`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      James Swineson
//
// Create Date:   13:43:57 11/24/2017
// Design Name:   Basic_RS_FlipFlop
// Module Name:   Basic_RS_FlipFLop_Test.v
// Project Name:  Basic_RS_FlipFlop
// Target Device: XC6LX16
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Basic_RS_FlipFlop
//
// Dependencies:  Basic_RS_FlipFlop.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Basic_RS_FF_Test;

	// Inputs
	reg notR;
	reg notS;

	// Outputs
	wire Q;
	wire notQ;

	// Instantiate the Unit Under Test (UUT)
	Basic_RS_FlipFlop uut (
		.notR(notR), 
		.notS(notS), 
		.Q(Q), 
		.notQ(notQ)
	);

	initial begin
		// Initialize Inputs
		notR = 0;
		notS = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		notR = 0; notS = 0; #100; // Q^(n+1) = d
		notR = 0; notS = 1; #100; // Q^(n+1) = 1
		notR = 1; notS = 1; #100; // Q^(n+1) = Q^n = 1
		notR = 1; notS = 0; #100; // Q^(n+1) = 0
		notR = 1; notS = 1; #100; // Q^(n+1) = Q^n = 0

	end
      
endmodule

