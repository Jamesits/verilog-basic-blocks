`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    13:39:03 11/24/2017 
// Design Name:    Basic_RS_FlipFlop
// Module Name:    Basic_RS_FlipFlop.v
// Project Name:   Basic_RS_FlipFlop
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
module Basic_RS_FlipFlop(
    input notR,
    input notS,
    output Q,
    output notQ
    );
nand nand1(Q, notS, notQ);
nand nand2(notQ, notR, Q);

endmodule
