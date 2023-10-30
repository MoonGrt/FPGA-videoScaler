//`include "ddr3_controller.vh"

////`define Efinity_Debug
////`define AXI_FULL_DEPLEX
//module example_top
//(

//input jtag_inst1_CAPTURE,
//input jtag_inst1_DRCK,
//input jtag_inst1_RESET,
//input jtag_inst1_RUNTEST,
//input jtag_inst1_SEL,
//input jtag_inst1_SHIFT,
//input jtag_inst1_TCK,
//input jtag_inst1_TDI,
//input jtag_inst1_TMS,
//input jtag_inst1_UPDATE,
//output jtag_inst1_TDO,
//// clk interface
//input sys_clk,
//input osc_clk,
//output osc_en,

//// hdmi interface
//output [2:0] hdmi_tx_data_n_HI,
//  output [2:0] hdmi_tx_data_n_LO,
//  output [2:0] hdmi_tx_data_p_HI,
//  output [2:0] hdmi_tx_data_p_LO,
//  output hdmi_tx_clk_n_HI,
//  output hdmi_tx_clk_n_LO,
//  output hdmi_tx_clk_p_HI,
//  output hdmi_tx_clk_p_LO,
  
//  input 			hdmi_rx_fast_clk,
//  input 			hdmi_rx_slow_clk,
//  input       hdmi_tx_fast_clk,
//  input 			hdmi_rx_clk_RX_DATA,
//  input [9:0] hdmi_rx_d0_RX_DATA,
//  input [9:0] hdmi_rx_d1_RX_DATA,
//  input [9:0] hdmi_rx_d2_RX_DATA,
//  output 			hdmi_rx_clk_RX_ENA,
//  output 			hdmi_rx_d0_RX_RST,
//  output 			hdmi_rx_d0_RX_ENA,
//  output 			hdmi_rx_d1_RX_RST,
//  output 			hdmi_rx_d1_RX_ENA,
//  output 			hdmi_rx_d2_RX_RST,
//  output 			hdmi_rx_d2_RX_ENA,   
//  input hdmi_rx_pll_LOCKED ,
//  output hdmi_rx_pll_RSTN,
//  output 	HPD_N,
//  input 	HDMI_5V_N,
//  input 	FPGA_HDMI_SCL_IN,
//  input 	FPGA_HDMI_SDA_IN,
//  output 	FPGA_HDMI_SCL_OUT,
//  output 	FPGA_HDMI_SCL_OE,
//  output 	FPGA_HDMI_SDA_OUT,
//  output 	FPGA_HDMI_SDA_OE,

////ddr3
// output DDR3_PLL_RSTN,
//  output SYS_PLL_RSTN,
//  input DDR3_PLL_LOCK,
//  input SYS_PLL_LOCK,

//input core_clk,
//input twd_clk,
//input tdqss_clk,
//input tac_clk,


//output reset,
//output cs,
//output ras,
//output cas,
//output we,
//output cke,
//output [15:0]addr,
//output [2:0]ba,
//output odt,
//output [`DRAM_GROUP-1'b1:0] o_dm_hi,
//output [`DRAM_GROUP-1'b1:0] o_dm_lo,

//input [`DRAM_GROUP-1'b1:0]i_dqs_hi,
//input [`DRAM_GROUP-1'b1:0]i_dqs_lo,

//input [`DRAM_GROUP-1'b1:0]i_dqs_n_hi,
//input [`DRAM_GROUP-1'b1:0]i_dqs_n_lo,


//output [`DRAM_GROUP-1'b1:0]o_dqs_hi,
//output [`DRAM_GROUP-1'b1:0]o_dqs_lo,

//output [`DRAM_GROUP-1'b1:0]o_dqs_n_hi,
//output [`DRAM_GROUP-1'b1:0]o_dqs_n_lo,


//output [`DRAM_GROUP-1'b1:0]o_dqs_oe,
//output [`DRAM_GROUP-1'b1:0]o_dqs_n_oe,

//input [`DRAM_WIDTH-1'b1:0] i_dq_hi,
//input [`DRAM_WIDTH-1'b1:0] i_dq_lo,

//output [`DRAM_WIDTH-1'b1:0] o_dq_hi,
//output [`DRAM_WIDTH-1'b1:0] o_dq_lo,

//output [`DRAM_WIDTH-1'b1:0] o_dq_oe,

//output [2:0]			shift,
//output [4:0]			shift_sel,
//output 					shift_ena,

//// led 
//	input nrst,
//	input clk_10m,
//	output [1:0] b_led,
//	input uart_rx,
//  	output uart_tx,

//// lcd
//input	wire	i_sysclk_div_2					,	
//input	wire	i_mipi_tx_pclk					,
//input	wire	i_mipi_tx_pll_locked			,
//output	wire	o_lcd_rstn						,
//output	wire	o_mipi_pll_rstn					,

//output	wire	mipi_dp_clk_LP_P_OUT			,
//output	wire	mipi_dp_clk_LP_N_OUT			,
//output	wire	[7:0] 	mipi_dp_clk_HS_OUT		,
//output	wire	mipi_dp_clk_HS_OE				,
//output	wire	mipi_dp_data3_LP_P_OUT			,
//output	wire	mipi_dp_data2_LP_P_OUT			,
//output	wire	mipi_dp_data1_LP_P_OUT			,
//output	wire	mipi_dp_data0_LP_P_OUT			,
//output	wire	mipi_dp_data3_LP_N_OUT			,
//output	wire	mipi_dp_data2_LP_N_OUT			,
//output	wire	mipi_dp_data1_LP_N_OUT			,
//output	wire	mipi_dp_data0_LP_N_OUT			,
//output	wire	[7:0] 	mipi_dp_data0_HS_OUT	,
//output	wire	[7:0] 	mipi_dp_data1_HS_OUT	,
//output	wire	[7:0] 	mipi_dp_data2_HS_OUT	,
//output	wire	[7:0] 	mipi_dp_data3_HS_OUT	,
//output	wire	mipi_dp_data3_HS_OE				,
//output	wire	mipi_dp_data2_HS_OE				,
//output	wire	mipi_dp_data1_HS_OE				,
//output	wire	mipi_dp_data0_HS_OE				,

//output	wire	mipi_dp_clk_RST					,
//output	wire	mipi_dp_data0_RST				,
//output	wire	mipi_dp_data1_RST				,
//output	wire	mipi_dp_data2_RST				,
//output	wire	mipi_dp_data3_RST				,
//output	wire	mipi_dp_clk_LP_P_OE				,
//output	wire	mipi_dp_clk_LP_N_OE				,
//output	wire	mipi_dp_data3_LP_P_OE			,
//output	wire	mipi_dp_data3_LP_N_OE			,
//output	wire	mipi_dp_data2_LP_P_OE			,
//output	wire	mipi_dp_data2_LP_N_OE			,
//output	wire	mipi_dp_data1_LP_P_OE			,
//output	wire	mipi_dp_data1_LP_N_OE			,
//output	wire	mipi_dp_data0_LP_P_OE			,
//output	wire	mipi_dp_data0_LP_N_OE			,

//input  	wire	mipi_dp_data0_LP_P_IN			,
//input  	wire	mipi_dp_data0_LP_N_IN			,
//output  wire    LCD_POWER				

