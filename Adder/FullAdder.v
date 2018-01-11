`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    14:35:46 11/03/2017 
// Design Name:    FullAdder
// Module Name:    FullAdder.v
// Project Name:   FullAdder
// Target Devices: XC6LX16
// Tool versions: 
// Description: 
//
// A 1-bit full adder written in gate logic.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FullAdder(
    input InputA,
    input InputB,
    input InputCarry,
    output OutputS,
    output OutputCarry
    );

wire W1, W2, W3;

xor XOR1 (W1, InputA, InputB);
xor XOR2 (OutputS, W1, InputCarry);
and AND1 (W2, InputA, InputB);
and AND2 (W3, InputCarry, W1);
or OR1 (OutputCarry, W2, W3);

endmodule
