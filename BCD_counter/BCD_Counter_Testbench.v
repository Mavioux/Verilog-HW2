`timescale 1ns/1ns
module BCD_Counter_Testbench;

reg input_pulse;
wire[0:3] out;
wire carry;
reg t0, reset_ext, en;
BCD_Counter bcd(out, carry, t0, input_pulse, reset_ext, en);

initial begin
	t0 = 1;
	input_pulse = 0;
	reset_ext = 1;
	en = 1;
	forever #5 input_pulse = ~input_pulse;
end


endmodule