//);
////=====================================================================
//////Define  Parameter
////=====================================================================

//  /////////////   
//  	parameter   AXI_DATA_WIDTH    = 128               ; //AXI Data Width(Bit)
  
//  	parameter   DDR_WRITE_FIRST   = 1'h1              ; //1:Write First ; 0: Read First   
//  	parameter   AXI_ID_WIDTH    =   8         ;
//   //Define  Parameter
//  /////////////////////////////////////////////////////////                                
	
//	localparam   AXI0_WR_ID        = 8'haa           ; //AXI Write ID
//	localparam   AXI0_RD_ID        = 8'h55           ; //AXI Read ID	
		  	
//	localparam   AXI_ADDR_WIDTH 	= 32;//Address Width      
//	localparam   S_COUNT 					= 1;                          
//	localparam   M_COUNT 					= 1;                          
//	localparam   AXI_SW 					= AXI_DATA_WIDTH/8;//Write Strobes Width     
	
//	localparam H_PRE_PORCH   	= 13'd88 	;//	
//	localparam H_SYNC 	 		= 13'd44 	;//
//	localparam H_VALID 	 	  	= 13'd1920;//
//	localparam H_BACK_PORCH  	= 13'd148 ;// 	
//	localparam V_PRE_PORCH   	= 13'd4 	;//	
//	localparam V_SYNC 	 	    = 13'd5 	;//
//	localparam V_VALID 	 	  	= 13'd1080 ;//
//	localparam V_BACK_PORCH  	= 13'd36 	;//	

//  /////////////                 
////=========================================================================
////signal define
////=========================================================================
//  /////////////////////////////////////////////////////////
//  /////////////////////////////////////////////////////////
//  reg           Ddr_Ready       = 1'h0  ;
//  /////////////////////////////////////////////////////////
//wire 					cal_done;
//wire 					cal_pass;

//wire    [S_COUNT*AXI_ID_WIDTH-1:0]  	axi_m_awid;        //
//wire    [S_COUNT*AXI_ADDR_WIDTH-1:0]	axi_m_awaddr;
//wire    [S_COUNT*8-1:0]         		axi_m_awlen;
//wire    [S_COUNT*3-1:0]         		axi_m_awsize;
//wire    [S_COUNT*2-1:0]         		axi_m_awburst;
//wire    [S_COUNT-1:0]           		axi_m_awlock;
//wire    [S_COUNT*4-1:0]         		axi_m_awcache;
//wire    [S_COUNT*3-1:0]         		axi_m_awprot;
//wire    [S_COUNT-1:0]           		axi_m_awvalid;
//wire    [S_COUNT-1:0]           		axi_m_awready;
//wire	[S_COUNT*AXI_ID_WIDTH-1:0]		axi_m_wid;
//wire    [S_COUNT*AXI_DATA_WIDTH-1:0]	axi_m_wdata;
//wire    [S_COUNT*AXI_SW-1:0]    		axi_m_wstrb;
//wire    [S_COUNT-1:0]           		axi_m_wlast;
//wire    [S_COUNT-1:0]           		axi_m_wvalid;
//wire    [S_COUNT-1:0]           		axi_m_wready;
//wire    [S_COUNT*AXI_ID_WIDTH-1:0]  	axi_m_bid;
//wire    [S_COUNT*2-1:0]         		axi_m_bresp;
//wire    [S_COUNT-1:0]           		axi_m_bvalid;
//wire    [S_COUNT-1:0]           		axi_m_bready;
//wire    [S_COUNT*AXI_ID_WIDTH-1:0]  	axi_m_arid;
//wire    [S_COUNT*AXI_ADDR_WIDTH-1:0]	axi_m_araddr;
//wire    [S_COUNT*8-1:0]         		axi_m_arlen;
//wire    [S_COUNT*3-1:0]         		axi_m_arsize;
//wire    [S_COUNT*2-1:0]         		axi_m_arburst;
//wire    [S_COUNT-1:0]           		axi_m_arlock;
//wire    [S_COUNT-1:0]           		axi_m_arvalid;
//wire    [S_COUNT-1:0]           		axi_m_arready;
//wire    [S_COUNT*AXI_ID_WIDTH-1:0]  	axi_m_rid;
//wire    [S_COUNT*AXI_DATA_WIDTH-1:0]	axi_m_rdata;
//wire    [S_COUNT*2-1:0]         		axi_m_rresp;
//wire    [S_COUNT-1:0]           		axi_m_rlast;
//wire    [S_COUNT-1:0]           		axi_m_rvalid;
//wire    [S_COUNT-1:0]          			axi_m_rready;// 

////==============================================================================
////reset porcess module
////==============================================================================
// assign DDR3_PLL_RSTN = nrst;
// assign SYS_PLL_RSTN = nrst;

// reg   [3:0]   Reset_Cnt     = 4'h0  ;
// wire          DdrResetCtrl  ;
// wire		   Sys_Rst_N	;
// wire  		   w_rst_n;
//assign w_rst_n = DDR3_PLL_LOCK & SYS_PLL_LOCK ;

//  rst_n_piple # (
//    .DLY(3)
//  )
//  rst_n_piple_inst (
//    .clk(sys_clk ),
//    .rst_n_i(w_rst_n ),
//    .rst_n_o(Sys_Rst_N)
//  );

//  wire    rst_n = Sys_Rst_N;


//  assign osc_en = 1'b1;
//	reg [25:0] cnt = 'd0;
//  always @( posedge sys_clk )
//  begin
//		cnt <= cnt + 1'b1;
		
//  end
//  assign b_led[0] = cnt[25];
//  assign b_led[1] = cal_done & cal_pass  ? cnt[25]:1'b0;
////=====================================================================================
////hdmi demo
////=====================================================================================
//wire                            video_hs;
//wire                            video_vs;
//wire                            video_de;
//wire[7:0]                       video_r;
//wire[7:0]                       video_g;
//wire[7:0]                       video_b;


//wire 			                      rx_hsync;	
//wire 			                      rx_vsync;	
//wire 			                      rx_de	 ;  
//wire [7:0]                      rdata_in;	
//wire [7:0]                      gdata_in;	
//wire [7:0]                      bdata_in;

//	  wire 			ch0_hs_o	;		
//	  wire 			ch0_vs_o	;		 
//	  wire 			ch0_de_o	;		
//	  wire [7:0] 	ch0_rdata	;
//	  wire [7:0] 	ch0_gdata	;
//	  wire [7:0] 	ch0_bdata	;
//	  wire [7:0] 	ch0_zero	;

//	  wire [7:0] 	ch0_y;
//	  wire [7:0]    ch0_c;
//	  wire ch0_vs;
//	  wire ch0_hs;
//	  wire ch0_de;
//	  wire [7:0] y_444		;
//	wire [7:0] cb_444		;
//	wire [7:0] cr_444		;
//	wire 		 h_sync_444	;
//	wire 		 v_sync_444	;
//	wire 		 de_444		;

//	wire [7:0] y_422		;
//	wire [7:0] c_422		;
//	wire 		 h_sync_422	;
//	wire 		 v_sync_422	;
//	wire 		 de_422		;

//	wire 	ch0_v_sync_444;
//	wire 	ch0_h_sync_444;
//	wire 		ch0_de_444	;	
//	wire [7:0]	ch0_y_444	;	
//	wire [7:0]	ch0_cb_444	;	
//	wire  [7:0]	ch0_cr_444	;	

