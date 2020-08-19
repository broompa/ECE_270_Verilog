`timescale 1ns / 1ps

module clockP(
    input clk,
    input btn,
    input clr,
    output pulse

    );
    reg FF1_reg, FF2_reg, FF3_reg;
    reg FF1_next , FF2_next , FF3_next;
    
    always@(posedge clk) begin
        FF1_reg <= FF1_next;
        FF2_reg <= FF2_next;
        FF3_reg <= FF3_next;
    end
    
    always@(*)
        FF1_next = btn|clr;
    always@(*)
        FF2_next = FF1_reg;
    always@(*)
        FF3_next = FF2_reg;
    
    
    assign pulse = FF1_reg & FF2_reg &~FF3_reg;
    
endmodule
