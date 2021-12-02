module T_FF(	output reg Q, output reg Q_bar, 
		input wire T, clk, reset, preset);

wire w1, w2;
wire Q_wire, Q_bar_wire;

nand lu(w1, T, clk, Q_bar_wire);
nand ld(w2, T, clk, Q_wire);
nand ru(Q_bar_wire, w1, Q_bar_wire, ~preset);
nand rd(Q_wire, w2, Q_wire, ~reset);

assign Q = Q_wire;
assign Q_bar = Q_bar_wire;

endmodule