//assign hdmi_rx_clk_RX_ENA = 1'b1;

//assign hdmi_rx_d0_RX_ENA = 1'b1; 
//assign hdmi_rx_d1_RX_ENA = 1'b1;  
//assign hdmi_rx_d2_RX_ENA = 1'b1; 
 

//assign hdmi_rx_d0_RX_RST = 1'b0; 
//assign hdmi_rx_d1_RX_RST = 1'b0;
//assign hdmi_rx_d2_RX_RST = 1'b0;  



////================================================
////
////================================================
//reg [22:0] wait_cnt;
//wire hdmi_rst_n ;
////hdmi_rx_pll_LOCKED
//always @( posedge osc_clk )
//begin
//		if( ~HPD_N )
//				if( wait_cnt[22])
//						wait_cnt <= wait_cnt;
//				else
//						wait_cnt <= wait_cnt + 1'b1;
//		else
//				wait_cnt <= 0;
//end 

//  assign  hdmi_rx_pll_RSTN   = wait_cnt[22];

//  rst_n_piple # (
//    .DLY(3)
//  )
//  rst_n_hdmi_rx_slow_clk (
//    .clk(hdmi_rx_slow_clk ),
//    .rst_n_i( hdmi_rx_pll_LOCKED),
//    .rst_n_o(hdmi_rst_n)
//  );


//	hdmi_rx u_hdmi_rx(
// /*i*/.cfg_clk(osc_clk),
// /*i*/.rst_n  (rst_n),
// /*i*/.hdmi_rx_5v_n(HDMI_5V_N),
// /*o*/.hdmi_rx_hpd_n(HPD_N),
// 	/*i*/.scl_i		(FPGA_HDMI_SCL_IN), 
//	/*o*/.scl_o		(FPGA_HDMI_SCL_OUT), 
//	/*o*/.scl_oe	(FPGA_HDMI_SCL_OE),    
//	/*i*/.sda_i		(FPGA_HDMI_SDA_IN), 
//	/*o*/.sda_o		(FPGA_HDMI_SDA_OUT), 
//	/*o*/.sda_oe	(FPGA_HDMI_SDA_OE) 
//);    
//dvi_decoder u_dvi_decoder(                                                        

///*i*/.pclk          (hdmi_rx_slow_clk),         // double rate pixel clock                
///*i*/.bdata        	(~hdmi_rx_d0_RX_DATA),       // Blue data in                           
///*i*/.gdata       	(~hdmi_rx_d1_RX_DATA),       // Green data in                          
///*i*/.rdata         (~hdmi_rx_d2_RX_DATA),       // Red data in                            
///*i*/.rst_n         (hdmi_rst_n          ),      // external reset input, e.g. reset button
///*o*/.reset         (					),        // rx reset                               
///*o*/.hsync         (rx_hsync	),                // hsync data                             
///*o*/.vsync         (rx_vsync	),                // vsync data                             
///*o*/.de            (rx_de		),                // data enable                            
///*o*/.red           (rdata_in	),                // pixel data out                         
///*o*/.green         (gdata_in	),                // pixel data out                         
///*o*/.blue          (bdata_in	)                 // pixel data out                         
                                                                                
//   );    // pixel data out   
          
////==================================================================
////
////==================================================================

///*
//	  color_bar color_bar_m0(
//	.clk(hdmi_rx_slow_clk),
//	.rst(~rst_n),
//	.hs(video_hs),
//	.vs(video_vs),
//	.de(video_de),
//	.rgb_r(video_r),
//	.rgb_g(video_g),
//	.rgb_b(video_b)
//);*/

//dvi_encoder dvi_encoder_m0
//(
//	.pixelclk      (hdmi_rx_slow_clk          ),// system clock
//	.pixelclk5x    (hdmi_tx_fast_clk        ),// system clock x5
//	.rstin         (~rst_n             ),// reset
//	.blue_din      (ch0_bdata	),//(bdata_in	),    //   (video_b            ),//
//	.green_din     (ch0_gdata	),//(gdata_in	),    //(video_g            ),//   
//	.red_din       (ch0_rdata	),//(rdata_in	),    //(video_r            ),//   
//	.hsync         (ch0_hs_o	),//(rx_hsync	),    //(video_hs           ),//   
//	.vsync         (ch0_vs_o	),//(rx_vsync	),    // (video_vs           ),//  
//	.de            (ch0_de_o	),//(rx_de		),      // (video_de           ),//

//	.data_p_h	(hdmi_tx_data_p_HI),
//	.data_p_l	(hdmi_tx_data_p_LO),
//	.clk_p_h 	(hdmi_tx_clk_p_HI ),
//	.clk_p_l 	(hdmi_tx_clk_p_LO ),
//	.data_n_h	(hdmi_tx_data_n_HI),
//	.data_n_l	(hdmi_tx_data_n_LO),
//	.clk_n_h 	(hdmi_tx_clk_n_HI ),
//	.clk_n_l 	(hdmi_tx_clk_n_LO )
//);

////=======================================================================
////DDR3 soft Controller
////=======================================================================
//parameter START_ADDR = 32'h000000;
//parameter END_ADDR = 32'h1ffffff;
// wire [7:0] m_aid_0;
//	  wire [31:0] m_aaddr_0;
//	  wire [7:0]  m_alen_0;
//	  wire [2:0]  m_asize_0;
//	  wire [1:0]  m_aburst_0;
//	  wire [1:0]  m_alock_0;
//	  wire		m_avalid_0;
//	  wire		m_aready_0;
	  
//	  wire		m_atype_0;
//	  wire [7:0]  m_wid_0;
//	  wire [127:0] m_wdata_0;
//	  wire [15:0]	m_wstrb_0;
//	  wire		m_wlast_0;
//	  wire		m_wvalid_0;
//	  wire		m_wready_0;
//	  wire [3:0] m_rid_0;
//	  wire [127:0] m_rdata_0;
//	  wire		m_rlast_0;
//	  wire		m_rvalid_0;
//	  wire		m_rready_0;
//	  wire [1:0] m_rresp_0;
//	  wire [7:0] m_bid_0;
//	  wire [1:0] m_bresp_0;
//	  wire		m_bvalid_0;
//	  wire		m_bready_0;

	  




//  always @( posedge sys_clk or negedge Sys_Rst_N)
//  begin
//		if( !Sys_Rst_N )
//			Ddr_Ready <= 1'b0;
//		else if( cal_done & cal_pass )	
//			Ddr_Ready <= 1'b1;
//  end	

