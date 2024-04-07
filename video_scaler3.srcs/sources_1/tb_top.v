`timescale 1ns / 1ps

`define VIDEO_480_272
//`define VIDEO_1920_1080

module tb_top(
//    input wire clk,
//    input wire clk_2x,
//    input wire clk_5x,
//    input wire rst_n
);

// port declaration
reg clk = 0;
reg clk_2x = 0;
//reg clk_5x = 0;
reg rst_n = 0;
reg en = 1;
always #5   clk = ~clk;
always #2.5 clk_2x = ~clk_2x;
//always #1   clk_5x = ~clk_5x;

initial
begin
    #100 rst_n = 1'b1;
//    #100 en = 1'b1;
end

//video timing parameter definition
`ifdef  VIDEO_480_272   //480x272 9Mhz
    parameter H_DISP = 16'd480;     //horizontal active time (pixels)                      
    parameter H_FRONT = 16'd2;      //horizontal front porch (pixels)                       
    parameter H_SYNC = 16'd41;      //horizontal sync time(pixels)                         
    parameter H_BACK = 16'd2;       //horizontal back porch (pixels)                       
    parameter V_DISP = 16'd272;     //vertical active Time (lines)                         
    parameter V_FRONT  = 16'd2;     //vertical front porch (lines)                         
    parameter V_SYNC  = 16'd10;     //vertical sync time (lines)                           
    parameter V_BACK  = 16'd2;      //vertical back porch (lines)                          
    parameter HS_POL = 1'b1;        //vertical sync polarity, 1 : POSITIVE,0 : NEGATIVE;   
    parameter VS_POL = 1'b1;        //horizontal sync polarity, 1 : POSITIVE,0 : NEGATIVE; 
//    parameter HS_POL = 1'b0;      
//    parameter VS_POL = 1'b0;      
`endif
`ifdef  VIDEO_640_480   //640x480 25.175Mhz
    parameter H_DISP = 16'd640; 
    parameter H_FRONT = 16'd16;      
    parameter H_SYNC = 16'd96;    
    parameter H_BACK = 16'd48;      
    parameter V_DISP = 16'd480; 
    parameter V_FRONT  = 16'd10;    
    parameter V_SYNC  = 16'd2;    
    parameter V_BACK  = 16'd33;    
    parameter HS_POL = 1'b0;
    parameter VS_POL = 1'b0;
`endif
`ifdef  VIDEO_800_480   //800x480 33Mhz
    parameter H_DISP = 16'd800; 
    parameter H_FRONT = 16'd40;      
    parameter H_SYNC = 16'd128;   
    parameter H_BACK = 16'd88;      
    parameter V_DISP = 16'd480; 
    parameter V_FRONT  = 16'd1;     
    parameter V_SYNC  = 16'd3;    
    parameter V_BACK  = 16'd21;    
    parameter HS_POL = 1'b0;
    parameter VS_POL = 1'b0;
`endif
`ifdef  VIDEO_800_600   //800x600 40Mhz
    parameter H_DISP = 16'd800; 
    parameter H_FRONT = 16'd40;      
    parameter H_SYNC = 16'd128;   
    parameter H_BACK = 16'd88;      
    parameter V_DISP = 16'd600; 
    parameter V_FRONT  = 16'd1;     
    parameter V_SYNC  = 16'd4;    
    parameter V_BACK  = 16'd23;    
    parameter HS_POL = 1'b1;
    parameter VS_POL = 1'b1;
`endif
`ifdef  VIDEO_1280_720
    parameter H_DISP = 16'd1280;    
    parameter H_FRONT = 16'd110;    
    parameter H_SYNC = 16'd40;      
    parameter H_BACK = 16'd220;     
    parameter V_DISP = 16'd720;     
    parameter V_FRONT  = 16'd5;     
    parameter V_SYNC  = 16'd5;      
    parameter V_BACK  = 16'd20;     
    parameter HS_POL = 1'b1;        
    parameter VS_POL = 1'b1;        
`endif
`ifdef  VIDEO_1024_768  //1024x768 65Mhz
    parameter H_DISP = 16'd1024;
    parameter H_FRONT = 16'd24;      
    parameter H_SYNC = 16'd136;   
    parameter H_BACK = 16'd160;     
    parameter V_DISP = 16'd768; 
    parameter V_FRONT  = 16'd3;      
    parameter V_SYNC  = 16'd6;    
    parameter V_BACK  = 16'd29;     
    parameter HS_POL = 1'b0;
    parameter VS_POL = 1'b0;
`endif
`ifdef  VIDEO_1920_1080 //1920x1080 148.5Mhz
    parameter H_DISP = 16'd1920;
    parameter H_FRONT = 16'd88;
    parameter H_SYNC = 16'd44;
    parameter H_BACK = 16'd148; 
    parameter V_DISP = 16'd1080;
    parameter V_FRONT  = 16'd4;
    parameter V_SYNC  = 16'd5;
    parameter V_BACK  = 16'd36;
    parameter HS_POL = 1'b1;
    parameter VS_POL = 1'b1;
`endif

// algorithm Parameters
parameter DATA_WIDTH          = 8 ;
parameter CHANNELS            = 3 ;
parameter BUFFER_SIZE         = 3 ;
parameter DISCARD_CNT_WIDTH   = 2 ;
parameter INPUT_X_RES_WIDTH   = 11;
parameter INPUT_Y_RES_WIDTH   = 11;
parameter OUTPUT_X_RES_WIDTH  = 11;
parameter OUTPUT_Y_RES_WIDTH  = 11;

