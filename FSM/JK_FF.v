

module JK_FF(   output reg Q,
                input wire J, K,
                input wire clock, reset, set
);

reg Q_Bar;
reg en;

initial begin
	en = 1;
    Q = 1;
    Q_Bar = 0;
end

always @(posedge set) begin
    Q = 1;
    Q_Bar = 0;
end

always @(posedge reset) begin
    Q = 0;
    Q_Bar = 1;
end

always @ (posedge clock) begin
    if(en) begin
        if(K == 0 & J == 0) begin
            Q <= Q;
            Q_Bar <= Q_Bar;
        end
        else if (K == 0) begin
            Q <= 1;
            Q_Bar <= 0;
        end
        else if (J == 0) begin
            Q <= 0;
            Q_Bar <= 1;
        end
        else if (K == 1 & J == 1) begin
            Q <= Q_Bar;
            Q_Bar <= Q;
        end
    end
end

endmodule