///* memory_checker_axi #(
//	  .START_ADDR(START_ADDR),
//	  .STOP_ADDR(END_ADDR),
//	  .ALEN(7),
//	  .WIDTH(128)
//	  ) memcheck_0 (
//	  .axi_clk(sys_clk),
//	  .rstn(Sys_Rst_N),
//	  .start(cal_done),
//	  .aid(m_aid_0),
//	  .aaddr(m_aaddr_0),
//	  .alen(m_alen_0),
//	  .asize(m_asize_0),
//	  .aburst(m_aburst_0),
//	  .alock(m_alock_0),
//	  .avalid(m_avalid_0),
//	  .aready(m_aready_0),
//	  .atype(m_atype_0),
//	  .wid(m_wid_0),
//	  .wdata(m_wdata_0),
//	  .wstrb(m_wstrb_0),
//	  .wlast(m_wlast_0),
//	  .wvalid(m_wvalid_0),
//	  .wready(m_wready_0),
//	  .rid(m_rid_0),
//	  .rdata(m_rdata_0),
//	  .rlast(m_rlast_0),
//	  .rvalid(m_rvalid_0),
//	  .rready(m_rready_0),
//	  .rresp(m_rresp_0),
//	  .bid(m_bid_0),
//	  .bvalid(m_bvalid_0),
//	  .bready(m_bready_0),
//	  .pass(pass),
//	  .done(done)
//	  ); */

//efx_ddr3_axi inst_ddr3_axi
//	  (	
//	  	.core_clk		(core_clk),
//		.tac_clk		(tac_clk),
//		.twd_clk		(twd_clk),	
//		.tdqss_clk	(tdqss_clk),
			
//		.axi_clk	(sys_clk 		),
//		.nrst		(Sys_Rst_N		),
	  
	  	
//	  	.reset		( reset           ) ,           
//		.cs			( cs              ) ,              
//		.ras		( ras             ) ,              
//		.cas		( cas             ) ,              
//		.we			( we              ) ,              
//		.cke		( cke             ) ,              
//		.addr		( addr            ) ,              
//		.ba			( ba              ) ,              
//		.odt		( odt             ) ,              
//		.o_dm_hi	( o_dm_hi         ) ,                 
//		.o_dm_lo	( o_dm_lo         ) ,                 
//		.i_dq_hi	( i_dq_hi         ) ,                    
//		.i_dq_lo	( i_dq_lo         ) ,                    							
//		.o_dq_hi	(o_dq_hi),                  
//		.o_dq_lo	(o_dq_lo),                  
//		.o_dq_oe	(o_dq_oe),                  
//		.i_dqs_hi	( i_dqs_hi        ) ,          
//		.i_dqs_lo	( i_dqs_lo        ) ,          
//		.i_dqs_n_hi	(i_dqs_n_hi			),            
//		.i_dqs_n_lo	(i_dqs_n_lo		),            
//		.o_dqs_hi	(o_dqs_hi		),
//		.o_dqs_lo	(o_dqs_lo		),
//		.o_dqs_n_hi	(o_dqs_n_hi		),
//		.o_dqs_n_lo	(o_dqs_n_lo		),
//		.o_dqs_oe	(o_dqs_oe		),
//		.o_dqs_n_oe	(o_dqs_n_oe		),
	  	
//	  	//TO Tester
//	  	.i_avalid(m_avalid_0),
//	  	.o_aready(m_aready_0),
//	  	.i_aaddr(m_aaddr_0),
//	  	.i_aid(m_aid_0),
//	  	.i_alen(m_alen_0),
//	  	.i_asize(m_asize_0),
//	  	.i_aburst(m_aburst_0),
//	  	.i_alock(m_alock_0),
//	  	.i_atype(m_atype_0),
	  	
//	  	.i_wid(m_wid_0),
//	  	.i_wvalid(m_wvalid_0),
//	  	.o_wready(m_wready_0),
//	  	.i_wdata(m_wdata_0),
//	  	.i_strb(m_wstrb_0),
//	  	.i_wlast(m_wlast_0),
	  	
//	  	.o_bvalid(m_bvalid_0),
//	  	.i_bready(m_bready_0),
//	  	.o_bid(m_bid_0),
	  	
//	  	.o_rvalid(m_rvalid_0),
//	  	.i_rready(m_rready_0),
//	  	.o_rdata(m_rdata_0),
//	  	.o_rid(m_rid_0),
//	  	.o_rresp(m_rresp_0),
//	  	.o_rlast(m_rlast_0),
	  
//	  	.shift(shift),
//	  	.shift_sel(shift_sel),
//	  	.shift_ena(shift_ena),
//	  	.cal_ena(1'b1),
//	  	.cal_done(cal_done),
//	  	.cal_pass(cal_pass)
//	  ); 

//parameter H_DISP = 1920;
//parameter V_DISP = 1080;
//parameter START_X = H_DISP / 4;
//parameter START_Y = V_DISP / 4;
//parameter END_X = H_DISP * 3 / 4;
//parameter END_Y = V_DISP * 3 / 4;

//parameter INPUT_X_RES = H_DISP / 2 - 1;
//parameter INPUT_Y_RES = V_DISP / 2 - 1;
//parameter OUTPUT_X_RES = H_DISP - 1;     //Output resolution - 1
//parameter OUTPUT_Y_RES = V_DISP - 1;     //Output resolution - 1
////parameter X_SCALE = 32'h4000 * (INPUT_X_RES) / (OUTPUT_X_RES) - 1;
////parameter Y_SCALE = 32'h4000 * (INPUT_Y_RES) / (OUTPUT_Y_RES) - 1;
//parameter X_SCALE = 32'h4000 * (INPUT_X_RES + 1) / (OUTPUT_X_RES + 1);
//parameter Y_SCALE = 32'h4000 * (INPUT_Y_RES + 1) / (OUTPUT_Y_RES + 1);

//parameter DATA_WIDTH = 8;
//parameter CHANNELS = 3;
//parameter DISCARD_CNT_WIDTH = 8;
//parameter INPUT_X_RES_WIDTH = 11;
//parameter INPUT_Y_RES_WIDTH = 11;
//parameter OUTPUT_X_RES_WIDTH = 11;
//parameter OUTPUT_Y_RES_WIDTH = 11;
//parameter BUFFER_SIZE = 3;			 //Number of RAMs in RAM ring buffer

//wire [DATA_WIDTH*CHANNELS-1:0] image_cut_rgb;
//wire image_cut_de, image_cut_vs;
//wire [DATA_WIDTH*CHANNELS-1:0] fifo1_data;
//wire fifo1_empty, fifo1_full;
//wire fifo1_dataValid;
//wire [DATA_WIDTH*CHANNELS-1:0] scaler_data;
//wire scaler_dataValid, scaler_re;

//image_cut #(
//    .H_DISP ( H_DISP ),
//    .V_DISP ( V_DISP ))
//image_cut (
//    .clk     ( hdmi_rx_slow_clk     ),
//    .start_x ( START_X ),
//    .start_y ( START_Y ),
//    .end_x   ( END_X   ),
//    .end_y   ( END_Y   ),
//    .hs_i    ( ~rx_hsync   ),
//    .vs_i    ( ~rx_vsync   ),    
//    .de_i    (  rx_de   ),
//    .rgb_i   ( {rdata_in, gdata_in, bdata_in} ),

//    .de_o    ( image_cut_de  ),
//    .vs_o    ( image_cut_vs  ),
//    .rgb_o   ( image_cut_rgb ) 
//);

//fifo2#(
//    .data_width(24),
//    .data_depth(256),
//    .addr_width(8)
//)
//fifo2(
//    .rst        (~hdmi_rst_n),
//    .wr_clk     (hdmi_rx_slow_clk),
//    .wr_en      (image_cut_de),
//    .din        (image_cut_rgb),
//    .rd_clk     (hdmi_rx_slow_clk),
//    .rd_en      (scaler_re),
//    .valid      (fifo1_dataValid),
//    .dout       (fifo1_data),
//    .empty      (fifo1_empty),
//    .full       (fifo1_full)
//    );


