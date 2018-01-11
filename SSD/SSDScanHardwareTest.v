`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    14:13:42 01/05/2018 
// Design Name: 
// Module Name:    SSDScanHardwareTest 
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
module SSDScanHardwareTest(
    input CLK,
    output [7:0] OUTPUT_SEG,
    output [3:0] OUTPUT_SEL,
	 output reg [7:0] STREAM_LED
    );

wire COUNT_CLK;
wire SCAN_CLK;
wire [19:0] INPUT;
reg [3:0] STREAM_LED_DATA = 0;
reg [3:0] num[0:3];
reg FALSE = 1;
reg TRUE = 0;

FrequencyDivider #(
	.COUNT_TO(5000000) // 0.1s per cycle
	) fd0 (
	.CLK_IN(CLK),
	.CLK_OUT(COUNT_CLK)
);

FrequencyDivider #(
	.COUNT_TO(10000) // 0.0005s per cycle = 200Hz
	) fd1 (
	.CLK_IN(CLK),
	.CLK_OUT(SCAN_CLK)
);

SSD4ScanDriver drv0(
    .CLK(SCAN_CLK),
    .INPUT(INPUT),
    .OUTPUT_SEG(OUTPUT_SEG),
    .OUTPUT_SEL(OUTPUT_SEL)
);

assign INPUT = {FALSE, num[3], FALSE, num[2], TRUE, num[1], FALSE, num[0]};

initial begin
	num[0] = 4'd0;
	num[1] = 4'd0;
	num[2] = 4'd0;
	num[3] = 4'd0;
end

always @(posedge COUNT_CLK) begin
	num[0] = num[0] + 1;
	if (num[0] > 4'd9) begin num[0] = 0; num[1] = num[1] + 1; end
	if (num[1] > 4'd9) begin num[1] = 0; num[2] = num[2] + 1; end
	if (num[2] > 4'd9) begin num[2] = 0; num[3] = num[3] + 1; end
	if (num[3] > 4'd9) begin num[3] = 0; num[2] = 0; num[1] = 0; num[0] = 0; end
end

always @(posedge COUNT_CLK) begin
	case (STREAM_LED_DATA)
		4'd0: STREAM_LED <= 8'd128;
		4'd1: STREAM_LED <= 8'd64;
		4'd2: STREAM_LED <= 8'd32;
		4'd3: STREAM_LED <= 8'd16;
		4'd4: STREAM_LED <= 8'd8;
		4'd5: STREAM_LED <= 8'd4;
		4'd6: STREAM_LED <= 8'd2;
		4'd7: STREAM_LED <= 8'd1;
	endcase
	STREAM_LED_DATA = STREAM_LED_DATA + 1;
	if (STREAM_LED_DATA >= 4'd8) STREAM_LED_DATA = 0;
end

endmodule
