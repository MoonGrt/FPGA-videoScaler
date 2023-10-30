`timescale 1ns / 1ps

module image_cut#(
    parameter H_DISP = 12'd1920,
    parameter V_DISP = 12'd1080
)(
    input wire clk,
    
    input wire [11:0] start_x,
    input wire [11:0] start_y,
    input wire [11:0] end_x,
    input wire [11:0] end_y,
    
    input wire vs_i,
    input wire hs_i,
    input wire de_i,
    input wire [23:0] rgb_i,
    
    output wire de_o,
    output wire vs_o,
    output wire [23:0] rgb_o
    );

reg [11:0] pixel_x = 0;
reg [11:0] pixel_y = 0;
wire [20:0] addr;
assign rgb_o = de_o ? rgb_i : 24'dz;
assign de_o = ((pixel_x >= start_x && pixel_x < end_x) && (pixel_y >= start_y && pixel_y < end_y)) ? 1 : 0;
assign vs_o = (addr == start_x + H_DISP * start_y - 1) ? 1 : 0;
assign addr = pixel_x + pixel_y * H_DISP;

always@(posedge clk)
begin
	if(de_i)
	   if(pixel_x == H_DISP - 1)
	       if(pixel_y == V_DISP - 1)
	           pixel_y <= 0;
	       else
	           pixel_y <= pixel_y + 1;
	   else
	       pixel_y <= pixel_y;
	else
        pixel_y <= pixel_y;
end

always@(posedge clk)
begin
	if(de_i)
	    if(pixel_x == H_DISP - 1)
	        pixel_x <= 0;
	    else
	        pixel_x <= pixel_x + 1;
	else
	    pixel_x <= pixel_x;
end

endmodule