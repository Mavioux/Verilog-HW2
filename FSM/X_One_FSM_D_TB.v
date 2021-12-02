`timescale 1ns/1ns
module X_One_FSM_D_TB;
    reg clk;
    reg reset;
    reg in;
    wire out;
    reg expectedOut;
    reg [31:0] i;
    X_One_FSM_D fsm(clk, reset, in, out);
    reg [2:0] testVector[12:0];
    reg en = 1;


    initial
        begin
            $readmemb("FsmTestBenchVector",testVector);
            i=0;
            reset=1; 
            in=0;
            en=1;
        end
    
always@(posedge clk)
    begin
        {reset,in,expectedOut}=testVector[i];#10;
        $display(reset,in,expectedOut);
    end

always@(negedge clk)
    begin 
        if(expectedOut !== out) begin
            $display("Wrong      output      for      inputs      %b, %b!=%b",{reset,in},expectedOut,out);
        end
            i=i+1;
    end

    // D_Flip_Flop dff(out, clk, clk, reset);
    
    
always
    begin
        clk <=1; #5;
        clk <=0; #5;
    end
endmodule

