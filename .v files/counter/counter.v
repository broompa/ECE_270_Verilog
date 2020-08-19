`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2019 11:02:14
// Design Name: 
// Module Name: counter
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

////////////Mod - 10 decade up counter 
module counter(
    input clk,
    input reset,
    output [3:0] count
    );
    
    reg [3:0] count_reg =0;
    reg [3:0] count_next =0;
    
    
    
    always@(*)
    begin
    count_next = count_reg +1 ;
    end
    
    always@ (posedge clk)
    begin
    if (reset || count_next==10)
        count_reg = 0;
    else 
        count_reg = count_next;
    end 
    
    assign count = count_reg;      
    
    
    
    
    
    
endmodule
