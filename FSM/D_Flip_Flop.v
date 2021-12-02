module D_Flip_Flop (
    output reg q,
    input wire d,
    input wire clock, reset, set
);

    reg q_d;

    initial begin
        q = 1'b0;
        q_d = 1'b1;
    end

    always @ (posedge clock)
    begin
        
        if(~reset && ~set)
        begin
            q <= d;
            q_d <= ~d;
        end
    end

    always @* begin
        if(reset) 
        begin
            q = 1'b0;
        end
        else if (set) begin
            q = 1'b1;
        end
    end
    
endmodule
