module color_bar #(
	parameter  H_SYNC   =  12'd44,    //行同步
    parameter  H_BACK   =  12'd148,   //行显示后沿
    parameter  H_DISP   =  12'd1920,  //行有效数据
    parameter  H_FRONT  =  12'd88,    //行显示前沿
    parameter  HS_POL   =  1'b1,      //horizontal sync polarity, 1 : POSITIVE,0 : NEGATIVE;
    
    parameter  V_SYNC   =  12'd5,     //场同步
    parameter  V_BACK   =  12'd36,    //场显示后沿
    parameter  V_DISP   =  12'd1080,  //场有效数据
    parameter  V_FRONT  =  12'd4,     //场显示前沿
    parameter  VS_POL   =  1'b1       //vertical sync polarity, 1 : POSITIVE,0 : NEGATIVE;
)(
	input        clk,    //pixel clock
	input        rst,    //reset signal high active
	output       hs,     //horizontal synchronization
	output       vs,     //vertical synchronization
	output       de,     //video valid
	output [7:0] rgb_r,  //video red data
	output [7:0] rgb_g,  //video green data
	output [7:0] rgb_b   //video blue data
);

localparam H_TOTAL = H_DISP + H_FRONT + H_SYNC + H_BACK;//horizontal total time (pixels)
localparam V_TOTAL = V_DISP + V_FRONT + V_SYNC + V_BACK;//vertical total time (lines)

//define the RGB values for 8 colors
localparam WHITE_R   = 8'hff;
localparam WHITE_G   = 8'hff;
localparam WHITE_B   = 8'hff;
localparam RED_R     = 8'hff;
localparam RED_G     = 8'h00;
localparam RED_B     = 8'h00;
localparam GREEN_R   = 8'h00;
localparam GREEN_G   = 8'hff;
localparam GREEN_B   = 8'h00;
localparam BLUE_R    = 8'h00;
localparam BLUE_G    = 8'h00;
localparam BLUE_B    = 8'hff;
localparam BLACK_R   = 8'h00;
localparam BLACK_G   = 8'h00;
localparam BLACK_B   = 8'h00;

localparam YELLOW_R  = 8'hff;
localparam YELLOW_G  = 8'hff;
localparam YELLOW_B  = 8'h00;
localparam CYAN_R    = 8'h00;
localparam CYAN_G    = 8'hff;
localparam CYAN_B    = 8'hff;
localparam MAGENTA_R = 8'hff;
localparam MAGENTA_G = 8'h00;
localparam MAGENTA_B = 8'hff;

reg hs_reg;          //horizontal sync register
reg vs_reg;          //vertical sync register
reg hs_reg_d0;       //delay 1 clock of 'hs_reg'
reg vs_reg_d0;       //delay 1 clock of 'vs_reg'
reg[11:0] h_cnt;     //horizontal counter
reg[11:0] v_cnt;     //vertical counter
reg[11:0] active_x;  //video x position 
reg[11:0] active_y;  //video y position 
reg[7:0] rgb_r_reg;  //video red data register
reg[7:0] rgb_g_reg;  //video green data register
reg[7:0] rgb_b_reg;  //video blue data register
reg h_active;        //horizontal video active
reg v_active;        //vertical video active
wire video_active;   //video active(horizontal active and vertical active)
reg video_active_d0; //delay 1 clock of video_active

