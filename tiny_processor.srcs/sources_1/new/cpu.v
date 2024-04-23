`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 20:58:31
// Design Name: 
// Module Name: cpu
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


module cpu(CLK,RST,H,CB,AC,C);
input CLK,RST;
input H;
output CB;
output [7:0]AC;
output C;

wire slow_CLK;
clock_divider slower(.main_clk(CLK),.slow_clk(slow_CLK));

reg [3:0]PC;
wire[7:0]IR;
reg [7:0]opcode;

reg [3:0]op_alu;
reg [3:0]add_reg;

wire [7:0]ER;
wire [7:0]DR;
reg [7:0]AR;
reg E;
wire CN;
reg L;

assign C = slow_CLK;

// State definitions
parameter FETCH=2'b00,DECODE=2'b01,EXECUTE=2'b10,HALTED=2'b11;
reg [1:0]state;

wire x;
//Calling modules
regn_file readnwrite(.CLK(CLK),.EN(E),.addr(add_reg),.AR(AR),.DR(DR));
and(x,CLK,state[1],~state[0]);
memory mem(.PC(PC),.IR(IR));
alu operator(.CLK(x),.RST(RST),.L(L),.DR(DR),.opcode(op_alu),.addr(add_reg),.CB(CB),.acc(AC),.ext(ER));

//State Logic
always @(posedge CLK or negedge RST)
begin
if(RST==0)
begin
    PC <= 0;
    opcode <= 8'b00000000;
    state <= FETCH;
    AR <= 8'b00000000;
end
else
begin
    case(state)
    FETCH: begin
        if(H) begin
        state <= HALTED;
        end
        else begin
        opcode <= IR;
        state <= DECODE;
        end
        end
    DECODE: begin
        op_alu <= opcode[7:4];
        add_reg <= opcode[3:0];
        casex(opcode)
        8'b11111111: begin
            state <= HALTED;
            end
        8'b1000xxxx: begin
            E = 0;
            if(CB) begin
            PC <= add_reg;
            state <= FETCH;
            end
            else begin
            PC <= PC + 1;
            state <= FETCH;
            end
            end
        8'b1001xxxx: //Write Ri to AC
            begin
            L = 1;
            E = 0;
            PC <= PC + 1;
            state = FETCH;
            end
        8'b1010xxxx: //Write AC to Ri
            begin
            AR = AC;
            E = 1;
            PC <= PC + 1;
            state <= FETCH;
            end
        default: begin
            E = 0;
            PC <= PC + 1;
            state <= EXECUTE;
            end
        endcase
        end
    EXECUTE: begin
        state <= FETCH;
        end
    HALTED: $finish();
    endcase
end
end

endmodule