////640x512 to 1280x1024
//streamScaler #(
//    .DATA_WIDTH( DATA_WIDTH ),
//    .CHANNELS( CHANNELS ),
//    .DISCARD_CNT_WIDTH( DISCARD_CNT_WIDTH ),
//    .INPUT_X_RES_WIDTH( INPUT_X_RES_WIDTH ),
//    .INPUT_Y_RES_WIDTH( INPUT_Y_RES_WIDTH ),
//    .OUTPUT_X_RES_WIDTH( OUTPUT_X_RES_WIDTH ),
//    .OUTPUT_Y_RES_WIDTH( OUTPUT_Y_RES_WIDTH ),
//    .BUFFER_SIZE( BUFFER_SIZE )				//Number of RAMs in RAM ring buffer
//) scaler_inst (
//    .clk        ( hdmi_rx_slow_clk ),
////    .rst        ( ~rst_n ),
    
//    .dIn        ( fifo1_data ),
//    .dInValid   ( fifo1_dataValid ),
//    .nextDin    ( scaler_re ),
//    .start      ( image_cut_vs ),
    
//    .dOut       ( scaler_data ),
//    .dOutValid  ( scaler_dataValid ),
//    //.nextDout( nextDout ),
//    .nextDout   ( 1 ),
    
//    //Control
//    .inputDiscardCnt    ( 0 ),	             //Number of input pixels to discard before processing data. Used for clipping
//    .inputXRes          ( INPUT_X_RES ),	 //Input data number of pixels per line
//    .inputYRes          ( INPUT_Y_RES ),
//    .outputXRes         ( OUTPUT_X_RES ),	 //Resolution of output data
//    .outputYRes         ( OUTPUT_Y_RES ),
//    .xScale             ( X_SCALE ),		 //Scaling factors. Input resolution scaled by 1/xScale. Format Q4.14
//    .yScale             ( Y_SCALE ),		 //Scaling factors. Input resolution scaled by 1/yScale. Format Q4.14
//    .leftOffset         ( 0 ),
//    .topFracOffset      ( 0 ),
//    .nearestNeighbor    ( 0 )
//);




//		rgb_to_ycbcr u_rgb_to_ycbcr(
//	/*i*/.clk				(hdmi_rx_slow_clk),
//	/*i*/.i_r_8b			(scaler_data[23:16]),
//	/*i*/.i_g_8b			(scaler_data[15:8]),
//	/*i*/.i_b_8b			(scaler_data[7:0]),
	
//	/*i*/.i_h_sync			(),
//	/*i*/.i_v_sync			(image_cut_vs),
//	/*i*/.i_data_en			(scaler_dataValid	 ),
	
//	/*o*/.o_y_8b			(y_444		),
//	/*o*/.o_cb_8b			(cb_444		),
//	/*o*/.o_cr_8b			(cr_444		),
//	/*o*/.o_h_sync			(h_sync_444	),
//	/*o*/.o_v_sync			(v_sync_444	),                                                                                                  
//	/*o*/.o_data_en         (de_444		)                                                                                       
//	);

// yuv444_yuv422(
//	/*i*/.sys_clk	(hdmi_rx_slow_clk),
//	/*i*/.i_hs		(h_sync_444),
//	/*i*/.line_end	(),
//	/*i*/.i_vs		(v_sync_444),
//	/*i*/.i_de		(de_444),
//	/*i*/.i_y		(y_444),
//	/*i*/.i_cb		(cb_444),
//	/*i*/.i_cr		(cr_444),
//	/*o*/.o_hs		(h_sync_422),
//	/*o*/.o_vs		(v_sync_422),
//	/*o*/.o_de		(de_422),
//	/*o*/.o_y		(y_422),
//	/*o*/.o_c		(c_422)	
//);

//yuv422_2_ycbcr444 u_yuv422_2_444(
//  /*i*/.rst_n    	(1'b1),   
//  /*i*/.clk     	(hdmi_rx_slow_clk),
//  /*i*/.i_v_sync 	(ch0_vs),
//  /*i*/.i_h_sync 	(ch0_hs),
//  /*i*/.i_de    	(ch0_de),
//  /*i*/.c_in  		(ch0_c),
//  /*i*/.y_in		(ch0_y),
//  /*o*/.o_v_sync	(ch0_v_sync_444),
//  /*o*/.o_h_sync	(ch0_h_sync_444),
//  /*o*/.o_de   		(ch0_de_444		),
//  /*o*/.y_out    	(ch0_y_444		),
//  /*o*/.cb_out   	(ch0_cb_444		),
//  /*o*/.cr_out   	(ch0_cr_444		)

//);

//	ycbcr_to_rgb u_ycbcr_2rgb(
//	/*i*/.clk			(hdmi_rx_slow_clk),
//	/*i*/.i_v_sync		(ch0_v_sync_444 ),
//	/*i*/.i_h_sync		(ch0_h_sync_444 ),
//	/*i*/.i_data_en		(ch0_de_444		),
//	/*i*/.i_y_8b		(ch0_y_444		),
//	/*i*/.i_cb_8b		(ch0_cb_444		),
//	/*i*/.i_cr_8b		(ch0_cr_444		),
//	/*o*/.o_v_sync		(ch0_vs_o ),
//	/*o*/.o_h_sync		(ch0_hs_o ),
//	/*o*/.o_data_en     (ch0_de_o		),   
//	/*o*/.o_r_8b		(ch0_rdata		),
//	/*o*/.o_g_8b		(ch0_gdata		),
//	/*o*/.o_b_8b		(ch0_bdata		)
	                                                                                           
//);


//frame_buffer #(
//	.I_VID_WIDTH 	(16 ),                      			
//	.O_VID_WIDTH 	(16 ),                    
//	.AXI_ID_WIDTH	( AXI_ID_WIDTH 	),    
//	.AXI_WR_ID		(	AXI0_WR_ID	),   
//	.AXI_RD_ID		( AXI0_RD_ID		),   
//	.AXI_ADDR_WIDTH (AXI_ADDR_WIDTH ),     
//	.AXI_DATA_WIDTH (AXI_DATA_WIDTH	), 
//	.START_ADDR		(0	 ),              
//	.MAX_VID_WIDTH	(1920),            
//	.MAX_VID_HIGHT	(1080),   
//	.BURST_LEN 		(8'd128),           
//	.FB_NUM			(3)                    
//)u_frame_buffer_ch0(                       
///*i*/.i_clk			(hdmi_rx_slow_clk   ),// (CLK_148P5M),//	(VI_CLK3_PLL		),    //(CLK_148P5M   ),//    
/////*i*/.i_hs		(),//(rx_hsync 			),// (sync_hs3  ),//(e3_h							),  //(sw0_hs 			),//
///*i*/.i_vs			(v_sync_422),//(rx_vsync 			),// (sync_vs2  ),//(e3_v							),  //(sw0_vs 			),//
///*i*/.i_de			(de_422),//(rx_de 				),// (sync_de2  ),//(e3_de						),    //(sw0_de 			),//
///*i*/.vin 			({y_422,c_422}),//({rdata_in,gdata_in,bdata_in}			),// (sync_vout2),//({e3_yout,e3_cout}),   //(sw0_vout			),//
                  