// algorithm Inputs
//中间半屏放大一倍
//parameter START_X = H_DISP / 4;
//parameter START_Y = V_DISP / 4;
//parameter END_X = H_DISP * 3 / 4;
//parameter END_Y = V_DISP * 3 / 4;
//parameter OUTPUT_X_RES = H_DISP - 1;    //Resolution of output data minus 1
//parameter OUTPUT_Y_RES = V_DISP - 1;    //Resolution of output data minus 1

//全屏缩小一倍
parameter START_X = 0;
parameter START_Y = 0;
parameter END_X = H_DISP;
parameter END_Y = V_DISP;
parameter OUTPUT_X_RES = H_DISP / 2 - 1;    //Resolution of output data minus 1
parameter OUTPUT_Y_RES = V_DISP / 2 - 1;    //Resolution of output data minus 1

//自定义
//reg [INPUT_X_RES_WIDTH-1:0] START_X = 56;
//reg [INPUT_Y_RES_WIDTH-1:0] START_Y = 12;
//reg [OUTPUT_X_RES_WIDTH-1:0] END_X  = 215;
//reg [OUTPUT_Y_RES_WIDTH-1:0] END_Y  = 158;
//parameter OUTPUT_X_RES = H_DISP - 1;    //Resolution of output data minus 1
//parameter OUTPUT_Y_RES = V_DISP - 1;    //Resolution of output data minus 1
//reg [INPUT_X_RES_WIDTH-1:0] START_X = 0;
//reg [INPUT_Y_RES_WIDTH-1:0] START_Y = 0;
//reg [OUTPUT_X_RES_WIDTH-1:0] END_X  = H_DISP;
//reg [OUTPUT_Y_RES_WIDTH-1:0] END_Y  = V_DISP;
//parameter OUTPUT_X_RES = 253;    //Resolution of output data minus 1
//parameter OUTPUT_Y_RES = 123;    //Resolution of output data minus 1

//reg Algorithm = 0; // 算法选择   0是双线性插值，1是邻近域
reg Algorithm = 1; // 算法选择   0是双线性插值，1是邻近域

wire hs_i,vs_i,de_i;
wire [DATA_WIDTH-1:0] rgb_r, rgb_g, rgb_b;
wire hs_i_reg,vs_i_reg,de_i_reg;
wire [DATA_WIDTH-1:0] rgb_r_reg, rgb_g_reg, rgb_b_reg;
//wire [DATA_WIDTH*CHANNELS-1:0] scaler_data;
//wire scaler_dataValid;
wire [DATA_WIDTH*CHANNELS-1:0] algorithm_data;
wire algorithm_dataValid;

assign rgb_r = en ? rgb_r_reg : 'dz;
assign rgb_g = en ? rgb_g_reg : 'dz;
assign rgb_b = en ? rgb_b_reg : 'dz;
assign hs_i  = en ? hs_i_reg  : 'dz;
assign vs_i  = en ? vs_i_reg  : 'dz;
assign de_i  = en ? de_i_reg  : 'dz;

color_bar #(
    .H_SYNC        ( H_SYNC        ),
    .H_BACK        ( H_BACK        ),
    .H_DISP        ( H_DISP        ),
    .H_FRONT       ( H_FRONT       ),
    .HS_POL        ( HS_POL        ),
    .V_SYNC        ( V_SYNC        ),
    .V_BACK        ( V_BACK        ),
    .V_DISP        ( V_DISP        ),
    .V_FRONT       ( V_FRONT       ),
    .VS_POL        ( VS_POL        ))
color_bar(
    .clk     ( clk   ),
    .rst     ( ~rst_n ),

    .hs      ( hs_i_reg ),
    .vs      ( vs_i_reg ),
    .de      ( de_i_reg ),
    .rgb_r   ( rgb_r_reg ),
    .rgb_g   ( rgb_g_reg ),
    .rgb_b   ( rgb_b_reg )
);

algorithm #(
    .H_SYNC             ( H_SYNC             ),
    .H_BACK             ( H_BACK             ),
    .H_DISP             ( H_DISP             ),
    .H_FRONT            ( H_FRONT            ),
    
    .V_SYNC             ( V_SYNC             ),
    .V_BACK             ( V_BACK             ),
    .V_DISP             ( V_DISP             ),
    .V_FRONT            ( V_FRONT            ),
    
    .DATA_WIDTH         ( DATA_WIDTH         ),
    .CHANNELS           ( CHANNELS           ),
    .BUFFER_SIZE        ( BUFFER_SIZE        ),
    
    .INPUT_X_RES_WIDTH  ( INPUT_X_RES_WIDTH  ),
    .INPUT_Y_RES_WIDTH  ( INPUT_Y_RES_WIDTH  ),
    .OUTPUT_X_RES_WIDTH ( OUTPUT_X_RES_WIDTH ),
    .OUTPUT_Y_RES_WIDTH ( OUTPUT_Y_RES_WIDTH ))
 algorithm (
    .clk                ( clk             ),
    .clk_2x             ( clk_2x          ),
//    .rst_n              ( rst_n           ),
    
    .START_X            ( START_X         ),
    .START_Y            ( START_Y         ),
    .END_X              ( END_X           ),
    .END_Y              ( END_Y           ),
    .outputXRes         ( OUTPUT_X_RES    ),
    .outputYRes         ( OUTPUT_Y_RES    ),
    
    .Algorithm          ( Algorithm       ),
    .hs_i               ( hs_i            ),
    .vs_i               ( vs_i            ),
    .de_i               ( de_i            ),
    .rgb_i              ({rgb_r,rgb_g,rgb_b}),
    
    .algorithm_data     (algorithm_data),
    .algorithm_dataValid(algorithm_dataValid)
//    .scaler_data        (scaler_data      ),
//    .scaler_dataValid   (scaler_dataValid )
);

endmodule
