`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 20:58:19
// Design Name: 
// Module Name: alu
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


module alu(CLK,RST,L,DR,opcode,addr,CB,acc,ext);
input CLK, RST;
input L;
input [7:0]DR;
input [3:0]opcode,addr;
output reg CB;
output reg [7:0]acc;
output reg [7:0]ext;

reg [7:0]div,quo;

integer j;
always @(posedge CLK or negedge RST)
begin
if(RST==0)
begin
    CB <= 0;
    acc <= 8'b00000000;
    ext <= 8'b00000000;
    div <= 8'b00000000;
    quo <= 8'b00000000;
end
else
if(L) begin
    acc = DR;
end
else
begin
    // Decode based on opcode
    case(opcode)
    4'b0000: begin
        case(addr)
        4'b0000:
        begin
        //No operation
        end
        4'b0001: begin
         acc <= acc<<1; //Logical left shift
            end
        4'b0010: 
        begin
            acc <= acc>>1; // Logical right shift
        end
        4'b0011:
        begin
            acc <= {acc[0],acc[7:1]}; //Circular right shift
        end
        4'b0100:
        begin
            acc <= {acc[6:0],acc[7]}; //Circular left shift
        end
        4'b0101: //Arithmetic right shift
        begin
            if(acc[7]==0)
                acc <= acc>>1;
            else
                acc <= {1'b1,acc[7:1]};
        end
        4'b0110: //Increments accumulator by 1 and stores overflow in CB
        begin
        {CB,acc} <= acc + 1;
        end
        4'b0111: //Decrements accumulator by 1 and stores underflow in CB
        begin
        {CB,acc} <= acc - 1;
        end
        default: begin
            end
        endcase
        end
    4'b0001: //Addition
    begin
        {CB, acc} <= acc + DR;
    end
    4'b0010: //Subtraction
    begin
        {CB, acc} <= DR - acc;
    end
    4'b0011: //Multiplication
    begin
        {ext, acc} <= acc * DR;
    end
    4'b0100: //Division
    begin
    if (DR == 0) begin
        // Handle division by zero error
        CB = 1'b1;end
    else begin
        quo = 8'b00000000;
        div = 8'b00000000;
        div = acc;
        for(j=7;j>=0;j=j-1) begin
            quo = quo<<1;
            div = (div<<1)|acc[j];
            CB = 1'b0;
            if(div>=0) begin
                div = div - DR;
                quo[0] = 1;
            end else begin
                div = div + DR;
            end
            acc = quo;
            ext = div;
        end         
    end
    end
    4'b0101: // AND accumulator with register
    begin
        acc <= acc & DR;
    end
    4'b0110: // XOR accumulator with register
    begin
        acc <= acc ^ DR;
    end
    4'b0111: // Compare accumulator with register contents
    begin
        CB = (acc < DR);
    end
    default: begin
        end
    endcase
end
end

endmodule
