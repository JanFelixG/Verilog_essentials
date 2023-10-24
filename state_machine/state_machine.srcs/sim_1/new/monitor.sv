class our_monitor extends uvm_monitor; //inherit from uvm_driver-class

    `uvm_component_utils(our_monitor) //name of our monitor_class, registers class with factory

    our_interface intf; //instantiated interface
    our_packet pkt;

    //build port
    uvm_analysis_port #(our_packet) mon_port;  //our_packet

    //constructor class
    function new(string name = "our_monitor", uvm_component parent = null);
        super.new(name,parent);
    endfunction: new

    //build phase
    function void build_phase(uvm_phase phase);
        //build further components
        pkt = our_packet::type_id::create("Our packet");
        
        uvm_config_db #(virtual our_interface)::get(null, "*", "intf", intf); //get method    
        
        mon_port = new("Monitor port", this);    
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //ncessary connections
    endfunction    
    
    task run_phase(uvm_phase phase);
        //main logic
        forever begin
            @(posedge intf.clk);
                pkt.input_1 <= intf.input_1;
                pkt.input_1 <= intf.input_1;
        end
    
    endtask
    
    
endclass: our_monitor