module  hdmi_tx(
    input        sys_rst_n,
    input        pixel_clk,
    input        pixel_clk_5x,
    
    output [9:0] tmds_data0,
    output [9:0] tmds_data1,
    output [9:0] tmds_data2,
    output [9:0] tmds_clk,
    output       tmds_oen       // TMDS 输出使能
);

//wire define
wire  [10:0]  pixel_xpos_w;
wire  [10:0]  pixel_ypos_w;
wire  [23:0]  pixel_data_w;

wire          video_hs;
wire          video_vs;
wire          video_de;
wire  [23:0]  video_rgb;

//*****************************************************
//**                    main code
//*****************************************************

//例化视频显示驱动模块
video_driver  u_video_driver(
    .pixel_clk      ( pixel_clk ),
    .sys_rst_n      ( sys_rst_n ),

    .video_hs       ( video_hs ),
    .video_vs       ( video_vs ),
    .video_de       ( video_de ),
    .video_rgb      ( video_rgb ),
	.data_req		(),

    .pixel_xpos     ( pixel_xpos_w ),
    .pixel_ypos     ( pixel_ypos_w ),
	.pixel_data     ( pixel_data_w )
);

//例化视频显示模块
video_display  u_video_display(
    .pixel_clk      (pixel_clk),
    .sys_rst_n      (sys_rst_n),

    .pixel_xpos     (pixel_xpos_w),
    .pixel_ypos     (pixel_ypos_w),
    .pixel_data     (pixel_data_w)
    );

//例化HDMI驱动模块
dvi_transmitter_top u_rgb2dvi_0(
    .pclk           (pixel_clk),
    .pclk_x5        (pixel_clk_5x),
    .reset_n        (sys_rst_n),
                
    .video_din      (video_rgb),
    .video_hsync    (video_hs), 
    .video_vsync    (video_vs),
    .video_de       (video_de),
                
    .tmds_data0     (tmds_data0),
    .tmds_data1     (tmds_data1),
    .tmds_data2     (tmds_data2),
    .tmds_clk       (tmds_clk  ),
    .tmds_oen       (tmds_oen  )           
    );

endmodule 