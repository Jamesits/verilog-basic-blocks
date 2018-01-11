`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    14:06:46 01/05/2018 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
    input CLK,
    input [31:0] INPUT,
    output reg [7:0] OUTPUT
    );

reg [1:0] COUNT = 0;
always @(posedge CLK) begin
	case (COUNT)
		2'd0: OUTPUT <= INPUT[7:0];
		2'd1: OUTPUT <= INPUT[15:8];
		2'd2: OUTPUT <= INPUT[23:16];
		2'd3: OUTPUT <= INPUT[31:24];
	endcase
	COUNT = COUNT + 1;
end

endmodule
