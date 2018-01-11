`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      James Swineson
//
// Create Date:   15:26:22 11/24/2017
// Design Name:   EdgeJKFlipFlop
// Module Name:   EdgeJKFlipFlopTest.v
// Project Name:  EdgeJKFlipFlop
// Target Device: XC6LX16
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EdgeJKFlipFlop
//
// Dependencies: EdgeJKFlipFlop
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EdgeJKFlipFlopTest;

	// Inputs
	reg J;
	reg K;
	reg CLK;

	// Outputs
	wire Q;
	wire notQ;

	// Instantiate the Unit Under Test (UUT)
	EdgeJKFlipFlop uut (
		.J(J), 
		.K(K), 
		.CLK(CLK), 
		.Q(Q), 
		.notQ(notQ)
	);

	initial begin
		// Initialize Inputs
		J = 0;
		K = 0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// set 0
		J = 0; K = 1; CLK = 1; #100;
		CLK = 0; #100;
		
		// set 1
		J = 1; K = 0; CLK = 1; #100;
		CLK = 0; #100;
		
		// flip (twice)
		J = 1; K = 1; CLK = 1; #100;
		CLK = 0; #100;
		J = 1; K = 1; CLK = 1; #100;
		CLK = 0; #100;

	end
      
endmodule