///*i*/.o_clk			(hdmi_rx_slow_clk			),//(clk_o),//
///*i*/.o_hs    		(ch0_hs),//(ch0_hs_o			), //active high
///*i*/.o_vs    		(ch0_vs),//(ch0_vs_o			), //active hgih
///*i*/.o_de    		(ch0_de),//(ch0_de_o			), //active high
///*i*/.vout    		({ch0_y,ch0_c}		),//({ch0_rdata,ch0_gdata,ch0_bdata}			),


///*i*/.H_PRE_PORCH 	(H_PRE_PORCH  		),//( 13'd10 			),//(H_PRE_PORCH  ),//
///*i*/.H_SYNC 	 	(H_SYNC 	 		),//( 13'd10 			),//(H_SYNC 	 		),//
///*i*/.H_VALID 	 	(H_VALID 	 	  	),//( 13'd146 		),//(H_VALID 	 	  ),//
///*i*/.H_BACK_PORCH	(H_BACK_PORCH 		),//( 13'd10 			),//(H_BACK_PORCH ),//
///*i*/.V_PRE_PORCH 	(V_PRE_PORCH  		),//( 13'd5 			),//(V_PRE_PORCH  ),//
///*i*/.V_SYNC 	 	(V_SYNC 	 		),//( 13'd5 			),//(V_SYNC 	 		),//
///*i*/.V_VALID 	 	(V_VALID 	 	  	),//( 13'd119 		),//(V_VALID 	 	  ),//
///*i*/.V_BACK_PORCH	(V_BACK_PORCH 		),//( 13'd5 			),//(V_BACK_PORCH ),//

///*i*/.axi_clk		(sys_clk 		), 
///*i*/.rst_n			(Sys_Rst_N		),

///*o*/.axi_awid		(axi_m_awid			),      
///*o*/.axi_awaddr	(axi_m_awaddr		),    
///*o*/.axi_awlen		(axi_m_awlen		),     
///*o*/.axi_awsize	(axi_m_awsize		),    
///*o*/.axi_awburst	(axi_m_awburst		),   
///*o*/.axi_awlock	(axi_m_awlock		),    
///*o*/.axi_awvalid	(axi_m_awvalid		),   
///*i*/.axi_awready	(axi_m_awready		),  
                                         
///*O*/.axi_wid		(axi_m_wid			),
///*o*/.axi_wdata		(axi_m_wdata		),     
///*o*/.axi_wstrb		(axi_m_wstrb		),     
///*o*/.axi_wlast		(axi_m_wlast		),     
///*o*/.axi_wvalid	(axi_m_wvalid		),    
///*i*/.axi_wready	(axi_m_wready		),
                                    				              	
///*i*/.axi_bid		(axi_m_bid			),       
///*o*/.axi_bresp		(axi_m_bresp		),     
///*i*/.axi_bvalid	(axi_m_bvalid		),    
///*o*/.axi_bready	(axi_m_bready		),
                                                    
///*o*/.axi_arid		(axi_m_arid			),      
///*o*/.axi_araddr	(axi_m_araddr		),    
///*o*/.axi_arlen		(axi_m_arlen	    ),     
///*o*/.axi_arsize	(axi_m_arsize		),    
///*o*/.axi_arburst	(axi_m_arburst	 	),   
///*o*/.axi_arlock	(axi_m_arlock	 	),    
///*o*/.axi_arvalid	(axi_m_arvalid		),   
///*i*/.axi_arready	(axi_m_arready		),
                                        
///*i*/.axi_rid  		(axi_m_rid			),       
///*i*/.axi_rdata		(axi_m_rdata		),
///*i*/.axi_rresp		(axi_m_rresp	 	),     
///*i*/.axi_rlast		(axi_m_rlast	 	),     
///*i*/.axi_rvalid	(axi_m_rvalid	 	),    
///*o*/.axi_rready	(axi_m_rready		)     
//);

//Axi4FullDeplex
//  # (
//      .DDR_WRITE_FIRST  ( DDR_WRITE_FIRST ),
//      .AXI_DATA_WIDTH   ( AXI_DATA_WIDTH  )
//    )
//  U2_Axi4FullDeplex_0
//  (
//    //System Signal
//    .SysClk   ( Axi0Clk    ), //System Clock
//    .Reset_N  ( axi0_rst_n   ), //System Reset
//    //Axi Slave Interfac Signal
//    .AWID     ( axi_m_awid      ),  //(O)[WrAddr]Write address ID.
//    .AWADDR   ( axi_m_awaddr    ),  //(O)[WrAddr]Write address.
//    .AWLEN    ( axi_m_awlen     ),  //(O)[WrAddr]Burst length.
//    .AWSIZE   ( axi_m_awsize    ),  //(O)[WrAddr]Burst size.
//    .AWBURST  ( axi_m_awburst   ),  //(O)[WrAddr]Burst type.
//    .AWLOCK   ( axi_m_awlock    ),  //(O)[WrAddr]Lock type.
//    .AWVALID  ( axi_m_awvalid   ),  //(O)[WrAddr]Write address valid.
//    .AWREADY  ( axi_m_awready   ),  //(I)[WrAddr]Write address ready.
//    ///////////                
//    .WID      ( axi_m_wid       ),  //(O)[WrData]Write ID tag.
//    .WDATA    ( axi_m_wdata     ),  //(O)[WrData]Write data.
//    .WSTRB    ( axi_m_wstrb     ),  //(O)[WrData]Write strobes.
//    .WLAST    ( axi_m_wlast     ),  //(O)[WrData]Write last.
//    .WVALID   ( axi_m_wvalid    ),  //(O)[WrData]Write valid.
//    .WREADY   ( axi_m_wready    ),  //(I)[WrData]Write ready.
//    ///////////                
//    .BID      ( axi_m_bid       ),  //(I)[WrResp]Response ID tag.
//    .BVALID   ( axi_m_bvalid    ),  //(I)[WrResp]Write response valid.
//    .BREADY   ( axi_m_bready    ),   //(O)[WrResp]Response ready.
//    ///////////                 
//    .ARID     ( axi_m_arid      ),  //(O)[RdAddr]Read address ID.
//    .ARADDR   ( axi_m_araddr    ),  //(O)[RdAddr]Read address.
//    .ARLEN    ( axi_m_arlen     ),  //(O)[RdAddr]Burst length.
//    .ARSIZE   ( axi_m_arsize    ),  //(O)[RdAddr]Burst size.
//    .ARBURST  ( axi_m_arburst   ),  //(O)[RdAddr]Burst type.
//    .ARLOCK   ( axi_m_arlock    ),  //(O)[RdAddr]Lock type.
//    .ARVALID  ( axi_m_arvalid   ),  //(O)[RdAddr]Read address valid.
//    .ARREADY  ( axi_m_arready   ),  //(I)[RdAddr]Read address ready.
//    ///////////                
//    .RID      ( axi_m_rid       ),  //(I)[RdData]Read ID tag.
//    .RDATA    ( axi_m_rdata     ),  //(I)[RdData]Read data.
//    .RRESP    ( axi_m_rresp     ),  //(I)[RdData]Read response.
//    .RLAST    ( axi_m_rlast     ),  //(I)[RdData]Read last.
//    .RVALID   ( axi_m_rvalid    ),  //(I)[RdData]Read valid.
//    .RREADY   ( axi_m_rready    ),  //(O)[RdData]Read ready.
//    /////////////
//    //DDR Controner AXI4 Signal
//    .aid      ( m_aid_0       ),  //(O)[Addres] Address ID
//    .aaddr    ( m_aaddr_0     ),  //(O)[Addres] Address
//    .alen     ( m_alen_0      ),  //(O)[Addres] Address Brust Length
//    .asize    ( m_asize_0     ),  //(O)[Addres] Address Burst size
//    .aburst   ( m_aburst_0    ),  //(O)[Addres] Address Burst type
//    .alock    ( m_alock_0     ),  //(O)[Addres] Address Lock type
//    .avalid   ( m_avalid_0    ),  //(O)[Addres] Address Valid
//    .aready   ( m_aready_0    ),  //(I)[Addres] Address Ready
//    .atype    ( m_atype_0     ),  //(O)[Addres] Operate Type 0=Read, 1=Write
//    /////////// /////////     
//    .wid      ( m_wid_0       ),  //(O)[Write]  ID
//    .wdata    ( m_wdata_0     ),  //(O)[Write]  Data
//    .wstrb    ( m_wstrb_0     ),  //(O)[Write]  Data Strobes(Byte valid)
//    .wlast    ( m_wlast_0     ),  //(O)[Write]  Data Last
//    .wvalid   ( m_wvalid_0    ),  //(O)[Write]  Data Valid
//    .wready   ( m_wready_0    ),  //(I)[Write]  Data Ready
//    /////////// /////////     
//    .rid      ( m_rid_0       ),  //(I)[Read]   ID
//    .rdata    ( m_rdata_0     ),  //(I)[Read]   Data
//    .rlast    ( m_rlast_0     ),  //(I)[Read]   Data Last
//    .rvalid   ( m_rvalid_0    ),  //(I)[Read]   Data Valid
//    .rready   ( m_rready_0    ),  //(O)[Read]   Data Ready
//    .rresp    ( m_rresp_0     ),  //(I)[Read]   Response
//    /////////// /////////     
//    .bid      ( m_bid_0       ),  //(I)[Answer] Response Write ID
//    .bvalid   ( m_bvalid_0    ),  //(I)[Answer] Response valid
//    .bready   ( m_bready_0    )   //(O)[Answer] Response Ready
//  );



