`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 00:41:02
// Design Name: 
// Module Name: regn_tb
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


module regn_tb();
reg CLK;
reg EN;
reg [3:0]addr;
reg [7:0]AR;
wire [7:0]DR;

regn_file uut(CLK,EN,addr,AR,DR);

initial
begin
CLK = 0;
forever#5 CLK = ~CLK;
end

initial
begin
EN=0;addr=8;AR=8'b00010001;
#10;
EN=0;addr=5;
#10;
EN=1;addr=2;
#10;
EN=0;addr=13;AR=8'b00011101;
#10;
EN=1;addr=11;
#10;
$finish();
end

endmodule
