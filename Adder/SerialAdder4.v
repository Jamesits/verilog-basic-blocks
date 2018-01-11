`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    22:10:15 11/11/2017 
// Design Name:    SerialAdder4
// Module Name:    SerialAdder4.v
// Project Name:   SerialAdder4
// Target Devices: XC6LX16
// Tool versions: 
// Description: 
//
// A 4-bit serial adder
//
// Dependencies: FullAdder
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SerialAdder4(
    input [3:0] InputA,
    input [3:0] InputB,
    input InputCarry,
    output [3:0] Output,
    output OutputCarry
    );
wire C1, C2, C3;
FullAdder FA0(InputA[0], InputB[0], InputCarry, Output[0], C1);
FullAdder FA1(InputA[1], InputB[1], C1, Output[1], C2);
FullAdder FA2(InputA[2], InputB[2], C2, Output[2], C3);
FullAdder FA3(InputA[3], InputB[3], C3, Output[3], OutputCarry);

endmodule
