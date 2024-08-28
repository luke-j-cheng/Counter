`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 12:34:48 PM
// Design Name: 
// Module Name: FlipFlop
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


module FlipFlop(clk, qbar, d, q);

input wire d;
input clk;
output reg q, qbar;

always @(posedge clk)begin
    q <= d;
    qbar <= ~q;
end

endmodule
