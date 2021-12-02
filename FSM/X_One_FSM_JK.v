
module X_One_FSM_JK(input clk, input reset, input x_in, output y_out);

wire ja, jb, jc, ka, kb, kc;
reg set;

initial begin
    set <= 0;
end

JK_FF dff0(qa, ja, ka, clk, reset, set);
JK_FF dff1(qb, jb, kb, clk, reset, set);
JK_FF dff2(qc, jc, kc, clk, set, reset);

and(ja, ~qa, ~qb, x_in);

and(wb1, ~qa, ~qc, ~x_in);
and(wb2, ~qa, qb, qc, x_in);
and(wb3, qa, ~qb, ~qc);
or(jb, wb1, wb2, wb3);

and(wc1, ~qa, ~qb, ~x_in);
and(wc2, ~qa, qb, qc, ~x_in);
and(wc3, qa, ~qb, ~qc, x_in);
or(jc, wc1, wc2, wc3);

assign ka = ~ja;
assign kb = ~jb;
assign kc = ~jc;

and(y_out, ~qa, x_in);


endmodule