assign hs = hs_reg_d0;
assign vs = vs_reg_d0;
assign video_active = h_active & v_active;
assign de = video_active_d0;
assign rgb_r = rgb_r_reg;
assign rgb_g = rgb_g_reg;
assign rgb_b = rgb_b_reg;

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		begin
			hs_reg_d0 <= 1'b0;
			vs_reg_d0 <= 1'b0;
			video_active_d0 <= 1'b0;
		end
	else
		begin
			hs_reg_d0 <= hs_reg;
			vs_reg_d0 <= vs_reg;
			video_active_d0 <= video_active;
		end
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		h_cnt <= 12'd0;
	else if(h_cnt == H_TOTAL - 1)//horizontal counter maximum value
		h_cnt <= 12'd0;
	else
		h_cnt <= h_cnt + 12'd1;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		active_x <= 12'd0;
	else if(h_cnt >= H_FRONT + H_SYNC + H_BACK - 1)//horizontal video active
		active_x <= h_cnt - (H_FRONT[11:0] + H_SYNC[11:0] + H_BACK[11:0] - 12'd1);
	else
		active_x <= active_x;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		v_cnt <= 12'd0;
	else if(h_cnt == H_FRONT  - 1)//horizontal sync time
		if(v_cnt == V_TOTAL - 1)//vertical counter maximum value
			v_cnt <= 12'd0;
		else
			v_cnt <= v_cnt + 12'd1;
	else
		v_cnt <= v_cnt;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		hs_reg <= 1'b0;
	else if(h_cnt == H_FRONT - 1)//horizontal sync begin
		hs_reg <= HS_POL;
	else if(h_cnt == H_FRONT + H_SYNC - 1)//horizontal sync end
		hs_reg <= ~hs_reg;
	else
		hs_reg <= hs_reg;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		h_active <= 1'b0;
	else if(h_cnt == H_FRONT + H_SYNC + H_BACK - 1)//horizontal active begin
		h_active <= 1'b1;
	else if(h_cnt == H_TOTAL - 1)//horizontal active end
		h_active <= 1'b0;
	else
		h_active <= h_active;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		vs_reg <= 1'd0;
	else if((v_cnt == V_FRONT - 1) && (h_cnt == H_FRONT - 1))//vertical sync begin
		vs_reg <= HS_POL;
	else if((v_cnt == V_FRONT + V_SYNC - 1) && (h_cnt == H_FRONT - 1))//vertical sync end
		vs_reg <= ~vs_reg;  
	else
		vs_reg <= vs_reg;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		v_active <= 1'd0;
	else if((v_cnt == V_FRONT + V_SYNC + V_BACK - 1) && (h_cnt == H_FRONT - 1))//vertical active begin
		v_active <= 1'b1;
	else if((v_cnt == V_TOTAL - 1) && (h_cnt == H_FRONT - 1)) //vertical active end
		v_active <= 1'b0;   
	else
		v_active <= v_active;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		begin
			rgb_r_reg <= 8'h00;
			rgb_g_reg <= 8'h00;
			rgb_b_reg <= 8'h00;
		end
	else if(video_active)
		if(active_x == 12'd0)
			begin
				rgb_r_reg <= WHITE_R;
				rgb_g_reg <= WHITE_G;
				rgb_b_reg <= WHITE_B;
			end
		else if(active_x == (H_DISP/5) * 1)
			begin
				rgb_r_reg <= RED_R;
				rgb_g_reg <= RED_G;
				rgb_b_reg <= RED_B;
			end
		else if(active_x == (H_DISP/5) * 2)
			begin
				rgb_r_reg <= GREEN_R;
				rgb_g_reg <= GREEN_G;
				rgb_b_reg <= GREEN_B;
			end
		else if(active_x == (H_DISP/5) * 3)
			begin
				rgb_r_reg <= BLUE_R;
				rgb_g_reg <= BLUE_G;
				rgb_b_reg <= BLUE_B;
			end 
		else if(active_x == (H_DISP/5) * 4)
			begin
				rgb_r_reg <= BLACK_R;
				rgb_g_reg <= BLACK_G;
				rgb_b_reg <= BLACK_B;
			end
		else
			begin
				rgb_r_reg <= rgb_r_reg;
				rgb_g_reg <= rgb_g_reg;
				rgb_b_reg <= rgb_b_reg;
			end         
	else
		begin
			rgb_r_reg <= 8'h00;
			rgb_g_reg <= 8'h00;
			rgb_b_reg <= 8'h00;
		end
end

endmodule 