`timescale 1ns / 1ps

module fill_brank#(
    parameter H_DISP = 12'd1920,
    parameter INPUT_X_RES_WIDTH = 11,
    parameter OUTPUT_X_RES_WIDTH = 11
)(
    input wire clk,
    input wire [23:0] data_i,
    input wire        dataValid_i,

    output wire [23:0] data_o,
    output  wire       dataValid_o
);

localparam BLACK = 24'b0;
reg [11:0] pixel_x = 0;
reg [11:0] brank_cnt = 0;

wire [11:0] brank_size = dataValid_i ? (H_DISP - pixel_x) : brank_size;
wire fill_flag = brank_cnt < brank_size;
assign dataValid_o = dataValid_i | fill_flag;
assign data_o = dataValid_i ? data_i : BLACK;

always @(posedge clk) begin
	if (dataValid_i)
		pixel_x <= pixel_x + 1;
	else
		pixel_x <= 0;
end

always @(posedge clk) begin
	if (fill_flag && ~dataValid_i)
		brank_cnt <= brank_cnt + 1;
	else if(dataValid_i)
		brank_cnt <= 0;
    else 
        brank_cnt <= brank_cnt;
end

endmodule