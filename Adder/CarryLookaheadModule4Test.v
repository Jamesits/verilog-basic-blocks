`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:52:42 11/11/2017
// Design Name:   CarryLookaheadAdder4
// Module Name:   /home/james/code/CarryLookaheadAdder/CarryLookaheadAdder4Test.v
// Project Name:  CarryLookaheadAdder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CarryLookaheadAdder4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CarryLookaheadAdder4Test;

	// Inputs
	reg [3:0] InputA;
	reg [3:0] InputB;
	reg InputCarry;

	// Outputs
	wire [3:0] Output;
	wire GroupGeneration;
	wire GroupPropagation;

	// Instantiate the Unit Under Test (UUT)
	CarryLookaheadAdder4 uut (
		.InputA(InputA), 
		.InputB(InputB), 
		.InputCarry(InputCarry), 
		.Output(Output), 
		.GroupGeneration(GroupGeneration), 
		.GroupPropagation(GroupPropagation)
	);

	initial begin
		// Initialize Inputs
		InputA = 0;
		InputB = 0;
		InputCarry = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Border condition
		InputA = 4'b0000; InputB = 4'b0000; InputCarry = 0; #10;
		InputA = 4'b0001; InputB = 4'b0000; InputCarry = 0; #10;
		InputA = 4'b0000; InputB = 4'b0001; InputCarry = 0; #10;
		InputA = 4'b0000; InputB = 4'b0000; InputCarry = 1; #10;
		
		InputA = 4'b1111; InputB = 4'b1111; InputCarry = 1; #10;
		InputA = 4'b1110; InputB = 4'b1111; InputCarry = 1; #10;
		InputA = 4'b1111; InputB = 4'b1110; InputCarry = 1; #10;
		InputA = 4'b1111; InputB = 4'b1111; InputCarry = 0; #10;
		
		// Random condition
		InputA = 4'b1010; InputB = 4'b0101; InputCarry = 0; #10;
		InputA = 4'b0101; InputB = 4'b1010; InputCarry = 0; #10;
		InputA = 4'b1010; InputB = 4'b0101; InputCarry = 1; #10;
		InputA = 4'b0101; InputB = 4'b1010; InputCarry = 1; #10;


	end
      
endmodule