////=================================================================================
////
////=================================================================================
////=============================================================
////
////=============================================================
////=============================================================
////
////=============================================================
//wire [7:0]	rx_data  ;
//wire 				rx_valid ;
//wire [7:0]	tx_data  ;
//wire 				tx_valid ;
//wire 				tx_req   ;
//wire	[9:0]	ctrl_time	;
//wire[199:0]	ctrl_io  	;
//wire				time_valid;
//wire				io_valid  ;
//reg		[7:0] rst_cnt = 'd0;

//	uart_top #(
//			.CLK_RATE 		( 32'd10000000),
//			.BPS_RATE 		( 115200		),
//			.STOP_BIT_W 	( 2'b00			),//00: stop_bit = 1; 01: stop_bit = 1.5 ; 10 : stop_bit = 2
//			.CHECKSUM_MODE( 2'b00			),//00:space, 01:odd ,10:even ,11:mask    
//			.CHECKSUM_EN 	( 1'b0    	)
//	)u_uart_top(
//		/*i*/.clk					(clk_10m),
//		/*i*/.rst_n				(rst_n	),
//	  /*i*/.rxd					(uart_rx),
//	  /*o*/.txd					(uart_tx),
//	  /*o*/.rx_data			(rx_data ),
//	  /*o*/.rx_valid		(rx_valid),
//	  /*i*/.tx_data			(tx_data ),
//		/*i*/.tx_valid		(tx_valid),
//		/*o*/.tx_req  		(tx_req  )
//);


// uart_parse u_uart_parse(
//		/*i*/.clk					(clk_10m),
//		/*i*/.rst_n				(rst_n ),
//		/*i*/.rx_valid		(rx_valid),
//		/*i*/.rx_data			(rx_data ),
//		/*o*/.tx_valid		(tx_valid),
//		/*o*/.tx_data			(tx_data ),
//		/*i*/.tx_req  		(tx_req  ),
//		/*o*/.ctrl_time		(ctrl_time	),
//    /*o*/.ctrl_io  		(ctrl_io  	),
//    /*o*/.time_valid	(time_valid ),
//    /*o*/.io_valid  	(io_valid   )  
//);

////=================================================================================
////lcd test
////=================================================================================


//parameter	MAX_HRES		= 12'd1920;
//parameter	MAX_VRES		= 12'd1080;
//parameter	HSP				= 8'd2;
//parameter	HBP				= 8'd88;
//parameter	HFP				= 8'd120;
//parameter	VSP				= 8'd2;
//parameter	VBP				= 8'd20;
//parameter	VFP				= 8'd20;



//////////////////////////////////////////////////////////////////
//// signal 

//reg		[25:0]	r_rst_cnt;

//wire	[31:0]	w_axi_rdata;
//wire			w_axi_awready;
//wire			w_axi_wready;
//wire			w_axi_arready;
//wire			w_axi_rvalid;
//wire			w_axi_bvalid;

//wire	[6:0]	w_axi_awaddr;
//wire			w_axi_awvalid;
//wire	[31:0]	w_axi_wdata;
//wire			w_axi_wvalid;
//wire			w_axi_bready;
//wire	[6:0]	w_axi_araddr;
//wire			w_axi_arvalid;
//wire			w_axi_rready;

//wire			w_confdone;
//wire  			i_mipi_clk;

//wire 			hs,vs,de;
//wire [7:0] 		r_data,g_data,b_data;
//////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////

//assign  i_mipi_clk = sys_clk;

//assign	o_mipi_pll_rstn 	= nrst;
//assign  LCD_POWER 			= nrst;
//assign	mipi_dp_clk_RST		= ~nrst;
//assign	mipi_dp_data0_RST	= ~nrst;
//assign	mipi_dp_data1_RST	= ~nrst;
//assign	mipi_dp_data2_RST	= ~nrst;
//assign	mipi_dp_data3_RST	= ~nrst;




//////////////////////////////////////////////////////////////////
//always@(posedge i_mipi_clk or  negedge rst_n)
//begin
//	if ( !rst_n ) begin
//		r_rst_cnt	<= 'd0;
//	end else if(~r_rst_cnt[23]) begin		
//		r_rst_cnt	<= r_rst_cnt + 1'b1;
			
//	end
//end
//assign	o_lcd_rstn	= r_rst_cnt[23];


//reg [26:0] dly_cnt = 'd0;

//wire sys_rst_n;
//always @( posedge i_sysclk_div_2 or negedge rst_n )
//begin
//	if( !rst_n )
//		dly_cnt <= 'd0;
//	else if( w_confdone )
//		dly_cnt <= dly_cnt[26] ? dly_cnt :(dly_cnt + 1'b1);
//	else 
//		dly_cnt <= 'd0;
//end 

//assign sys_rst_n = dly_cnt[26];

