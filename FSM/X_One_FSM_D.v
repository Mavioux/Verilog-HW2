module X_One_FSM_D(input clk, input reset, input x_in, output y_out);

wire da, db, dc;
reg set;
reg a,b,c;

initial begin
    a <= 1;
    b <= 1;
    c <= 0;
    set <= 0;
end

D_Flip_Flop dff0(qa, da, clk, reset, set);
D_Flip_Flop dff1(qb, db, clk, reset, set);
D_Flip_Flop dff2(qc, dc, clk, set, reset);

and(da, ~qa, ~qb, x_in);

and(wb1, ~qa, ~qc, ~x_in);
and(wb2, ~qa, qb, qc, x_in);
and(wb3, qa, ~qb, ~qc);
or(db, wb1, wb2, wb3);

and(wc1, ~qa, ~qb, ~x_in);
and(wc2, ~qa, qb, qc, ~x_in);
and(wc3, qa, ~qb, ~qc, x_in);
or(dc, wc1, wc2, wc3);

// // Reset da
// and(da, ~reset, da_wire);

// // Reset db
// and(db, ~reset, db_wire);

// // Reset dc
// and(wc4, ~reset, dc_wire);
// or(dc, wc4, reset);

and(y_out, ~qa, x_in);

// assign da_wire = a;
// assign db_wire = b;
// assign dc_wire = c;


endmodule
