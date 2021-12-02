
module Register_JK_3 (
    output wire[0:2] reg_out,
    input wire[0:2] reg_in,
    input wire clock, reset
);

    reg j0, j1, j2, k0, k1, k2;

    JK_FF jkff0(reg_out[0], j0, k0, clock, reset);
    JK_FF jkff1(reg_out[1], j1, k1, clock, reset);
    JK_FF jkff2(reg_out[2], j2, k2, clock, reset);  

    always @*
    begin
        if(reset) 
        begin
           j0 <= 0;
           j1 <= 0;
           j2 <= 1;
           k0 <= 1;
           k1 <= 1;
           k2 <= 0;
        end
		else begin
			j0 <= reg_in[0];
    		j1 <= reg_in[1];
    		j2 <= reg_in[2];
			k0 <= ~reg_in[0];
    		k1 <= ~reg_in[1];
    		k2 <= ~reg_in[2];
		end     
    end
    
endmodule