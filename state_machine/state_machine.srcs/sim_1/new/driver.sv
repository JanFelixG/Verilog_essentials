class our_driver extends uvm_driver #(our_packet); //inherit from uvm_driver-class

    `uvm_component_utils(our_driver) //name of our driver_class, registers class with factory

    our_interface intf; //instantiated interface
    our_packet pkt;

    //constructor class
    function new(string name = "our_driver", uvm_component parent = null);
        super.new(name,parent);
    endfunction: new

    //build phase
    function void build_phase(uvm_phase phase);
        //build further components
        pkt = our_packet::type_id::create("Our packet");
        uvm_config_db #(virtual our_interface)::get(null, "*", "intf", intf); //get method
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //ncessary connections
    endfunction    
    
    task run_phase(uvm_phase phase);
        //main logic
        forever begin
            @(posedge intf.clk)
                seq_item_port.get_next_item(pkt); //at posedge clock get next item from sequencer
                
                intf.input_1 <= pkt.input_1;
                intf.input_2 <= pkt.input_2;
                
                seq_item_port.item_done(); //ready to accept package                
        end
    
    endtask

endclass: our_driver