`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 09:07:31 AM
// Design Name: 
// Module Name: clockdivider
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


module clockdivider(
    input clk,
    output reg newclk = 0
    );
    
    integer num = 0;
    
always @(posedge clk) begin
    if (num == 1000)begin
        num <= 0;
        newclk <= ~newclk;
    end
    else
        num <= num + 1;
end
endmodule
