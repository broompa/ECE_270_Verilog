`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2019 21:44:34
// Design Name: 
// Module Name: _3BitAdder
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


module _3BitAdder(
    input [2:0] A,
    input [2:0] B,
    output [2:0] S,
    output Cout
    );
    
    wire [2:0]Carry = 3'b000;
    Adder a1( .A(A[0]),.B(B[0]), .Cin(0),.Cout(Carry[0]),.S(S[0]) ); 
    Adder a2( .A(A[1]),.B(B[1]), .Cin(Carry[0]),.Cout(Carry[1]),.S(S[1]) );
    Adder a3( .A(A[2]),.B(B[2]), .Cin(Carry[1]),.Cout(Cout),.S(S[2]) );    
endmodule
