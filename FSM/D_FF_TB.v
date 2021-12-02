`timescale 1ns/1ps
// FPGA projects using Verilog/ VHDL 
// fpga4student.com
// Verilog code for D Flip FLop
// Testbench Verilog code for verification
module tb_DFF();
reg D;
reg clk;
reg reset;
wire Q;
reg en;

D_Flip_Flop dut(Q,D,clk,reset, en);

initial begin
    en=1;
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
 reset=1;
 D <= 0;
 #100;
 reset=0;
 D <= 1;
 #100;
 D <= 0;
 #100;
 D <= 1;
end 
endmodule 
