module X_One_FSM(input clk, input reset, input x_in, output y_out);

localparam[2:0]
    A = 3'b000,
    B = 3'b001,
    C = 3'b010,
    D = 3'b011,
    E = 3'b100;
reg[0:2] currentState, nextState;
reg y;

initial
begin
    currentState <= B;
end

always @ (posedge clk) begin
	if(!reset)
		currentState <= nextState;
end

always @ (posedge reset) begin
	if(reset)
		currentState <= B;
end


always @*
    case(currentState)
        A:  if(x_in) begin
                nextState <= E;
                y = 1;
            end      
            else begin
                nextState <= D;
                y = 0;
            end
        B:  if(x_in) begin
                nextState <= E;
                y = 1;
            end      
            else begin
                nextState <= B;
                y = 0;
            end 
        C:  if(x_in) begin
                nextState <= A;
                y = 1;
            end      
            else begin
                nextState <= C;
                y = 0;
            end 
        D:  if(x_in) begin
                nextState <= C;
                y = 1;
            end      
            else begin
                nextState <= B;
                y = 0;
            end
        E:  if(x_in) begin
                nextState <= D;
                y = 0;
            end      
            else begin
                nextState <= C;
                y = 0;
            end
    endcase

assign y_out = y;

endmodule