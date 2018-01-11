`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      James Swineson
//
// Create Date:   14:11:21 12/01/2017
// Design Name:   ReversableCounter
// Module Name:   ReversableCounterTest.v
// Project Name:  ReversableCounter
// Target Device: XC6LX16
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ReversableCounter
//
// Dependencies:  ReversableCounter
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ReversableCounterTest;

	// Inputs
	reg LOAD;
	reg CLK;
	reg EN;
	reg DATA;
	reg MR;
	reg [3:0] D;

	// Outputs
	wire [3:0] Q;
	wire CO;

	// Instantiate the Unit Under Test (UUT)
	ReversableCounter uut (
		.LOAD(LOAD), 
		.CLK(CLK), 
		.EN(EN), 
		.DATA(DATA), 
		.MR(MR), 
		.D(D), 
		.Q(Q), 
		.CO(CO)
	);

	initial begin
		// Initialize Inputs
		LOAD = 1;
		CLK = 0;
		EN = 0;
		DATA = 0;
		MR = 0;
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// reset
		MR = 1; #10; MR = 0;
		
		EN = 1; 
		// test counting up
		DATA = 0; CLK = 1; #10; CLK = 0; #10; CLK = 1; #10; CLK = 0; #10; 
		// test counting down
		DATA = 1; CLK = 1; #10; CLK = 0; #10; CLK = 1; #10; CLK = 0; #10; 
		// test EN
		EN = 0;
		DATA = 0; CLK = 1; #10; CLK = 0;
		DATA = 1; CLK = 1; #10; CLK = 0;
		// test LOAD
		D = 4'b1100; LOAD = 0; #10; LOAD = 1; #10;
		EN = 1; DATA = 0; CLK = 1; #10; CLK = 0; #10; EN = 0; #10;
		// test CO;
		D = 4'b1110; LOAD = 0; #10; LOAD = 1; #10;
		EN = 1; DATA = 0; CLK = 1; #10; CLK = 0; #10; EN = 0; #10;
		D = 4'b0001; LOAD = 0; #10; LOAD = 1; #10;
		EN = 1; DATA = 1; CLK = 1; #10; CLK = 0; #10; EN = 0; #10;
		// test MR
		D = 4'b1110; LOAD = 0; #10; LOAD = 1; #10;
		MR = 1; #10; MR = 0; #10;
	end
      
endmodule

