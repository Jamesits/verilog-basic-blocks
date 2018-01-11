`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    13:54:08 12/01/2017 
// Design Name:    ReversableCounter
// Module Name:    ReversableCounter.v
// Project Name:   ReversableCounter
// Target Devices: XC6LX16
// Tool versions: 
// Description: 
//
// A 4-bit counter providing +1/-1 operation.
// MR: async clear on positive edge
// LOAD: load bus D to output on negative edge
// EN: enable +1/-1 on clock positive edge if high
// DATA: +1 if low, -1 if high
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ReversableCounter(
    input LOAD,
    input CLK,
    input EN,
    input DATA,
    input MR,
    input [3:0] D,
    output reg [3:0] Q,
    output CO
    );
	 
assign CO = (DATA == 0 && Q == 4'hF) || (DATA == 1 && Q == 4'b0);

always @(posedge MR or posedge CLK) begin
	if (MR == 1) begin
		Q <= 4'b0;
	end else if (LOAD == 0) begin
		Q <= D;
	end else if (EN == 1) begin
		if (DATA == 0) Q <= Q + 1; else Q <= Q - 1;
	end
end

endmodule
