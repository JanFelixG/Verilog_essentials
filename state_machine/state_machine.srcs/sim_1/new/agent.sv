class our_agent extends uvm_agent; //inherit from uvm_env-class

    `uvm_component_utils(our_agent) //name of our agent_class, registers class with factory
    //instantiate classes
    our_sequencer seqr;
    our_driver drv;
    our_monitor mon;
    
    //constructor class
    function new(string name = "our_agent", uvm_component parent = null);
        super.new(name,parent);
    endfunction: new

    //build phase
    function void build_phase(uvm_phase phase);
        //build further components
        seqr = our_sequencer::type_id::create("seqr", this); //create sequencer
        drv = our_driver::type_id::create("drv", this); //create driver
        mon = our_monitor::type_id::create("mon", this); //create monitor
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //ncessary connections
        drv.seq_item_port.connect(seqr.seq_item_export); //.name_of_port
    endfunction    
    
    task run_phase(uvm_phase phase);
        //main logic
    
    endtask


endclass: our_agent