`timescale 1ns / 1ps
module Fsm(
    input clk,
    input clr ,
    input[3:0] din,
    output reg correct,
    output reg [2:0] prs_state ,
    input show
    );
    
   
    parameter s0 = 3'b000 , s1 = 3'b001 , s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101 , s6= 3'b110, s7 = 3'b111   ;
     reg [2:0] next_state=s1 ;    
    always@(posedge clk or posedge clr) begin
        if ( clr )
            prs_state<=0;
        else 
            prs_state <= next_state;
    end
    
    always@(prs_state) begin
    
            case(prs_state) 
            s0: begin
                if (din == 4'b1100)
                    next_state = s1;
                else 
                    next_state = s5;
                end
            s1:
                begin
                    if (din==4'b1100)
                        next_state = s2;
                     else 
                        next_state = s6;
                end
            s2:
                begin
                    if(din==4'b1101)
                        next_state = s3;
                    else 
                        next_state = s7; 
                end
            s3: next_state = s4;
            s4: next_state= s4;
            s5: next_state =s6;
            s6:next_state = s7;
            s7: next_state = s4;
            default : next_state = s0;
            endcase
        end
    
    
    
    
    
    
endmodule