//// Panel driver initialization
//panel_config
//#(
//	.INITIAL_CODE	("Panel_1080p_reg.mem"),
//	.REG_DEPTH		(9'd448)
//)
//inst_panel_config
//(
//	.i_axi_clk		(i_mipi_clk		),
//	.i_restn		(o_lcd_rstn	),
	
//	.i_axi_awready	(w_axi_awready	),
//	.i_axi_wready	(w_axi_wready	),
//	.i_axi_bvalid	(w_axi_bvalid	),
//	.o_axi_awaddr	(w_axi_awaddr	),
//	.o_axi_awvalid	(w_axi_awvalid	),
//	.o_axi_wdata	(w_axi_wdata	),
//	.o_axi_wvalid	(w_axi_wvalid	),
//	.o_axi_bready	(w_axi_bready	),
	
//	.i_axi_arready	(w_axi_arready	),
//	.i_axi_rdata	(w_axi_rdata	),
//	.i_axi_rvalid	(w_axi_rvalid	),
//	.o_axi_araddr	(w_axi_araddr	),
//	.o_axi_arvalid	(w_axi_arvalid	),
//	.o_axi_rready	(w_axi_rready	),
	
//	.o_addr_cnt		(			),
//	.o_state		(			),
//	.o_confdone		(w_confdone	),
	
//	.i_dbg_we		(0	),
//	.i_dbg_din		(0	),
//	.i_dbg_addr		(0	),
//	.o_dbg_dout		(	),
//	.i_dbg_reconfig	(0	)
//);



//	color_bar_rgb #(
//	.HS_POLORY 		(1'b1		),
//	.VS_POLORY 		(1'b1		),
//	.H_FRONT_PORCH 	(HFP/2		),
//	.H_SYNC 		(HSP/2		),
//	.H_VALID 		(MAX_HRES/2	),
//	.H_BACK_PORCH 	(HBP/2		),
//	.V_FRONT_PORCH 	(VFP		),
//	.V_SYNC 		(VSP		),
//	.V_VALID 		(MAX_VRES	),
//	.V_BACK_PORCH 	(VBP		),
//	.TEST_MODE 		(2'd1)
//	)u_color_bar_rgb(
//	/*i*/.clk	(i_sysclk_div_2),
//	/*i*/.rst_n	(sys_rst_n),
//	/*o*/.hs	(hs),
//	/*o*/.vs	(vs),
//	/*o*/.de	(de),
//	// /*O*/.h_cnt (h_cnt),
//	// /*O*/.v_cnt (v_cnt),
//	/*o*/.rgb_r	(r_data),    //像素数据、红色分量
//	/*o*/.rgb_g	(g_data),    //像素数据、绿色分量
//	/*o*/.rgb_b (b_data)    //像素数据、蓝色分量
	
//	);


//// MIPI DSI TX Channel
//dsi_tx
//#(
//)
//inst_efx_dsi_tx
//(
//	.reset_n			(rst_n	),
//	.clk				(i_mipi_clk		),	// 100
//	.reset_byte_HS_n	(rst_n	),
//	.clk_byte_HS		(i_mipi_tx_pclk	),	// 1000/8=125
//	.reset_pixel_n		(rst_n	),//(sys_rst_n	),//(r_rstn_video	),
//	.clk_pixel			(i_sysclk_div_2	),  // 1000/16=62.5
//	// LVDS clock lane   
//	.Tx_LP_CLK_P		(mipi_dp_clk_LP_P_OUT),
//	.Tx_LP_CLK_P_OE     (mipi_dp_clk_LP_P_OE),
//	.Tx_LP_CLK_N		(mipi_dp_clk_LP_N_OUT),
//	.Tx_LP_CLK_N_OE     (mipi_dp_clk_LP_N_OE),
//	.Tx_HS_C            (mipi_dp_clk_HS_OUT),
//	.Tx_HS_enable_C		(mipi_dp_clk_HS_OE),
	
//	// ----- DLane -----------
//	// LVDS data lane
//	.Tx_LP_D_P			({mipi_dp_data3_LP_P_OUT, mipi_dp_data2_LP_P_OUT, mipi_dp_data1_LP_P_OUT, mipi_dp_data0_LP_P_OUT}),
//	.Tx_LP_D_P_OE       ({mipi_dp_data3_LP_P_OE, mipi_dp_data2_LP_P_OE, mipi_dp_data1_LP_P_OE, mipi_dp_data0_LP_P_OE}),
//	.Tx_LP_D_N			({mipi_dp_data3_LP_N_OUT, mipi_dp_data2_LP_N_OUT, mipi_dp_data1_LP_N_OUT, mipi_dp_data0_LP_N_OUT}),
//	.Tx_LP_D_N_OE       ({mipi_dp_data3_LP_N_OE, mipi_dp_data2_LP_N_OE, mipi_dp_data1_LP_N_OE, mipi_dp_data0_LP_N_OE}),
//	.Tx_HS_D_0			(mipi_dp_data0_HS_OUT),
//	.Tx_HS_D_1			(mipi_dp_data1_HS_OUT),
//	.Tx_HS_D_2			(mipi_dp_data2_HS_OUT),
//	.Tx_HS_D_3			(mipi_dp_data3_HS_OUT),
//	// control signal to LVDS IO
//	.Tx_HS_enable_D		({mipi_dp_data3_HS_OE, mipi_dp_data2_HS_OE, mipi_dp_data1_HS_OE, mipi_dp_data0_HS_OE}),
//	.Rx_LP_D_P			(mipi_dp_data0_LP_P_IN),
//	.Rx_LP_D_N			(mipi_dp_data0_LP_N_IN),
	
//	//AXI4-Lite Interface
//	.axi_clk			(i_mipi_clk							), 
//	.axi_reset_n		(o_lcd_rstn							),//
//	.axi_awaddr			(w_axi_awaddr						),//Write Address. byte address.
//	.axi_awvalid		(w_axi_awvalid						),//Write address valid.
//	.axi_awready		(w_axi_awready						),//Write address ready.
//	.axi_wdata			(w_axi_wdata						),//Write data bus.
//	.axi_wvalid			(w_axi_wvalid						),//Write valid.
//	.axi_wready			(w_axi_wready						),//Write ready.

//	.axi_bvalid			(w_axi_bvalid						),//Write response valid.
//	.axi_bready			(w_axi_bready						),//Response ready.      
//	.axi_araddr			(w_axi_araddr						),//Read address. byte address.
//	.axi_arvalid		(w_axi_arvalid						),//Read address valid.
//	.axi_arready		(w_axi_arready						),//Read address ready.
//	.axi_rdata			(w_axi_rdata						),//Read data.
//	.axi_rvalid			(w_axi_rvalid						),//Read valid.
//	.axi_rready			(w_axi_rready						),//Read ready.

//    .hsync				(hs									),//(~w_pack_hs),
//    .vsync				(vs									),//(~w_pack_vs),
//	.vc					(2'b0								),
//	.datatype			(6'h3E								),
//    .pixel_data			({16'd0,{2{r_data,g_data,b_data}}}	),//({16'b0, w_pack_data}),
//    .pixel_data_valid	(de									),//(w_pack_valid),
//	.haddr				(MAX_HRES							),
//	.TurnRequest_dbg    (1'b0								),
//	.TurnRequest_done	(),
//	.irq				()
//);

////=================================================================================
////
////=================================================================================
//endmodule