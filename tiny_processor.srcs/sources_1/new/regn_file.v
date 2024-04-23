`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2024 16:45:50
// Design Name: 
// Module Name: regn_file
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


module regn_file(CLK,EN,addr,AR,DR);
input CLK;
input EN;
input [3:0]addr;
input [7:0]AR;
output reg [7:0]DR;

reg [7:0]data[15:0];

initial 
begin
// Manually initialize each element of data
    data[0] = 8'b10101000; 
    data[1] = 8'b00101100; 
    data[2] = 8'b00001110; 
    data[3] = 8'b10101100; 
    data[4] = 8'b00100011; 
    data[5] = 8'b00001000; 
    data[6] = 8'b00011010; 
    data[7] = 8'b00110010; 
    data[8] = 8'b00000000; 
    data[9] = 8'b10101110; 
    data[10] = 8'b00111000; 
    data[11] = 8'b00000011; 
    data[12] = 8'b00011100; 
    data[13] = 8'b00000001; 
    data[14] = 8'b00100000; 
    data[15] = 8'b00101011; 
end

//initial
//begin
//$readmemb("data.mem", data);
//end

always @(posedge CLK)
begin
    case(EN)
    1'b1: begin
        data[addr] = AR;
        end
    1'b0: begin
        DR = data[addr];
        end
    default: begin
        end
    endcase
end

//initial
//begin
//$writememb("data.mem", data);
//end

endmodule
