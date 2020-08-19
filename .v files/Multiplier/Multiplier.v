`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2019 21:44:34
// Design Name: 
// Module Name: Multiplier
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


module Multiplier(
    input [3:0] A ,
    input [3:0] B ,
    output [7:0] Res // Result
    );
    
    wire [3:0] Sum1 ;
    wire [3:0] Sum2 ;
    wire [3:0] Sum3 ;
    wire [2:0]  Carry ;
    
   wire [3:0] in1 = {0,A[3]&B[0],A[2]&B[0],A[1]&B[0]};
   wire [3:0] in2 = { B[1]&A[3],B[1]&A[2],B[1]&A[1],B[1]&A[0]};
   
   wire [3:0] in3 = {Carry[0],Sum1[3],Sum1[2],Sum1[1]};
   wire [3:0] in4 = {A[3]&B[2],A[2]&B[2],A[1]&B[2],A[0]&B[2]};
   
   wire [3:0] in5 = {Carry[1],Sum2[3],Sum2[2],Sum2[1]};
   wire [3:0] in6 = {A[3]&B[3],A[2]&B[3],A[1]&B[3],A[0]&B[3]};
   
   _4BitAdder f1(.A(in1),.B(in2),.S(Sum1),.Cout(Carry[0])); 
   _4BitAdder f2(.A(in3),.B(in4),.S(Sum2),.Cout(Carry[1]));
   _4BitAdder f3(.A(in5),.B(in6),.S(Sum3),.Cout(Carry[2]));

    
    assign Res[0] = B[0]&A[0];
    assign Res[1] = Sum1[0];
    assign Res[2] = Sum2[0];
    assign Res[3] = Sum3[0];
    assign Res[4] = Sum3[1];
    assign Res[5] = Sum3[2];
    assign Res[6] = Sum3[3];
    assign Res[7] = Carry[2];
    
     
    
    
    
    
    
    
endmodule
