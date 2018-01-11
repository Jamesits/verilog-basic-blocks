`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      James Swineson
//
// Create Date:   14:43:46 11/03/2017
// Design Name:   FullAdder
// Module Name:   FullAdderTest.v
// Project Name:  FullAdder
// Target Device: XC6LX16
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FullAdder
//
// Dependencies: FullAdder
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FullAdderTest;

	// Inputs
	reg InputA;
	reg InputB;
	reg InputCarry;

	// Outputs
	wire OutputS;
	wire OutputCarry;

	// Instantiate the Unit Under Test (UUT)
	FullAdder uut (
		.InputA(InputA), 
		.InputB(InputB), 
		.InputCarry(InputCarry), 
		.OutputS(OutputS), 
		.OutputCarry(OutputCarry)
	);

	initial begin
		// Initialize Inputs
		InputA = 0;
		InputB = 0;
		InputCarry = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		InputA = 0;
		InputB = 0;
		InputCarry = 0;
		#100;
		
		InputA = 1;
		InputB = 0;
		InputCarry = 0;
		#100;
		
		InputA = 0;
		InputB = 1;
		InputCarry = 0;
		#100;
		
		InputA = 1;
		InputB = 1;
		InputCarry = 0;
		#100;
		
		InputA = 0;
		InputB = 0;
		InputCarry = 1;
		#100;
		
		InputA = 1;
		InputB = 0;
		InputCarry = 1;
		#100;
		
		InputA = 0;
		InputB = 1;
		InputCarry = 1;
		#100;
		
		InputA = 1;
		InputB = 1;
		InputCarry = 1;
		#100;

	end
      
endmodule

