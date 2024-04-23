`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 18:32:23
// Design Name: 
// Module Name: cpu_tb
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


module cpu_tb();
reg CLK;
reg RST;
reg H;
wire CB;
wire [7:0]AC;

cpu uut(CLK,RST,H,CB,AC);

initial
begin
CLK = 0;
forever#5 CLK = ~CLK;
end

initial
begin
RST=0;H=0;
//AR=4'b0010;
#10
RST=1;
#10
RST=0;
#10
RST=1;
#10
#10
#10
#10
#10
#10
#10
H=1;
end

endmodule
