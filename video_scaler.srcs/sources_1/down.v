`timescale 1ns / 1ps
//scale down

module down
//   (input wire clk,
//    input wire clk_2x,
//    input wire rst_n)
    ;

parameter H_SYNC  = 12'd41  ;
parameter H_BACK  = 12'd2   ;
parameter H_DISP  = 12'd480 ;
parameter H_FRONT = 12'd2   ;
parameter H_TOTAL = 12'd525 ;
parameter V_SYNC  = 12'd10  ;
parameter V_BACK  = 12'd2   ;
parameter V_DISP  = 12'd272 ;
parameter V_FRONT = 12'd2   ;
parameter V_TOTAL = 12'd286 ;

parameter START_X = H_DISP / 4;
parameter START_Y = V_DISP / 4;
parameter END_X = H_DISP * 3 / 4;
parameter END_Y = V_DISP * 3 / 4;

parameter INPUT_X_RES = H_DISP - 1;
parameter INPUT_Y_RES = V_DISP - 1;
parameter OUTPUT_X_RES = H_DISP / 2 - 1;     //Output resolution - 1
parameter OUTPUT_Y_RES = V_DISP / 2 - 1;     //Output resolution - 1
//parameter X_SCALE = 32'h4000 * (INPUT_X_RES) / (OUTPUT_X_RES) - 1;
//parameter Y_SCALE = 32'h4000 * (INPUT_Y_RES) / (OUTPUT_Y_RES) - 1;
parameter X_SCALE = 32'h4000 * (INPUT_X_RES + 1) / (OUTPUT_X_RES + 1);
parameter Y_SCALE = 32'h4000 * (INPUT_Y_RES + 1) / (OUTPUT_Y_RES + 1);

parameter DATA_WIDTH = 8;
parameter CHANNELS = 3;
parameter DISCARD_CNT_WIDTH = 8;
parameter INPUT_X_RES_WIDTH = 11;
parameter INPUT_Y_RES_WIDTH = 11;
parameter OUTPUT_X_RES_WIDTH = 11;
parameter OUTPUT_Y_RES_WIDTH = 11;
parameter BUFFER_SIZE = 3;			 //Number of RAMs in RAM ring buffer

// port declaration
reg clk = 0, clk_2x = 0, clk_5x = 0;
reg rst_n = 0;

initial // Clock generator
begin
    forever #5 clk = ~clk;
end

initial // Clock generator
begin
    forever #2.5 clk_2x = ~clk_2x;
end

initial // Clock generator
begin
    forever #1 clk_5x = ~clk_5x;
end

initial
begin
    #100 rst_n = 1'b1;
end

//reg nextDout = 0;
////Generate nextDout request signal
//initial
//begin
//    nextDout = 0;
//    #435_000
//    nextDout = 1;
//    forever
//    begin
//    	//This can be used to slow down the read to simulate live read-out. This basically inserts H blank periods.
//    	#(10*(OUTPUT_X_RES+1)*2)
//    	nextDout = 0;
//    	#(10*(OUTPUT_X_RES+1))
//    	nextDout = 1;
//    end
//end

wire hs_i,vs_i,de_i;
wire [DATA_WIDTH*CHANNELS-1:0] rgb;
//wire [DATA_WIDTH*CHANNELS-1:0] image_cut_rgb;
//wire image_cut_de, image_cut_vs;
wire [DATA_WIDTH*CHANNELS-1:0] fifo1_data;
wire fifo1_empty, fifo1_full;
wire fifo1_dataValid;
wire [DATA_WIDTH*CHANNELS-1:0] scaler_data;
wire scaler_dataValid, scaler_re;

color_bar  color_bar (
    .clk     ( clk_2x   ),
    .rst     ( ~rst_n ),

    .hs      ( hs_i ),
    .vs      ( vs_i ),
    .de      ( de_i ),
    .rgb_r   ( rgb[23:16]),
    .rgb_g   ( rgb[15:8] ),
    .rgb_b   ( rgb[7:0] )
);

//image_cut #(
//    .H_DISP ( H_DISP ),
//    .V_DISP ( V_DISP ))
//image_cut (
//    .clk     ( clk     ),
//    .start_x ( START_X ),
//    .start_y ( START_Y ),
//    .end_x   ( END_X   ),
//    .end_y   ( END_Y   ),    
//    .hs_i    ( ~hs_i   ),
//    .vs_i    ( ~vs_i   ),
//    .de_i    (  de_i   ),
//    .rgb_i   ( {rgb_r, rgb_g, rgb_b} ),

//    .de_o    ( image_cut_de  ),
//    .vs_o    ( image_cut_vs  ),
//    .rgb_o   ( image_cut_rgb ) 
//);

/*
fifo #(
    .DW(24),
    .AW(8))
fifo(
    .clk_w      (clk),
    .clk_r      (clk_2x),
    .rst_n      (rst_n),
    .we         (image_cut_de),
    .re         (scaler_re),
    .din        (image_cut_rgb),
    .dout       (fifo1_data),
    .doutValid  (fifo1_dataValid),
    .empty      (fifo1_empty),
    .full       (fifo1_full)
);
*/

fifo2#(
    .data_width(24),
    .data_depth(1024),
    .addr_width(10)
)
fifo1(
    .rst        (~rst_n),
    .wr_clk     (clk_2x),
    .wr_en      (de_i),
    .din        (rgb),
    .rd_clk     (clk_2x),
    .rd_en      (scaler_re),
    .valid      (fifo1_dataValid),
    .dout       (fifo1_data),
    .empty      (fifo1_empty),
    .full       (fifo1_full)
    );


//640x512 to 1280x1024
streamScaler #(
    .DATA_WIDTH( DATA_WIDTH ),
    .CHANNELS( CHANNELS ),
    .DISCARD_CNT_WIDTH( DISCARD_CNT_WIDTH ),
    .INPUT_X_RES_WIDTH( INPUT_X_RES_WIDTH ),
    .INPUT_Y_RES_WIDTH( INPUT_Y_RES_WIDTH ),
    .OUTPUT_X_RES_WIDTH( OUTPUT_X_RES_WIDTH ),
    .OUTPUT_Y_RES_WIDTH( OUTPUT_Y_RES_WIDTH ),
    .BUFFER_SIZE( BUFFER_SIZE )				//Number of RAMs in RAM ring buffer
) scaler_inst (
    .clk        ( clk_2x ),
//    .rst        ( ~rst_n ),
    
    .dIn        ( fifo1_data ),
    .dInValid   ( fifo1_dataValid ),
    .nextDin    ( scaler_re ),
    .start      ( vs_i ),
    
    .dOut       ( scaler_data ),
    .dOutValid  ( scaler_dataValid ),
//    .nextDout   ( nextDout ),
    .nextDout   ( 1 ),
    
    //Control
    .inputDiscardCnt    ( 0 ),	             //Number of input pixels to discard before processing data. Used for clipping
    .inputXRes          ( INPUT_X_RES ),	 //Input data number of pixels per line
    .inputYRes          ( INPUT_Y_RES ),
    .outputXRes         ( OUTPUT_X_RES ),	 //Resolution of output data
    .outputYRes         ( OUTPUT_Y_RES ),
    .xScale             ( X_SCALE ),		 //Scaling factors. Input resolution scaled by 1/xScale. Format Q4.14
    .yScale             ( Y_SCALE ),		 //Scaling factors. Input resolution scaled by 1/yScale. Format Q4.14
    .leftOffset         ( 0 ),
    .topFracOffset      ( 0 ),
    .nearestNeighbor    ( 0 )
);




//wire [7:0] y_444, cb_444, cr_444;
//wire rgb2yuv_Valid, rgb2yuv_vs;

//rgb_to_ycbcr u_rgb_to_ycbcr(
///*i*/.clk				(clk_2x),
///*i*/.i_r_8b			(scaler_data[23:16]),
///*i*/.i_g_8b			(scaler_data[15:8]),
///*i*/.i_b_8b			(scaler_data[7:0]),

///*i*/.i_h_sync			(),
///*i*/.i_v_sync			(image_cut_vs),
///*i*/.i_data_en			(scaler_dataValid),

///*o*/.o_y_8b			(y_444),
///*o*/.o_cb_8b			(cb_444),
///*o*/.o_cr_8b			(cr_444),
///*o*/.o_h_sync			(),
///*o*/.o_v_sync			(rgb2yuv_vs),                                                                                                  
///*o*/.o_data_en         (rgb2yuv_Valid)                                                                                       
//);

//pixel_cnt pixel_cnt(
//    .clk    (clk_2x),
//    .de     (scaler_dataValid)
//    );





// read_image Parameters
parameter PERIOD         = 10      ;
parameter ADDRESS_WIDTH  = 21      ;

wire [DATA_WIDTH*CHANNELS-1:0] fifo2_data;
wire fifo2_dataValid, fifo2_empty, fifo2_full;
wire read_en, read_vs, read_hs, read_de;
wire [DATA_WIDTH*CHANNELS-1:0] read_imagedata;
wire [9:0] tmds_data0,tmds_data1,tmds_data2;
wire tmds_clk,tmds_oen;
/*
fifo #(
    .DW(24),
    .AW(12))
fifo2(
    .clk_w      (clk_2x),
    .clk_r      (clk),
    .rst_n      (rst_n),
    .we         (scaler_dataValid),
    .re         (read_en),
    .din        (scaler_data),
    .dout       (fifo2_data),
    .doutValid  (fifo2_dataValid),
    .empty      (fifo2_empty),
    .full       (fifo2_full)
);
*/

fifo2#(
    .data_width(24),
    .data_depth(2048),
    .addr_width(11)
)
fifo2(
    .rst        (~rst_n),
    .wr_clk     (clk_2x),
    .wr_en      (scaler_dataValid),
    .din        (scaler_data),
    .rd_clk     (clk),
    .rd_en      (read_en),
    .valid      (fifo2_dataValid),
    .dout       (fifo2_data),
    .empty      (fifo2_empty),
    .full       (fifo2_full)
    );


read_image #(
    .DATA_WIDTH    ( DATA_WIDTH*CHANNELS ),
//    .ADDRESS_WIDTH ( ADDRESS_WIDTH ),
    .H_SYNC        ( H_SYNC        ),
    .H_BACK        ( H_BACK        ),
    .H_DISP        ( H_DISP        ),
    .H_FRONT       ( H_FRONT       ),
    .H_TOTAL       ( H_TOTAL       ),
    .V_SYNC        ( V_SYNC        ),
    .V_BACK        ( V_BACK        ),
    .V_DISP        ( V_DISP        ),
    .V_FRONT       ( V_FRONT       ),
    .V_TOTAL       ( V_TOTAL       ))
 read_image (
    .clk                     ( clk   ),
    .rst_n                   ( rst_n ),
    .data                    ( fifo2_data ),
    .read_en                 ( read_en ),
    .hsync                   ( read_hs ),
    .vsync                   ( read_vs ),
    .de                      ( read_de ),

    .rgb                     (read_imagedata)
);

//Àý»¯HDMIÇý¶¯Ä£¿é
dvi_transmitter_top dvi_transmitter_top(
    .pclk           (clk),
    .rst_n          (rst_n),
                
    .video_din      (read_imagedata),
    .video_hsync    (read_hs), 
    .video_vsync    (read_vs),
    .video_de       (read_de),
                
    .tmds_data0     (tmds_data0),
    .tmds_data1     (tmds_data1),
    .tmds_data2     (tmds_data2),
    .tmds_clk       (tmds_clk  ),
    .tmds_oen       (tmds_oen  )           
    );
    
endmodule
