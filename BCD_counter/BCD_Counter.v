
module BCD_Counter (output reg[0:3] out,
					output wire carry,
					input wire t0, clk, reset_ext, en);

wire q0, q1, q2, q3, q_bar_0, q_bar_1, q_bar_2, q_bar_3, t1, t2, t3, reset;

T_FF_Behavioral tff0(q0, q_bar_0, t0, clk, reset, reset_ext, en);
T_FF_Behavioral tff1(q1, q_bar_1, t1, clk, reset, reset_ext, en);
T_FF_Behavioral tff2(q2, q_bar_2, t2, clk, reset, reset_ext, en);
T_FF_Behavioral tff3(q3, q_bar_3, t3, clk, reset, reset_ext, en);

nand(reset, q1, q3);
and(t1, t0, q0);
and(t2, t0, t1, q1);
and(t3, t0, t2, q2);
and(carry, q0, ~q1, ~q2, q3);

initial begin
	out <= 4'b0000;
end

assign out[0] = q3;
assign out[1] = q2;
assign out[2] = q1;
assign out[3] = q0;
endmodule