`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 09:18:28 AM
// Design Name: 
// Module Name: scorekeeper
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


module scorekeeper(
    input wire clk,
    input wire [2:0] switch,
    input wire btn,
    input wire rst,
    output reg [3:0] ones = 0,
    output reg [3:0] tens = 0,
    output reg [3:0] hundreds = 0
    );
    
    always @(posedge btn or posedge rst)begin
        if (rst)begin
            ones <= 4'd0;
            tens <= 4'd0;
            hundreds <= 4'd0;
        end   
        else begin
        
        case(switch)
        3'b001 : begin
            if (ones == 9)begin
                ones <= 0;
                if (tens == 9)begin
                    tens <= 0;
                    hundreds <= hundreds + 1;
                end
                else
                    tens <= tens + 1;
            end
            else
                ones <= ones + 1;
        end
        
        
        3'b010 : begin
        if (ones == 8) begin
                ones <= 0;
                if (tens == 9)begin
                    tens <= 0;
                    hundreds <= hundreds + 1;
                end
                else
                    tens <= tens + 1;
        end
        else if (ones == 9) begin
                ones <= 1;
                if (tens == 9)begin
                    tens <= 0;
                    hundreds <= hundreds + 1;
                end
                else
                    tens <= tens + 1;
        end
        else
            ones <= ones + 2;
        end
        
        
        3'b100 : begin
            if (ones == 7) begin
                    ones <= 0;
                    if (tens == 9)begin
                        tens <= 0;
                        hundreds <= hundreds + 1;
                    end
                    else
                        tens <= tens + 1;
            end
            else if (ones == 8) begin
                    ones <= 1;
                    if (tens == 9)begin
                        tens <= 0;
                        hundreds <= hundreds + 1;
                    end
                    else
                        tens <= tens + 1;
            end
            else if (ones == 9) begin
                    ones <= 2;
                    if (tens == 9)begin
                        tens <= 0;
                        hundreds <= hundreds + 1;
                    end
                    else
                        tens <= tens + 1;
            end
            else
                ones <= ones + 3;
    
        end
        
        3'b111 : begin
            if (ones == 0)begin
                if (tens ^ hundreds) begin
                    ones <= 9;
                    if (tens == 0) begin
                        tens <= 9;
                        hundreds <= hundreds - 1;
                    end
                else
                    tens <= tens - 1;
                end
            end
            else
                ones <= ones -1;
           
        end
    endcase
    end
end
endmodule
