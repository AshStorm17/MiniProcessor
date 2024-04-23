`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 23:23:12
// Design Name: 
// Module Name: memory_tb
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


module memory_tb();
reg [3:0]PC;
wire [7:0]IR;

memory uut(PC,IR);

initial
begin
PC=4;
#10
PC=8;
#10
PC=15;
#10
$finish();
end

endmodule
