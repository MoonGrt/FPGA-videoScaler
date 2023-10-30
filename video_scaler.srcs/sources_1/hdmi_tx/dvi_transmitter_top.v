module dvi_transmitter_top(
    input        pclk,           // pixel clock
    input        rst_n,          // reset
    
    input [23:0] video_din,      // RGB888 video in
    input        video_hsync,    // hsync data
    input        video_vsync,    // vsync data
    input        video_de,       // data enable
    
    output [9:0] tmds_data0,
    output [9:0] tmds_data1,
    output [9:0] tmds_data2,
    output [9:0] tmds_clk,
    output       tmds_oen       // TMDS 输出使能
    );
    
//wire define    
wire        reset;

//*****************************************************
//**                    main code
//***************************************************** 
assign tmds_oen = 1'b1;  
assign tmds_clk = 10'b1111100000;

//异步复位，同步释放
asyn_rst_syn reset_syn(
    .rst_n      (rst_n),
    .clk        (pclk),
    .syn_reset  (reset)    //高有效
    );
  
//对三个颜色通道进行编码
dvi_encoder encoder_b (
    .clkin      (pclk),
    .rstin	    (reset),
    .din        (video_din[7:0]),
    .c0			(video_hsync),
    .c1			(video_vsync),
    .de			(video_de),
    .dout		(tmds_data0)
    ) ;

dvi_encoder encoder_g (
    .clkin      (pclk),
    .rstin	    (reset),
    .din		(video_din[15:8]),
    .c0			(1'b0),
    .c1			(1'b0),
    .de			(video_de),
    .dout		(tmds_data1)
    ) ;
    
dvi_encoder encoder_r (
    .clkin      (pclk),
    .rstin	    (reset),
    .din		(video_din[23:16]),
    .c0			(1'b0),
    .c1			(1'b0),
    .de			(video_de),
    .dout		(tmds_data2)
    ) ;
  
endmodule