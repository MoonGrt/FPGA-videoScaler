`timescale 1ns / 1ps

module read_image#(
	parameter DATA_WIDTH = 8,
//	parameter ADDRESS_WIDTH = 8,
	
	parameter  H_SYNC   =  12'd44,    //行同步
    parameter  H_BACK   =  12'd148,   //行显示后沿
    parameter  H_DISP   =  12'd1920,  //行有效数据
    parameter  H_FRONT  =  12'd88,    //行显示前沿
    parameter  H_TOTAL  =  12'd2200,  //行扫描周期
    
    parameter  V_SYNC   =  12'd5,     //场同步
    parameter  V_BACK   =  12'd36,    //场显示后沿
    parameter  V_DISP   =  12'd1080,  //场有效数据
    parameter  V_FRONT  =  12'd4,     //场显示前沿
    parameter  V_TOTAL  =  12'd1125   //场扫描周期
)(
    input  wire clk,
    input  wire rst_n,
    input  wire [(DATA_WIDTH-1):0] data,
    output wire read_en,
//    output wire [(ADDRESS_WIDTH-1):0] addr,
    
    output  wire [23:0] rgb,
    output  wire  hsync,    // hsync data
    output  wire  vsync,    // vsync data
    output  wire  de        // data enable
    );
    
//signal define
reg  [11:0] cnt_h;
reg  [11:0] cnt_v;
reg       	video_en, data_req;
reg  [10:0] pixel_xpos, pixel_ypos;
//*****************************************************
//**                    main code
//*****************************************************

assign de  = video_en;
assign hsync  = (cnt_h < H_SYNC) ? 1'b0 : 1'b1;  //行同步信号赋值
assign vsync  = (cnt_v < V_SYNC) ? 1'b0 : 1'b1;  //场同步信号赋值
assign rgb = read_en ? data : 24'd0;   //RGB888数据输出
//assign addr = pixel_xpos + pixel_ypos * H_DISP;
assign read_en = (pixel_xpos < H_DISP /2)&&(pixel_xpos) ? 1 : 0;

//使能RGB数据输出
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		video_en <= 1'b0;
	else
		video_en <= data_req;
end

//请求像素点颜色数据输入
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		data_req <= 1'b0;
	else if(((cnt_h >= H_SYNC + H_BACK - 2'd2) && (cnt_h < H_SYNC + H_BACK + H_DISP - 2'd2))
                  && ((cnt_v >= V_SYNC + V_BACK) && (cnt_v < V_SYNC + V_BACK+V_DISP)))
		data_req <= 1'b1;
	else
		data_req <= 1'b0;
end

//像素点x坐标
always@ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        pixel_xpos <= 11'd0;
    else if(data_req)
        pixel_xpos <= cnt_h + 2'd2 - H_SYNC - H_BACK ;
    else 
        pixel_xpos <= 11'd0;
end
    
//像素点y坐标	
always@ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        pixel_ypos <= 11'd0;
    else if((cnt_v >= (V_SYNC + V_BACK)) && (cnt_v < (V_SYNC + V_BACK + V_DISP)))
        pixel_ypos <= cnt_v - (V_SYNC + V_BACK) ;
    else 
        pixel_ypos <= 11'd0;
end

//行计数器对像素时钟计数
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        cnt_h <= 11'd0;
    else begin
        if(cnt_h < H_TOTAL - 1'b1)
            cnt_h <= cnt_h + 1'b1;
        else 
            cnt_h <= 11'd0;
    end
end

//场计数器对行计数
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        cnt_v <= 11'd0;
    else if(cnt_h == H_TOTAL - 1'b1) begin
        if(cnt_v < V_TOTAL - 1'b1)
            cnt_v <= cnt_v + 1'b1;
        else 
            cnt_v <= 11'd0;
    end
end

endmodule
