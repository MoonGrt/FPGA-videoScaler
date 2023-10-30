module asyn_rst_syn(
    input clk,          //Ŀ��ʱ����
    input rst_n,        //�첽��λ������Ч
    
    output syn_reset    //����Ч
    );
    
//reg define
reg reset_1;
reg reset_2;
    
//*****************************************************
//**                    main code
//***************************************************** 
assign syn_reset  = reset_2;
    
//���첽��λ�źŽ���ͬ���ͷţ���ת���ɸ���Ч
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        reset_1 <= 1'b1;
        reset_2 <= 1'b1;
    end
    else begin
        reset_1 <= 1'b0;
        reset_2 <= reset_1;
    end
end
    
endmodule