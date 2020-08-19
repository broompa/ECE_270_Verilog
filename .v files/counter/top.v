`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2019 12:00:49
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input clr,
    output [3:0] anode,
    output [7:0] cathode

    );
    
    
    wire clk_5M;
    clk_wiz_0 clk_gen_5M(.clk_out1(clk_out1),.clk_in1(clk_in1));
      
    wire clk_4,clk_3,clk_2,clk_1, clk_1k;
    wire [3:0] count1 , count2 , count3, count4;
    
    clkDivision #(5000) u0(.clk_out(clk_1k),.clk_in(clk_5M));// 1000 Hz
    clkDivision #(1000000) u1(.clk_out(clk_1),.clk_in(clk_5M));// 5 Hz
    clkDivision #(500000) u2(.clk_out(clk_2),.clk_in(clk_5M));// 10 hz
    clkDivision #(333333) u3(.clk_out(clk_3),.clk_in(clk_5M)); // 15 hz
    clkDivision #(250000) u4(.clk_out(clk_4),.clk_in(clk_5M)); // 20 hz
    
        
    
    counter c1 (.clk(clk_1),.reset(clr),.count(count1));
    counter c2 (.clk(clk_2),.reset(clr),.count(count2));
    counter c3 (.clk(clk_3),.reset(clr),.count(count3));
    counter c4 (.clk(clk_4),.reset(clr),.count(count4));
    
    sevenSegment s1(.clk(clk_1k),.ones(count4),.tens(count3),.hundreds(count2),.thousands(count1),.cathode(cathode),.anode(anode));
     
    
endmodule
