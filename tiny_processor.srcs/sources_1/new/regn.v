`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 17:08:04
// Design Name: 
// Module Name: regn
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


module regn(R,Rin,CLK,Q);
parameter n = 8;
input R;
input Rin, CLK;
output Q;
reg Q;
always @(posedge CLK)
if (Rin)
Q <= R;
endmodule
