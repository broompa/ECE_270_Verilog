`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2019 23:54:49
// Design Name: 
// Module Name: _4bitAdder
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


module _4BitAdder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] S,
    output Cout
    );
    
    wire [2:0]Carry;
    Adder a1( .A(A[0]),.B(B[0]), .Cin(1'b0),.Cout(Carry[0]),.S(S[0]) ); 
    Adder a2( .A(A[1]),.B(B[1]), .Cin(Carry[0]),.Cout(Carry[1]),.S(S[1]) );
    Adder a3( .A(A[2]),.B(B[2]), .Cin(Carry[1]),.Cout(Carry[2]),.S(S[2]) ); 
    Adder a4 (.A(A[3]),.B(B[3]), .Cin(Carry[2]),.Cout(Cout),  .S(S[3]) );   
endmodule
