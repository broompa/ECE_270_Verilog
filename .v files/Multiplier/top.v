`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2019 01:47:46
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
    output [7:0]  cathode,
    output [3:0]  anode ,
    inout [7:0] JB,// pmod port for accessing seven segment
    inout [7:0] JA,
    input clk

    );
    wire [3:0] val ;
    wire[3:0] ones, hundreds, tens,thousands;
    wire [7:0] mulValue; // multiplication value
    reg [3:0] val1;
    reg [3:0] val2;  
    wire Flag;
    reg count =1'b0 ;

    
/*    always@(*) begin
        if (state==0 & reset==0)   begin
            val1=val;
           end
         else if (reset==0 & state==1) begin
            val2=val;
         end
         else begin
            val1 = 4'b0000;
            val2= 4'b0000;
         end
         
    end*/
    wire clk1;

    wire Flag1;
    
    
    always@(posedge Flag1) begin
        if (count==1'b0) begin
            val1 = val;
            val2=0;
            count =1 ;
        end
        else if (count ==1'b1) begin
            val2 = val;
            count =0;
        end
    end
    
    
    
    
    
    clk_div(.clk_in(clk),.clk_out(clk1));
    Decoder d1( .clk(clk),.Row(JA[7:4]) , .Col(JA[3:0]),.out(val),.Fl(Flag));
    Debounce(.clk(clk1),.dat(Flag),.Ddat(Flag1));
    Multiplier m1(.A(val1),.B(val2),.Res(mulValue));    
    binToBcd b1( .number(mulValue),.ones(ones),.hundreds(hundreds),.tens(tens));
    sevenSegment s1( .clk(clk1), .ones(ones), .tens(tens), .hundreds(hundreds), .thousands(thousands),.cathode(cathode),.anode(anode));
    sevenSeg s2( .clk(clk1),.cathode(JB[7]),.anode(JB[6:0]),.val1(val1),.val2(val2));
    
    
endmodule
