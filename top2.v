`timescale 1ns / 1ps

module top2(
    input clk, // 100 Mhz clock source on Basys 3 FPGA
    input reset, // reset
    input m_dat, // Mouse PS2 data
    input m_clk, // Mouse PS2 Clock
    output reg [3:0] anode, // anode signals of the 7-segment LED display
    output reg [7:0] cathode
    );
    
    
    reg [5:0] bit_count ;
    reg [8:0] data1 ;
    reg [8:0] data2 ;
    
    
    reg idle = 1; // idle state mouse not sending data, just after reset
    reg m_dat_old ; // 1 m_clk latency m_dat
    reg A;
    always@(negedge m_clk) begin
           A <= m_dat;
           m_dat_old <= A;
    end 
   /* always@(negedge m_clk or posedge reset)begin
        if (reset)
            idle = 1'b1;
        else if (m_dat_old == 1'b1 && m_dat==1'b0) begin
            idle = 1'b0;
        end
        else begin
            idle = 1'b1;
        end
    end*/
    
    
    
    
    always @(negedge m_clk or posedge reset ) begin
        if (reset)
            bit_count <= 5'd0;
        else if (bit_count == 5'd32 )// ignoring last stop bit
            bit_count <= 5'd0;
        else if (bit_count == 5'd0 && m_dat_old == 1'b1 && m_dat==1'b0)
            bit_count <= bit_count + 1; 
        else if (bit_count > 5'd0)   
            bit_count <= bit_count + 1;
    end
    
    
    always@(negedge m_clk or posedge reset) begin
        if (reset)
            data1 <= 0;
        else if (bit_count>1 && bit_count<11 ) begin
            data1[bit_count-2] = m_dat;
        end   
    end
    
    
    always@(posedge clk or posedge reset) begin
        if (reset ) 
            data2 <= 0;
        else if (^data1 == 1'b1 )begin 
            data2<= data1;end
        else begin
            data2 <= data2;end
    end
    
    reg [15:0] counter=0;
    always @(posedge clk )begin
        if (data2[0] == 1'b1) 
            counter += 1;
        else if (data2[1]==1'b1 && counter> 0 ) begin
             counter = counter - 1;
     end
     
    wire clk_1k;
    
    clk_div c1 (.clk_in(clk), .clk_out(clk_1k));
    
    sevenSegment s1(
    
        .clk(clk_1k), 
        .ones((((counter)%1000)%100)%10), 
        .tens((((counter)%1000)%100)/10), 
        .hundreds(((counter)%1000)/100), 
        .thousands((counter)/1000),
        .cathode(cathode),
        .anode(anode)
        );
    
    
endmodule
