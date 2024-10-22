`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 02:09:54 PM
// Design Name: 
// Module Name: Lab_7_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Debouncer_tb();
    reg RAW_tb;
    wire CLEAN_tb;
    reg clk;
    
    Debouncer dut(RAW_tb, clk, CLEAN_tb);
    
    always #5 clk=~clk;
    
    initial begin
        clk = 0;
        RAW_tb = 0;
        #10 RAW_tb = 1;
        #5 RAW_tb = 0;
        #10 RAW_tb = 1;
        #20 RAW_tb = 0;
        #10 RAW_tb = 1;
    end
endmodule

module Moore_tb();
    reg P0, P1, clk, reset;
    wire z;
    
    Moore uut(P0, P1, clk, reset, z);
    
    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
     end
     
     always #5 clk = ~clk;
     
     initial begin
     #20 P0 = 0; P1 = 1;
     #10 P0 = 0; P1 = 1;
     #10 P0 = 1; P1 = 0;
     #10 P0 = 1; P1 = 0;
     #10 P0 = 0; P1 = 1;
     #10 P0 = 1; P1 = 0;
       /* #40 P0 = 0; P1 = 1;
        #20 P0 = 0; P1 = 0;
        #20 P0 = 0; P1 = 1;
        #20 P0 = 0; P1 = 0;
        #20 P0 = 1; P1 = 0;
        #20 P0 = 0; P1 = 0;
        #20 P0 = 1; P1 = 0;
        #20 P0 = 0; P1 = 0;*/
     end
endmodule

module Mealy_tb();
    reg P0, P1, clk, reset;
    wire z;
    
    Mealy uut(P0, P1, clk, reset, z);
    
    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
     end
     
     always #5 clk = ~clk;
     
     initial begin
     #20 P0 = 0; P1 = 1;
     #10 P0 = 0; P1 = 1;
     #10 P0 = 1; P1 = 0;
     #10 P0 = 0; P1 = 1;
     #10 P0 = 1; P1 = 0;
     #10 P0 = 0; P1 = 1;
       /* #40 P0 = 0; P1 = 1;
        #20 P0 = 0; P1 = 0;
        #20 P0 = 0; P1 = 1;
        #20 P0 = 0; P1 = 0;
        #20 P0 = 1; P1 = 0;
        #20 P0 = 0; P1 = 0;
        #20 P0 = 1; P1 = 0;
        #20 P0 = 0; P1 = 0;*/
     end
endmodule