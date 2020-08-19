`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2019 10:48:34
// Design Name: 
// Module Name: sevenSeg
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


module sevenSeg(
    input clk ,
    output [7:0] cathode,
    output [3:0] anode,
    input [2:0] state,
    input correct,
    input show 

    );
    
       reg [6:0] st;
    reg [1:0] num ;
    reg [6:0]cathode_t;
    reg [3:0] anode_t;   
    reg [6:0] ct;
    
    always@(posedge clk) begin
        num = num + 1'b1;
    end
    
    
    always@(*) begin
        case (num)
        2'b00:
            begin
                if (show==1'b1 && state == 3'b011  ) begin
                    cathode_t = 7'b0100100;
                    anode_t = 4'b1110;end
                else if (show == 1'b1 && state == 3'b111 ) begin
                    cathode_t = 7'b1110001;
                    anode_t = 4'b1110;end
                else if (show == 1'b1) begin
                    cathode_t = 7'b1010101;
                    anode_t = 4'b1110;end
                else begin
                    cathode_t = 7'b1111111;
                    anode_t = 4'b1110;end
            end
        2'b01:
            begin
                if (show==1'b1 && state == 3'b011  ) begin
                    cathode_t = 7'b0100100;
                    anode_t = 4'b1101;end
                else if (show == 1'b1 && state == 3'b111 ) begin
                    cathode_t = 7'b1001111;
                    anode_t = 4'b1101;end
                else if (show == 1'b1) begin
                    cathode_t = 7'b0001001;
                    anode_t = 4'b1101;end
                else begin
                    cathode_t = 7'b1111111;
                    anode_t = 4'b1101;end
            end
         2'b10:
            begin
                if (show==1'b1 && state == 3'b011 ) begin
                    cathode_t = 7'b0001000;
                    anode_t = 4'b1011;end
                else if (show == 1'b1 && state == 3'b111 ) begin
                    cathode_t = 7'b0001000;
                    anode_t = 4'b1011;end
                else if (show == 1'b1) begin
                    cathode_t = 7'b1001111;
                    anode_t = 4'b1011;end
                else begin
                    cathode_t = 7'b1111111;
                    anode_t = 4'b1011;end
            end
          2'b11:
            begin
                if (show==1'b1 && state == 3'b011 ) begin
                    cathode_t = 7'b0011000;
                    anode_t = 4'b0111;end
                else if (show == 1'b1 && state == 3'b111 ) begin
                    cathode_t = 7'b0111000;
                    anode_t = 4'b0111;end
                else if (show == 1'b1) begin
                    cathode_t = 7'b1111111;
                    anode_t = 4'b0111;end
                else begin
                    cathode_t = 7'b1111111;
                    anode_t = 4'b0111;end
            end
        endcase
        end
    
    
 
    always@(*) begin
         case(state)
                3'd0 : st = 7'b0000001; //to display 0
                3'd1 : st = 7'b1001111; //to display 1
                3'd2 : st = 7'b0010010; //to display 2
                3'd3 : st = 7'b0000110; //to display 3
                3'd4 : st = 7'b1001100; //to display 4
                3'd5 : st = 7'b0100100; //to display 5
                3'd6 : st = 7'b0100000; //to display 6
                3'd7 : st = 7'b0001111; //to display 7
                default : st = 7'b1111111; 
           endcase
    end
assign cathode = {cathode_t,1'b1};
assign anode = anode_t;     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
