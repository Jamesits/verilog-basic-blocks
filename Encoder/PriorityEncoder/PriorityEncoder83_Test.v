`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      James Swineson
//
// Create Date:   14:46:27 11/24/2017
// Design Name:   PriorityEncoder83
// Module Name:   PriorityEncoder83_Test.v
// Project Name:  PriorityEncoder83
// Target Device: XC6LX16
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PriorityEncoder83
//
// Dependencies: PriorityEncoder83
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PriorityEncoder83_Test;

	// Inputs
	reg [7:0] Input;
	reg notEN;

	// Outputs
	wire [2:0] Output;
	wire Done;

	// Instantiate the Unit Under Test (UUT)
	PriorityEncoder83 uut (
		.Input(Input), 
		.notEN(notEN), 
		.Output(Output), 
		.Done(Done)
	);

	initial begin
		// Initialize Inputs
		Input = 0;
		notEN = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Input = 8'b11111111; notEN = 1; #100;
		notEN = 0;
		Input = 8'b00000000; #100;
		Input = 8'b00000001; #100;
		Input = 8'b10000001; #100;
		Input = 8'b00000010; #100;
		Input = 8'b01000010; #100;
		Input = 8'b00000100; #100;
		Input = 8'b00100100; #100;
		Input = 8'b00001000; #100;
		Input = 8'b00010000; #100;
		Input = 8'b00100000; #100;
		Input = 8'b01000000; #100;
		Input = 8'b10000000; #100;
		

	end
      
endmodule

