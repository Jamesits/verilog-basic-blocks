`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      James Swineson
//
// Create Date:   14:45:52 12/01/2017
// Design Name:   ShiftRegister
// Module Name:   ShiftRegisterTest
// Project Name:  ShiftRegister
// Target Device: XC6LX16
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShiftRegister
//
// Dependencies: ShiftRegister
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ShiftRegisterTest;

	// Inputs
	reg CLK;
	reg [3:0] D;
	reg [1:0] S;
	reg OE;

	// Outputs
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	ShiftRegister uut (
		.CLK(CLK), 
		.D(D), 
		.S(S), 
		.OE(OE), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		D = 0;
		S = 0;
		OE = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// initialize
		OE = 0; D = 4'b0; S = 2'b11; CLK = 1; #10; CLK = 0; #10;
		
		// test OE
		OE = 1; #10; OE = 0; #10;
		
		// test shift
		D = 4'b0101; S = 2'b11; CLK = 1; #10; CLK = 0; #10;
		S = 2'b01; CLK = 1; #10; CLK = 0; #10;
		S = 2'b10; CLK = 1; #10; CLK = 0; #10;
		
		// test hold
		S = 2'b00; CLK = 1; #10; CLK = 0; #10;
	end
      
endmodule

