`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2019 16:15:01
// Design Name: 
// Module Name: Debounce
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


module Debounce(
    input clk,
    input dat,
    output reg Ddat

    );
    reg A = 0;
    reg B =0;
    
    always@(posedge clk)  begin
        A<= dat;
        B <= A;
        Ddat <= B;
    end
    
    
    
    
endmodule
