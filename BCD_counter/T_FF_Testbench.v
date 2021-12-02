
`timescale 1ns/1ns
module T_FF_TestBench;

reg clock;
reg preset;
reg reset;
wire q, q_bar; 
reg t;
T_FF_Behavioral tff(q, q_bar, t, clock, reset);

 initial begin 

    clock = 0;
    forever #5 clock = ~clock;

    reset = 1;

end


initial begin

    reset = 1; #5;
    reset = 0; #5;
	reset = 1; #5;    

    t = 0; #10;
 
    t = 1; #10;

    t = 1; #10;
 
    t = 0; #10;
	
	t = 1; #10;

	t = 0; #10;
end





endmodule
