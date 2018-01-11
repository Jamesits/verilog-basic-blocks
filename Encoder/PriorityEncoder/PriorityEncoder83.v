`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    14:13:54 11/24/2017 
// Design Name:    PriorityEncoder83
// Module Name:    PriorityEncoder83.v
// Project Name:   PriorityEncoder83
// Target Devices: XC6LX16
// Tool versions: 
// Description: 
//
// 8-3 binary encoder with priority (low bits override high bits) written in bool logic.
// If notEN is high, disable this module (output all zero).
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PriorityEncoder83(
    input [7:0] Input,
    input notEN,
    output [2:0] Output,
    output Done
    );
	 

	assign Done = |Input && ~notEN;
	assign Output[0] = Done && ~(
							Input[6] && ~Input[5] && ~Input[3] && ~Input[1] 
							|| Input[4] && ~Input[3] && ~Input[2] 
							|| Input[2] && ~Input[1] 
							|| Input[0]
							);
	assign Output[1] = Done && ~(
							Input[5] && ~Input[3] && ~Input[2] 
							|| Input[4] && ~Input[3] && ~Input[2] 
							|| Input[1] 
							|| Input[0]
							);
	assign Output[2] = Done && ~(
							Input[0] || Input[1] || Input[2] || Input[3]
							);


endmodule
