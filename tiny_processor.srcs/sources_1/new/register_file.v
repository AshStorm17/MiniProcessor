`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 16:35:21
// Design Name: 
// Module Name: register_file
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


module register_file(ADDR,REG);
parameter n = 8;
parameter m = 16;
input [$clog2(m)-1:0]ADDR;
output [n-1:0]REG;
reg [n-1:0]R[m-1:0];

genvar i;
generate
for(i = 0; i < m; i=i+1) 
    begin:Reg
    initial begin
        R[i] = i+1;
        end
    end 
endgenerate

assign REG = R[ADDR];

endmodule