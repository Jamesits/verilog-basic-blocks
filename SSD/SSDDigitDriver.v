`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James Swineson
// 
// Create Date:    13:50:36 01/05/2018 
// Design Name: 
// Module Name:    SSDDigitDriver 
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
module SSDDigitDriver(
    input [3:0] INPUT_NUM,
    input DIGITPOINT,
    output reg [7:0] SSD_OUTPUT
    );

reg [6:0] SSD_Charmap[0:15];
integer value;
initial $readmemb("SSD_Charmap.mem", SSD_Charmap);

always @(INPUT_NUM) begin
    value = INPUT_NUM;
	 SSD_OUTPUT <= {DIGITPOINT, SSD_Charmap[value]};
end

endmodule
