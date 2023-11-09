`timescale 1ns / 1ps

module fifo1
#(parameter DW = 8,AW = 4)//默认数据宽度8，FIFO深度16
(
    input  wire clk_r,
    input  wire clk_w,
    input  wire rst_n,
    input  wire we,
    input  wire re,
    input  wire [DW-1:0]din,
    output wire [DW-1:0]dout,
    output reg  doutValid,
    output wire empty,
    output wire full
    );
    
// internal signal
localparam Depth = 1 << AW;//depth of FIFO 
reg [DW-1:0]ram[0:Depth-1];
reg [AW:0]wp;  //point
reg [AW:0]rp;
wire [AW:0]wp_g;//Gray point
wire [AW:0]rp_g;
reg [AW:0]wp_m;//mid_point for syn
reg [AW:0]rp_m;
reg [AW:0]wp_s;//point after syn
reg [AW:0]rp_s;
reg [DW-1:0]dout_reg;

// FIFO declaration
// 二进制指针转换为格雷指针
assign wp_g = (wp>>1) ^ wp;
assign rp_g = (rp>>1) ^ rp;
// 空满检测,使用同步后的格雷指针?
assign empty = (wp_s == rp_g)?1'b1:1'b0;// 空检测,使用同步后的写格雷指针
assign full = ( {~wp_g[AW:AW-1] , wp_g[AW-2:0]} == {rp_s[AW:AW-1] , rp_s[AW-2:0]} )?1'b1:1'b0;  // 满检测,使用同步后的读格雷指针
assign dout = doutValid ? dout_reg : {DW{1'bz}};

// 读指针
always@(posedge clk_r or negedge rst_n)
begin
    if(!rst_n)
        rp <= {AW{1'b0}};
    else if(!empty & re)
        rp <= rp + 1'b1;
    else
        rp <= rp;
end

//写指针
always@(posedge clk_w or negedge rst_n)
begin
    if(!rst_n)
        wp <= {AW{1'b0}};
    else if(!full & we)
        wp <= wp + 1'b1;
    else
        wp <= wp;
end

// 读操作
always@(posedge clk_r or negedge rst_n)
begin
    if(!rst_n)begin
        dout_reg <= {DW{1'bz}};
        doutValid <= 0;
    end
    else if(!empty & re)begin
        dout_reg <= ram[rp[AW-1:0]];
        doutValid <= 1;
    end
    else begin
        dout_reg <= dout_reg;
        doutValid <= 0;
    end
end

//写操作
always@(posedge clk_w)
begin
    if(!full & we)
        ram[wp[AW-1:0]] <= din;
    else
        ram[wp[AW-1:0]] <= ram[wp[AW-1:0]];
end

// 读时钟域，写地址同步
always@(posedge clk_r or negedge rst_n)
begin
    if(!rst_n)
        begin
            wp_m <= {AW{1'b0}};
            wp_s <= {AW{1'b0}};       
        end
    else
        begin
            wp_m <= wp_g;
            wp_s <= wp_m;    
        end       
end

// 写时钟域，读地址同步
always@(posedge clk_w or negedge rst_n)
begin
    if(!rst_n)
        begin
            rp_m <= {AW{1'b0}};
            rp_s <= {AW{1'b0}};       
        end
    else
        begin
            rp_m <= rp_g;
            rp_s <= rp_m;    
        end       
end

endmodule