`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:39:03 11/24/2017 
// Design Name: 
// Module Name:    Basic_RS_FlipFlop 
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
module Basic_RS_FlipFlop(
    input notR,
    input notS,
    output Q,
    output notQ
    );
nand nand1(Q, notS, notQ);
nand nand2(notQ, notR, Q);

endmodule
