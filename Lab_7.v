`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 01:41:36 PM
// Design Name: 
// Module Name: Lab_7
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

module Mealy(input P0,P1,clk,reset,output reg z);
    parameter S0=0, S1=1, S2=2, S3=3;
    reg [1:0] PS,NS;

    always @(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0;   
            else    
                PS <= NS;
        end             

    always@(*)
        begin   
            z=0;
            case(PS)
                S0: begin 
                    if (P1)
                        NS = S1;
                    else if (P0)
	                    NS = S0;
	                 else
	                    NS = S0;
                     end
                S1: begin 
                    if (P1)
                        NS = S2;
                    else if (P0)
                        NS = S0;
	                 else
	                    NS = S1;
                     end
                S2: begin 
                    if (P0)
                        NS = S3;
                    else if (P1)
                        NS = S1;
	                 else
	                    NS = S2;
                    end 
                S3: begin 
                    if (P1) begin
                        NS = S1;
                        z=1;
                        end
                    else if (P0)
                        NS = S0; 
	                else
	                    NS = S3;
                    end
            endcase
        end
        
//    always @ (PS)
//        begin
//        case (PS)
//            S0 : z = 0;
//            S1 : z = 0;
//            S2 : z = 0;
//            S3 : begin if (P1)
//                    z = 1;
//                 end
          
//        endcase
//        end
endmodule

module Moore(input P0,P1,clk,reset,output reg z);
    parameter S0=0, S1=1, S2=2, S3=3, S4=4;
    reg [2:0] PS,NS;

    always @(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0;   
            else    
                PS <= NS;
        end             

    always@(PS or P1 or P0)
        begin   
            case(PS)
                S0: begin 
                    z=0;
                    if (P1)
                        NS = S1;
                    else if (P0)
	                    NS = S0;
	                 else
	                    NS = S0;
                     end
                S1: begin 
                    if (P1)
                        NS = S2;
                    else if (P0)
                        NS = S0;
	                 else
	                    NS = S1;
                     end
                S2: begin 
                    if (P0)
                        NS = S3;
                    else if (P1)
                        NS = S1;
	                 else
	                    NS = S2;
                    end 
                S3: begin 
                    if (P0)
                        NS = S4;
                    else if (P1)
                        NS = S1; 
	                else
	                    NS = S3;
                    end
                S4: begin
                    if (P0)
                        NS = S0;
                    else if (P1)
                        NS = S1;
	                 else
	                    NS = S4;
                    end
            endcase
        end
        
    always @ (PS)
        begin
        case (PS)
            S0 : z = 0;
            S1 : z = 0;
            S2 : z = 0;
            S3 : z = 0;
            S4 : z = 1;
        endcase
        end
endmodule


module Debouncer(input RAW, input clk, output reg CLEAN);
    //internal counter and TC signal
    reg[2:0] counter;
    wire TC;
    
    //reset and increment counter
    always @(posedge clk) begin
        if (~RAW)
            counter <= 3'b000;
        else
            counter <= counter + 3'b001;
    end
    
    assign TC = (counter==3'b111);
    
    //change output signal
    //when counter reches max
    always @(posedge clk) begin
        if (~RAW)
            CLEAN <= 1'b0;
        else if (TC)
            CLEAN <= 1'b1;
    end
endmodule