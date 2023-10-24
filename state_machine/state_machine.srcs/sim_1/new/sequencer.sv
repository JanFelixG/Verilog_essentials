//writing class our_sequencer causes it to not find our_packet
class our_sequencer extends uvm_sequencer #(our_packet);  //inherit from uvm_sequencer-class

    `uvm_component_utils(our_sequencer) //name of our sequencer_class, registers class with factory

    //constructor class
    function new(string name = "our_sequencer", uvm_component parent = null);
        super.new(name,parent);
    endfunction: new

    //build phase
    function void build_phase(uvm_phase phase);
        //build further components
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //ncessary connections
    endfunction    
    
    task run_phase(uvm_phase phase);
        //main logic
    
    endtask
    
    
    
endclass: our_sequencer