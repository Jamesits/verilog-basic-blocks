`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:08 12/01/2017 
// Design Name: 
// Module Name:    ReversableCounter 
// Project Name: 
// Target Devices: 
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
