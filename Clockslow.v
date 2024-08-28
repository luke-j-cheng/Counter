`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 08:45:46 PM
// Design Name: 
// Module Name: Clockslow
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


module Clockslow(
    input clk,
    output reg newclk = 0
    );
    
    integer num = 0;
    
always @(posedge clk) begin
    if (num == 250_000)begin
        num <= 0;
        newclk <= ~newclk;
    end
    else
        num <= num + 1;
end
endmodule
