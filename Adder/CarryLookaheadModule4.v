`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    22:38:44 11/11/2017 
// Design Name:    CarryLookaheadAdder4
// Module Name:    CarryLookaheadModule4.v 
// Project Name:   CarryLookaheadAdder4
// Target Devices: XC6LX16
// Tool versions: 
// Description: 
//
// A 4-bit carry lookahead module to use in adder, written in bool logic.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CarryLookaheadModule4(
    input [3:0] InputA,
	 input [3:0] InputB,
    input InputCarry,
    output [3:0] OutputCarry,
    output GroupGeneration,
    output GroupPropagation
    );
wire [3:0] Generation;
wire [3:0] Propagation;

// generate signal Gn and Pn
assign Generation = InputA & InputB;
assign Propagation = InputA | InputB;

// calculate OutputCarry bits

// serial
//assign OutputCarry[0] = Generation[0] | Propagation[0] & InputCarry;
//assign OutputCarry[1] = Generation[1] | Propagation[1] & OutputCarry[0];
//assign OutputCarry[2] = Generation[2] | Propagation[2] & OutputCarry[1];
//assign OutputCarry[3] = Generation[3] | Propagation[3] & OutputCarry[2];

// parallel 
`define GPC(G, P, C) ((G) | (P) & (C))
`define OC0 `GPC(Generation[0], Propagation[0], InputCarry)
`define OC1 `GPC(Generation[1], Propagation[1], `OC0)
`define OC2 `GPC(Generation[2], Propagation[2], `OC1)
`define OC3 `GPC(Generation[3], Propagation[3], `OC2)

assign OutputCarry[0] = `OC0;
assign OutputCarry[1] = `OC1;
assign OutputCarry[2] = `OC2;
assign OutputCarry[3] = `OC3;

// for chaining adders
assign GroupPropagation = &Propagation;
assign GroupGeneration = Generation[3] 
								| Generation[2] & Propagation[3]
								| Generation[1] & Propagation[3] & Propagation[2]
								| Generation[0] & Propagation[3] & Propagation[2] & Propagation[1];

endmodule
