`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:35 12/01/2017 
// Design Name: 
// Module Name:    ShiftRegister 
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
module ShiftRegister(
    input CLK,
    input [3:0] D,
    input [1:0] S,
    input OE,
    output [3:0] Q
    );

reg [3:0] Register;

assign Q = OE? 4'bzzzz : Register;

always @(posedge CLK) begin
	case (S)
		2'b01: Register <= {Register[2:0], Register[3]};
		2'b10: Register <= {Register[0], Register[3:1]};
		2'b11: Register <= D;
	endcase
end

endmodule
