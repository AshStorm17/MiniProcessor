`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 20:58:43
// Design Name: 
// Module Name: memory
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


module memory(PC,IR);
input [3:0]PC;
output [7:0]IR;

reg [7:0]ins_set[15:0];

initial 
begin
// Manually initialize each element of the instruction set
    ins_set[0] = 8'b10010111; 
    ins_set[1] = 8'b00000000; 
    ins_set[2] = 8'b00000010; 
    ins_set[3] = 8'b00000110; 
    ins_set[4] = 8'b00000111; 
    ins_set[5] = 8'b00000100; 
    ins_set[6] = 8'b00000001; 
    ins_set[7] = 8'b10100111; 
    ins_set[8] = 8'b01001000; 
    ins_set[9] = 8'b01010010; 
    ins_set[10] = 8'b01110110; 
    ins_set[11] = 8'b10010111; 
    ins_set[12] = 8'b10100101; 
    ins_set[13] = 8'b11111111; 
    ins_set[14] = 8'b00000000; 
    ins_set[15] = 8'b00000000; 
end

//initial
//begin
//$readmemb("instruction.mem", ins_set);
//end

assign IR = ins_set[PC];

endmodule
