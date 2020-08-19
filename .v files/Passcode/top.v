`timescale 1ns / 1ps
module top(
    input clk,
    inout[7:0] JA,
    output [7:0] cathode,
    output [3:0] anode,
    input btn ,
    input clr );
    reg show;
    wire [3:0]val ;
    wire flag, clk_200H,correct;
    wire [2:0] state;
    wire pulse1, pulse2; // pulse 1 for fsm , pulse 2 for btn  
    
    
    
    
    Decoder d1(.clk(clk), .Row(JA[7:4]) , .Col(JA[3:0]),.out(val),.Fl(flag));
    clk_div c1(.clk_in(clk),.clk_out(clk_200H));
    Fsm f1(.clk(pulse1), .clr(clr) , .din(val), .correct(correct),.prs_state(state),.show(show));
    clockP c2(.clk(clk_200H), .btn(btn),.clr(clr),.pulse(pulse2));
  clockP c3(.clk(clk_200H), .btn(flag),.pulse(pulse1));
  
  
  
  always@(posedge pulse2) begin
    if (clr)
        show = 1'b0;
    else if (btn)
        show = 1'b1;
  end
  sevenSeg s(.clk(clk_200H) ,.cathode(cathode),.anode(anode), .state(state),.correct(correct),.show(show) );
  
  
  
  
  
    
    
    
    
    
endmodule
