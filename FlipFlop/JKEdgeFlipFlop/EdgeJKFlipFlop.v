`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    15:21:07 11/24/2017 
// Design Name: 
// Module Name:    EdgeJKFlipFlop 
// Project Name:   EdgeJKFlipFlop
// Target Devices: XC6LX16
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module EdgeJKFlipFlop(
    input J,
    input K,
    input CLK,
    output reg Q,
    output notQ
    );
	 
	assign notQ = ~Q;

	always @(posedge CLK) begin
		case ({J, K})
			2'b01: Q <= 0;
			2'b10: Q <= 1;
			2'b11: Q <= ~Q;
		endcase
	end

endmodule
