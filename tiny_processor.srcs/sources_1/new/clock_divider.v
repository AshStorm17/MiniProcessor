`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2024 03:36:36
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(main_clk,slow_clk);
input main_clk;
output slow_clk;

reg [31:0]counter;

always @(posedge main_clk)
begin
    counter <= counter + 1;
end

assign slow_clk = counter[27];

endmodule
