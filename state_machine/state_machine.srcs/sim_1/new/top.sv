//`timescale 1ns / 1ps
`include "uvm_macros.svh" //basic uvm macros

import uvm_pkg::*; //contains basis component classes

module top();

    our_interface intf(); //instantiated interface

    our_design_unit uut(); //instantiate design
    
    initial begin
        uvm_config_db #(virtual our_interface)::set(null, "*", "intf", intf); //set method
    end
    
    initial begin
        run test("our test");
    end
    
    
    
endmodule












