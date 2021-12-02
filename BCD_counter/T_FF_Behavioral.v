module T_FF_Behavioral( output reg Q, output reg Q_bar, 
			   			input wire T, clk, reset, reset_ext, en);

initial begin
    Q <= 1;
    Q_bar <= 0;
end

always @ (posedge clk, negedge reset) begin
    if(!reset) begin
		Q <= 0;
		Q_bar <= 1;
    end
	else if(!reset_ext) begin
		Q <= 0;
		Q_bar <= 1;
	end
    else begin
		if(T && en) begin
		    Q <= ~Q;
	 	   Q_bar <= ~Q_bar;
		end
		else begin
	 	   Q <= Q;
	  	  Q_bar <= Q_bar;
		end
    end

end


endmodule
