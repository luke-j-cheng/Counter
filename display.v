`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 09:32:45 AM
// Design Name: 
// Module Name: display
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


module display(
    input clk,
    input [3:0] ones,
    input [3:0] tens,
    input [3:0] hundreds,
    output reg [3:0] digit = 0,
    output reg [6:0] number = 0    
    );
    
    reg [1:0] digcontrol = 0;
    reg [6:0] oneval, tenval, hunval;
    
    parameter digzero = 7'b1000000;
    parameter digone = 7'b1111001;
    parameter digtwo = 7'b0100100;
    parameter digthree = 7'b0110000;
    parameter digfour = 7'b0011001;
    parameter digfive = 7'b0010010;
    parameter digsix = 7'b0000010;
    parameter digseven = 7'b1111000;
    parameter digeight = 7'b0000000;
    parameter dignine = 7'b0011000;
    
    always@ (ones)
    begin
        case(ones)
            4'd0 : oneval = digzero;
            4'd1 : oneval = digone;
            4'd2 : oneval = digtwo;
            4'd3 : oneval = digthree;
            4'd4 : oneval = digfour;
            4'd5 : oneval = digfive;
            4'd6 : oneval = digsix;
            4'd7 : oneval = digseven;
            4'd8 : oneval = digeight;
            4'd9 : oneval = dignine;
         endcase
     end
    
    
    always@ (tens)
    begin
        case(tens)
            4'd0 : tenval = digzero;
            4'd1 : tenval = digone;
            4'd2 : tenval = digtwo;
            4'd3 : tenval = digthree;
            4'd4 : tenval = digfour;
            4'd5 : tenval = digfive;
            4'd6 : tenval = digsix;
            4'd7 : tenval = digseven;
            4'd8 : tenval = digeight;
            4'd9 : tenval = dignine;
         endcase
     end
    
    
    always@ (hundreds)
    begin
        case(hundreds)
            4'd0 : hunval = digzero;
            4'd1 : hunval = digone;
            4'd2 : hunval = digtwo;
            4'd3 : hunval = digthree;
            4'd4 : hunval = digfour;
            4'd5 : hunval = digfive;
            4'd6 : hunval = digsix;
            4'd7 : hunval = digseven;
            4'd8 : hunval = digeight;
            4'd9 : hunval = dignine;
         endcase
     end

            
            
        
    always @(posedge clk)begin
        digcontrol = digcontrol + 1;
        case(digcontrol)
            2'b00 : begin number = oneval; digit = 4'b1110; end
            2'b01 : begin number = tenval; digit = 4'b1101; end
            2'b10 : begin number = hunval; digit = 4'b1011; end
            2'b11 : begin number = 7'b1000000; digit = 4'b0111; end
        endcase
    end
    
    
    
    
    
endmodule
