`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      James Swineson
//
// Create Date:   15:16:40 01/05/2018
// Design Name:   SSDScanHardwareTest
// Module Name:   /home/james/code/SSDScan/SSDScan_Test.v
// Project Name:  SSDScan
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SSDScanHardwareTest
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SSDScan_Test;

	// Inputs
	reg CLK;

	// Outputs
	wire [7:0] OUTPUT_SEG;
	wire [3:0] OUTPUT_SEL;
	wire COUNT_CLK;
	wire SCAN_CLK;

	// Instantiate the Unit Under Test (UUT)
	SSDScanHardwareTest uut (
		.CLK(CLK), 
		.OUTPUT_SEG(OUTPUT_SEG), 
		.OUTPUT_SEL(OUTPUT_SEL), 
		.COUNT_CLK(COUNT_CLK), 
		.SCAN_CLK(SCAN_CLK)
	);
	
	always @* CLK <= #10 ~CLK;

	initial begin
		// Initialize Inputs
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

