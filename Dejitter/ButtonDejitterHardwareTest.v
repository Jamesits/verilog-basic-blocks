`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    13:27:56 01/05/2018 
// Design Name:    ButtonDejitter
// Module Name:    ButtonDejitterHardwareTest.v
// Project Name:   ButtonDejitter
// Target Devices: XC6LX16
// Tool versions: 
// Description: 
//
// Utilize a counter to demonstrate result of dejitter. 
// When you press button one time, the counter changes only one time.
//
// Dependencies: ButtonDejitter, ReversableCounter
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ButtonDejitterHardwareTest(
    input BTN,
    input RST,
	 input CLK,
    output [3:0] OUT
    );

wire INNER_BTN;
reg TRUE = 1;
reg FALSE = 0;

ButtonDejitter #(.COUNT_TO(500000)) bd0 (
    .BTN_IN(BTN),
    .CLK(CLK),
    .BTN_OUT(INNER_BTN)
);

ReversableCounter rc0 (
	 .LOAD(TRUE),
    .CLK(INNER_BTN),
    .EN(TRUE),
    .DATA(FALSE),
    .MR(RST),
    .Q(OUT)
);

endmodule
