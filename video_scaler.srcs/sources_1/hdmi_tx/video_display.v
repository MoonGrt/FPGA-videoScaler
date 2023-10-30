module  video_display(
    input                pixel_clk,
    input                sys_rst_n,
    
    input        [10:0]  pixel_xpos,  //像素点横坐标
    input        [10:0]  pixel_ypos,  //像素点纵坐标
    output  reg  [23:0]  pixel_data   //像素点数据
);

//parameter define
parameter  H_DISP = 11'd800;                       //分辨率——行
parameter  V_DISP = 11'd600;                        //分辨率——列

localparam WHITE  = 24'b11111111_11111111_11111111;  //RGB888 白色
localparam BLACK  = 24'b00000000_00000000_00000000;  //RGB888 黑色
localparam RED    = 24'b11111111_00001100_00000000;  //RGB888 红色
localparam GREEN  = 24'b00000000_11111111_00000000;  //RGB888 绿色
localparam BLUE   = 24'b00000000_00000000_11111111;  //RGB888 蓝色
    
//*****************************************************
//**                    main code
//*****************************************************

//根据当前像素点坐标指定当前像素点颜色数据，在屏幕上显示彩条
always @(posedge pixel_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        pixel_data <= 24'd0;
    else begin
        if((pixel_xpos >= 0) && (pixel_xpos < (H_DISP/5)*1))
            pixel_data <= WHITE;
        else if((pixel_xpos >= (H_DISP/5)*1) && (pixel_xpos < (H_DISP/5)*2))
            pixel_data <= BLACK;  
        else if((pixel_xpos >= (H_DISP/5)*2) && (pixel_xpos < (H_DISP/5)*3))
            pixel_data <= RED;  
        else if((pixel_xpos >= (H_DISP/5)*3) && (pixel_xpos < (H_DISP/5)*4))
            pixel_data <= GREEN;
        else 
            pixel_data <= BLUE;
    end
end

endmodule