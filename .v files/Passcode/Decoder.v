`timescale 1ns / 1ps
module Decoder(
    input clk,
    input [3:0] Row ,
    output reg[3:0] Col,
    output reg [3:0] out,
    output wire Fl
 

    );
    reg [19:0] sclk = 0;
    reg [19:0] sclk_prev  =0;
    reg F =0;
    
    always@(posedge clk) begin
        if (sclk == 20'b00011000011010100000) begin
            Col = 4'b0111;
            sclk = sclk +1'b1;
            end
        else if (sclk == 20'b00011000011010101000) begin
            if ( Row == 4'b0111) begin
                out = 4'b0001;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row ==  4'b1011)   begin
                out = 4'b0100;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row == 4'b1101)  begin
                out = 4'b0111;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row == 4'b1110)    begin
                 out = 4'b0000;
                 F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                 end
            else if (sclk_prev==sclk) begin
                F = 1'b0;
            end
            sclk =sclk+1'b1;
            end
        else if (sclk == 20'b00110000110101001000) begin
            Col = 4'b1011;
            sclk = sclk +1'b1;
            end
        else if (sclk == 20'b00110000110101010000) begin
            if ( Row == 4'b0111) begin
                out = 4'b0010;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row ==  4'b1011)   begin
                out = 4'b0101;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row == 4'b1101)  begin
                out = 4'b1000;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row == 4'b1110)    begin
                 out = 4'b1111;
                 F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                 end
            else if (sclk_prev==sclk) begin
                F = 1'b0;
            end
            sclk =sclk+1'b1;
            end
        else if (sclk == 20'b01001001001111110000) begin
            Col = 4'b1101;
            sclk = sclk +1'b1;
            end
        else if (sclk == 20'b01001001001111111000) begin
            if ( Row == 4'b0111) begin
                out = 4'b0011;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row ==  4'b1011)   begin
                out = 4'b0110;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row == 4'b1101)  begin
                out = 4'b1001;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row == 4'b1110)    begin
                 out = 4'b1110;
                 F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                 end
            else if (sclk_prev==sclk) begin
                F = 1'b0;
            end
            sclk =sclk+1'b1;
            end
        else if (sclk == 20'b01100001101010011000) begin
            Col = 4'b1110;
            sclk = sclk +1'b1;
        end
        else if (sclk == 20'b01100001101010100000) begin 
            if ( Row == 4'b0111) begin
                out = 4'b1010;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row ==  4'b1011)   begin
                out = 4'b1011;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row == 4'b1101)  begin
                out = 4'b1100;
                F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                end
            else if (Row == 4'b1110)    begin
                 out = 4'b1101;
                 F = 1'b1;
                sclk_prev = sclk ;
                sclk = sclk + 1'b1;
                 end
            else if (sclk_prev==sclk) begin
                F = 1'b0;
            end
            sclk =sclk+1'b1;
            end
         else begin 
            sclk = sclk +1'b1;
            
            end
 end
            
 assign Fl =F;
    
    
endmodule
