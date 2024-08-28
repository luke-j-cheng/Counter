`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 04:24:12 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input btn,
    input clk,
    output wire btnsig
    );
    
    wire q0, q1, q2;
    
    FlipFlop zero(
    .clk(clk),
    .d(btn),
    .q(q0));
    
    
    FlipFlop one(
    .clk(clk),
    .d(q0),
    .q(q1));
    
    FlipFlop two(
    .clk(clk),
    .d(q1),
    .qbar(q2));
    
    assign btnsig = q2 & q1;
        
    
endmodule
