class our_test extends uvm_test; //inherit from uvm_test-class

    `uvm_component_utils(our_test) //name of our test_class, registers class with factory
    
    //instantiate classes
    our_env env;
        
    //constructor class
    function new(string name = "our_test", uvm_component parent = null);
        super.new(name,parent);
    endfunction: new
    
    //build phase
    function void build_phase(uvm_phase phase);
        //build further components
        env = our_env::type_id::create("env", this); //create env object
    endfunction
    
    //connect phase
    function void connect_phase(uvm_phase phase);
        //ncessary connections
    endfunction    
    
    task run_phase(uvm_phase phase);
        //main logic
    
    endtask
    
    
    

    
    //methods
    //properties

endclass: our_test    
