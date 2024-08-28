`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 09:47:45 AM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input btnC,
    input [0:2] sw,
    input btnU,
    output [6:0] seg,
    output [3:0] an,
    output [0:2] led
    );
    
    wire newclk, slowclk;
    wire [3:0] ones, tens, hundreds;
    wire b1, b2, b3;
    
    
    
    clockdivider NewClockGen(
    .clk(clk),
    .newclk(newclk)
    );
    
    Clockslow NewSlowClock(
    .clk(clk),
    .newclk(slowclk));
    
    
    
    debouncer one(
    .btn(btnC),
    .clk(slowclk),
    .btnsig(b1));
    
    
    
    
    scorekeeper Counter(
    .clk(slowclk),
    .switch(sw),
    .btn(b1),
    .rst(btnU),
    .ones(ones),
    .tens(tens),
    .hundreds(hundreds)
    );
    
    display SegControl(
    .clk(newclk),
    .ones(ones),
    .tens(tens),
    .hundreds(hundreds),
    .digit(an),
    .number(seg)
    );
    
    assign led[0] = sw[0];
    assign led[1] = sw[1];
    assign led[2] = sw[2];
    
    
endmodule
