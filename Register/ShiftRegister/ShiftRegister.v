`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    14:36:35 12/01/2017 
// Design Name:    ShiftRegister
// Module Name:    ShiftRegister.v
// Project Name:   ShiftRegister
// Target Devices: XC6LX16
// Tool versions: 
// Description: 
//
// A 4-bit register with circular bit shift function.
// When OE is high, suppress all output (set to high impedance).
// On CLK positive edge:
//      S = 00: hold
//      S = 01: left shift
//      S = 10: right shift
//      S = 11: load from bus D
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
