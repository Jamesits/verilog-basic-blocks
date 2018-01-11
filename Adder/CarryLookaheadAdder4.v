`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    23:15:38 11/11/2017 
// Design Name:    CarryLookaheadAdder4
// Module Name:    CarryLookaheadAdder4.v 
// Project Name:   CarryLookaheadAdder4
// Target Devices: XC6LX16
// Tool versions: 
// Description: 
//
// A 4-bit carry lookahead Adder.
//
// Dependencies: FullAdder, CarryLookaheadModule4
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CarryLookaheadAdder4(
    input [3:0] InputA,
    input [3:0] InputB,
    input InputCarry,
    output [3:0] Output,
    output OutputCarry,
    output OutputGroupPropagation,
    output OutputGroupGeneration
    );
wire [3:0] Carry; // actually C1~C4
FullAdder FA1(InputA[0], InputB[0], InputCarry, Output[0],);
FullAdder FA2(InputA[1], InputB[1], Carry[0], Output[1],);
FullAdder FA3(InputA[2], InputB[2], Carry[1], Output[2],);
FullAdder FA4(InputA[3], InputB[3], Carry[2], Output[3],);
CarryLookaheadModule4 CAM(InputA, InputB, InputCarry, Carry, OutputGroupGeneration, OutputGroupPropagation);

assign OutputCarry = Carry[3];

endmodule
