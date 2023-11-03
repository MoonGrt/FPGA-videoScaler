`timescale 1ns / 1ps

module pixel_cnt(
    input wire clk,
    input wire de
    );

reg [16:0] pixel_cnt = 0;

always @(posedge clk)
begin
	if(de)
		pixel_cnt <= pixel_cnt + 1;
	else
	    pixel_cnt <= pixel_cnt;
end

endmodule
