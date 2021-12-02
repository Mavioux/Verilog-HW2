module LED_Decoder( output reg[0:6] digit,
					input wire[0:3] b_coded_dgt,
					input wire LED_type_ctl);

localparam 	zero = 7'b0000001,
			one = 7'b1001111,
			two = 7'b0010010,
			three = 7'b0000110,
			four = 7'b1001100,
			five = 7'b0100100,
			six = 7'b0100000,
			seven = 7'b0001111,
			eight = 7'b0000000,
			nine = 7'b0000100,
			else_zero = 7'b1111110,
			else_one = 7'b0110000,
			else_two = 7'b1101101,
			else_three = 7'b1111001,
			else_four = 7'b0110011,
			else_five = 7'b1011011,
			else_six = 7'b1011111,
			else_seven = 7'b1110000,
			else_eight = 7'b1111111,
			else_nine = 7'b1111011;

always @ (LED_type_ctl, b_coded_dgt) begin
	if(LED_type_ctl) begin
		case(b_coded_dgt)
			4'b0000 : digit <= zero;
			4'b0001 : digit <= one;
			4'b0010 : digit <= two;
			4'b0011 : digit <= three;
			4'b0100 : digit <= four;
			4'b0101 : digit <= five;
			4'b0110 : digit <= six;
			4'b0111 : digit <= seven;
			4'b1000 : digit <= eight;
			4'b1001 : digit <= nine;
			default : digit <= 1111110;
		endcase
	end


	else begin
		case(b_coded_dgt)
			4'b0000 : digit <= else_zero;
			4'b0001 : digit <= else_one;
			4'b0010 : digit <= else_two;
			4'b0011 : digit <= else_three;
			4'b0100 : digit <= else_four;
			4'b0101 : digit <= else_five;
			4'b0110 : digit <= else_six;
			4'b0111 : digit <= else_seven;
			4'b1000 : digit <= else_eight;
			4'b1001 : digit <= else_nine;
			default : digit <= 0000001;
		endcase
	end
end


endmodule
