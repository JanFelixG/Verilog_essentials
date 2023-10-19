//`timescale 1ns / 1ps //not needed here

module state_machine(
input i_clk,
input i_rst,
input i_start,
output reg [1:0] o_leds
);
//define custome types here
enum {start,state0,state1,state2} currState, nextState;
//define registers here

//define wires here

//first process here
//change state on each clock cycle
always_ff @(posedge i_clk) begin : currStateRegs
if (i_rst == 1) begin
    currState <= start;
end 
else begin
    currState <= nextState;
end
end : currStateRegs

//second process here
//define how to switch between states
always_comb begin : nextStateLogic
nextState = currState; // default is to stay in current state
unique case (currState)
    start   : if (i_start == 1) nextState = state0;
    state0 : nextState = state1;
    state1 : nextState = state2;
    state2 : nextState = start;
endcase
end : nextStateLogic

//3rd process here
//assign outputs here
always_comb begin : led_logic
nextState = currState; // default is to stay in current state
unique case (currState)
    start  : o_leds <= 2'b00;
    state0 : o_leds <= 2'b01;
    state1 : o_leds <= 2'b10;
    state2 : o_leds <= 2'b11;
endcase
end : led_logic

endmodule