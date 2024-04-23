`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2024 15:35:39
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
reg CLK, RST;
reg L;
reg [7:0]DR;
reg [3:0]opcode,addr;
wire CB;
wire [7:0]acc;
wire [7:0]ext;

alu uut(CLK,RST,L,DR,opcode,addr,CB,acc,ext);

initial
begin
CLK = 0;
forever#5 CLK = ~CLK;
end

initial
begin
RST=0;opcode=4'b1001;addr=4'b0111;L=0;DR=8'b00100100;
#10
RST=1;
#10
opcode=4'b0000;addr=4'b0000;
#10
opcode=4'b0000;addr=4'b0110;DR=8'b00100111;
#10
opcode=4'b0111;addr=4'b0110;
#10
opcode=4'b0000;addr=4'b0001;
#10
opcode=4'b1010;addr=4'b0111;DR=8'b00100000;
#10
opcode=4'b0000;addr=4'b0010;
#10
opcode=4'b0100;addr=4'b1000;
#10
opcode=4'b0101;addr=4'b0010;
#10
opcode=4'b1001;addr=4'b0111;DR=8'b01100100;
#10
opcode=4'b0000;addr=4'b0111;
#10
opcode=4'b0000;addr=4'b0100;DR=8'b00100000;
#10
opcode=4'b1010;addr=4'b0101;L=1;
#10
opcode=4'b0000;addr=4'b0111;L=0;
#10
$finish();
end
endmodule
