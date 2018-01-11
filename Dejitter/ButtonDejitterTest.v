`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      James Swineson
//
// Create Date:   14:57:18 12/30/2017
// Design Name:   ButtonDejitter
// Module Name:   ButtonDejitterTest.v
// Project Name:  ButtonDejitter
// Target Device: XC6LX16
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ButtonDejitter
//
// Dependencies:  ButtonDejitter
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
// The following test runs for ~0.04s.
// 
////////////////////////////////////////////////////////////////////////////////

module ButtonDejitterTest;

	// Inputs
	reg BTN_IN = 0;
	reg CLK = 0;

	// Outputs
	wire BTN_OUT;

	// Instantiate the Unit Under Test (UUT)
	ButtonDejitter #(
		.COUNT_TO(250000)
	)uut (
		.BTN_IN(BTN_IN), 
		.CLK(CLK), 
		.BTN_OUT(BTN_OUT)
	);
	
	// 100 MHz Clock
	always @* CLK <= #10 ~CLK;

	initial begin
		// Initialize Inputs
		BTN_IN = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Note: delay = cycles * time per cycle (#10)
		
		// should trigger
		BTN_IN = 1;
		#6000000;
		
		BTN_IN = 0;
		#6000000;
		
		// should not trigger
		BTN_IN = 1;
		#4000000;
		BTN_IN = 0;
		#1000000;
		BTN_IN = 1;
		#3000000;
		BTN_IN = 0;
		
		// should trigger
		BTN_IN = 1;
		#6000000;
		
		// should not trigger
		BTN_IN = 0;
		#4000000;
		BTN_IN = 1;
		#1000000;
		BTN_IN = 0;
		#3000000;
		BTN_IN = 1;
	end
      
endmodule

