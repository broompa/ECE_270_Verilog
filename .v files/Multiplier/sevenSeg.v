`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2019 14:13:50
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
    input clk,
    output  cathode,
    output [6:0]anode,
    input [3:0] val1,
    input [3:0] val2
    );
    
    reg count = 0;
    always@(posedge clk)  begin
        count = count + 1;
    end
        
        
       reg[6:0] anode_t ;
       reg cathode_t;
    
    always@(*)  begin
        case(count)
            1'b0:   begin
                case (val1)     
                    4'd0: anode_t = 7'b0000001;
                    4'd1: anode_t = 7'b1001111;
                    4'd2: anode_t = 7'b0010010;
                    4'd3: anode_t = 7'b0000110;
                    4'd4: anode_t = 7'b0101100;
                    4'd5: anode_t = 7'b0100100;
                    4'd6: anode_t = 7'b0100000;
                    4'd7: anode_t = 7'b0001111;
                    4'd8: anode_t = 7'b0000000;
                    4'd9: anode_t = 7'b0000100;
                    4'hA: anode_t = 7'b0001000;
                    4'hB: anode_t = 7'b1100000;
                    4'hC: anode_t = 7'b0110001;
                    4'hD: anode_t = 7'b1000010;
                    4'hE: anode_t = 7'b0110000;
                    4'hF: anode_t = 7'b0111000;
                    default : anode_t =  7'b1111111;
                 endcase
                 cathode_t=0;            
            end
                
            
            
            
            
            
            
            
            1'b1:   begin
                case (val2)     
                    4'd0: anode_t = 7'b0000001;
                    4'd1: anode_t = 7'b1001111;
                    4'd2: anode_t = 7'b0010010;
                    4'd3: anode_t = 7'b0000110;
                    4'd4: anode_t = 7'b0101100;
                    4'd5: anode_t = 7'b0100100;
                    4'd6: anode_t = 7'b0100000;
                    4'd7: anode_t = 7'b0001111;
                    4'd8: anode_t = 7'b0000000;
                    4'd9: anode_t = 7'b0000100;
                    4'hA: anode_t = 7'b0001000;
                    4'hB: anode_t = 7'b1100000;
                    4'hC: anode_t = 7'b0110001;
                    4'hD: anode_t = 7'b1000010;
                    4'hE: anode_t = 7'b0110000;
                    4'hF: anode_t = 7'b0111000;
                    default : anode_t =  7'b1111111;
                 endcase 
                 cathode_t =1;
                            
            end
        endcase
        
        
        
        
    end
    assign cathode = cathode_t;
    wire [6:0] x = anode_t^{7{1'b1}};
    assign anode = {<<{x}};
        
    
    
    
    
    
    
endmodule
