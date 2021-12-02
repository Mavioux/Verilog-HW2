module BCD_Counter_Four_Digits( output wire[0:3] A0, A1, A2, A3,
								input wire clock, reset, en);

reg t0;
wire c0, c1, c2, t1, t2, t3;
BCD_Counter counter0(A0, c0, t0, clock, reset, en);
BCD_Counter counter1(A1, c1, c0, clock, reset, en);
BCD_Counter counter2(A2, c2, t2, clock, reset, en);
BCD_Counter counter3(A3, c3, t3, clock, reset, en);

and(t2, c0, c1);
and(t3, c0, c1, c2);


initial begin
	t0 <= 1;
end

endmodule
