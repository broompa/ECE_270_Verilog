`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2019 15:27:11
// Design Name: 
// Module Name: clkDivision
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


module clkDivision
#(
    parameter factor = 5)

(   input wire clk_in,
    output wire clk_out
    
    );
    
    integer count = 0;
    reg value = 0;
    integer count_1 =0;
    integer count_next=0;
    integer count_1_next=0;
    always@(posedge clk_in )
    begin
        count_next <= count +1;
        
        
    end
    always@(negedge clk_in)
    begin
    count_1_next <= count_1+1;
    end
    
    
    always @(*)
    begin 
    if (count+count_1 == factor)
    begin
    count = 0;
    count_1 = 0; 
    value = ~ value;
    end
    else 
        begin
        count = count_next;
        count_1 = count_1_next;
    
    
    end
    
    end

    
    assign clk_out = value;  
      
endmodule
