`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2019 21:44:34
// Design Name: 
// Module Name: Adder
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


module Adder(
        input A,
        input B,
        input Cin,
        output Cout,
        output S
    );
    
    assign S = A^B^Cin;
    assign Cout = (A^B)&Cin | A&B; 
    
    
    
endmodule
