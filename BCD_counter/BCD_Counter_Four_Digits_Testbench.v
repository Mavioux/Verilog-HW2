`timescale 1us/1us
module BCD_Counter_Four_Digits_Testbench;

reg input_pulse, reset_ext, en;
wire[0:3] d0, d1, d2, d3;
wire[0:6] led0, led1, led2, led3;
reg LED_type_ctl;
BCD_Counter_Four_Digits bcd(d0, d1, d2, d3, input_pulse, reset_ext, en);
LED_Decoder ld0(led0, d0, LED_type_ctl);
LED_Decoder ld1(led1, d1, LED_type_ctl);
LED_Decoder ld2(led2, d2, LED_type_ctl);
LED_Decoder ld3(led3, d3, LED_type_ctl);


initial begin
	input_pulse = 0;
	forever #0.5 input_pulse = ~input_pulse;
end

initial begin
	LED_type_ctl = 1;
	en = 1;
	reset_ext = 0; #0.2;
	reset_ext = 1; 
end


endmodule
