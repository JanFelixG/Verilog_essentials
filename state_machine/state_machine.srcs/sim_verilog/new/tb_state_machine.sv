`timescale 1ns / 1ps //1ns-timescale, round to picoseconds#
const int clockperiod = 10;

module tb_state_machine();

reg r_clk = 1'b0;
reg r_rst, r_start = 1'b0;
reg [1:0] r_leds;

//Instantiate the uut gate
state_machine uut (
.i_clk(r_clk),
.i_rst(r_rst),
.i_start(r_start),
.o_leds(r_leds)
);

//Clock generation
initial begin
    forever #10 r_clk = ~r_clk;
end
//Stimulus generation
initial begin
    #50
    r_rst = 1'b1;
    #50
    r_rst = 1'b0;
    #50
    r_start = 1'b1;
    #50
    r_start = 1'b0;
    
    //generate next sample
    #200
    r_start = 1'b1;
    #200
    r_rst = 1'b1;    
end

endmodule