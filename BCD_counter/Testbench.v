`timescale 1ns/1ns
module JK_TestBench;

reg clock;
reg en;
reg reset;
wire out;
reg j;
reg k;
JK_FF jk_ff(out, j, k, clock, reset);

 initial begin
	clock = 0;
    en = 1;
	reset = 1;
    reset = 0; # 5;
    reset = 1;
    
    forever #5 clock = ~clock;
end


initial begin
    j = 1; 
    k = 0; #10;

    j = 0; 
    k = 1; #10;

    j = 1; 
    k = 1; #10;

    j = 0; 
    k = 0; #10;
end





endmodule

