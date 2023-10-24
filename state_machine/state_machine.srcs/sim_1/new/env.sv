class our_env extends uvm_env; //inherit from uvm_env-class

    `uvm_component_utils(our_env) //name of our env_class, registers class with factory

    //instantiate classes
    our_agent agnt;
    
    //constructor class
    function new(string name = "our_env", uvm_component parent = null);
        super.new(name,parent);
    endfunction: new

    //build phase
    function void build_phase(uvm_phase phase);
        //build further components
        `uvm_info(get_type_name(), "In the build phase", UVM_MEDIUM);
        agnt = our_agent::type_id::create("agnt", this); //create agent
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //ncessary connections
    endfunction    
    
    task run_phase(uvm_phase phase);
        //main logic
    
    endtask


endclass: our_env