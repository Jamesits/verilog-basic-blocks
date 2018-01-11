`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    14:03:23 01/05/2018 
// Design Name: 
// Module Name:    SSD4ScanDriver 
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
module SSD4ScanDriver(
    input CLK,
    input [19:0] INPUT,
    output [7:0] OUTPUT_SEG,
    output reg [3:0] OUTPUT_SEL
    );

wire [31:0] MUX_INPUT;
reg [1:0] count = 2'b0;

MUX mux0 (
	.CLK(CLK),
	.INPUT(MUX_INPUT),
	.OUTPUT(OUTPUT_SEG)
);

SSDDigitDriver drv0 (
	 .INPUT_NUM(INPUT[3:0]),
    .DIGITPOINT(INPUT[4]),
    .SSD_OUTPUT(MUX_INPUT[7:0])
);

SSDDigitDriver drv1 (
	 .INPUT_NUM(INPUT[8:5]),
    .DIGITPOINT(INPUT[9]),
    .SSD_OUTPUT(MUX_INPUT[15:8])
);

SSDDigitDriver drv2 (
	 .INPUT_NUM(INPUT[13:10]),
    .DIGITPOINT(INPUT[14]),
    .SSD_OUTPUT(MUX_INPUT[23:16])
);

SSDDigitDriver drv3 (
	 .INPUT_NUM(INPUT[18:15]),
    .DIGITPOINT(INPUT[19]),
    .SSD_OUTPUT(MUX_INPUT[31:24])
);

always @(posedge CLK) begin
	case (count)
		2'd0: OUTPUT_SEL <= 4'b1110;
		2'd1: OUTPUT_SEL <= 4'b1101;
		2'd2: OUTPUT_SEL <= 4'b1011;
		2'd3: OUTPUT_SEL <= 4'b0111;
	endcase
	count = count + 1;
end

endmodule
