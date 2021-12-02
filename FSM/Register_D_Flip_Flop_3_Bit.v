module Register_D_Flip_Flop_3_Bit (
    output wire[0:2] reg_out,
    input wire[0:2] reg_in,
    input wire clock, reset
);

    reg d0, d1, d2;
    assign d0 = reg_in[0];
    assign d1 = reg_in[1];
    assign d2 = reg_in[2];

    D_Flip_Flop dff0(reg_out[0], d0, clock, reset);
    D_Flip_Flop dff1(reg_out[1], d1, clock, reset);
    D_Flip_Flop dff2(reg_out[2], d2, clock, reset);  

    always @*
    begin
        if(reset) 
        begin
           d0 <= 0;
           d1 <= 0;
           d2 <= 1;
        end
		else begin
			d0 <= reg_in[0];
    		d1 <= reg_in[1];
    		d2 <= reg_in[2];	
		end     
    end
    
endmodule