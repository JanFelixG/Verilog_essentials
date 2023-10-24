class our_sequence extends uvm_sequence; //inherit from uvm_sequence-class
    `uvm_object_utils(our_sequence) //name of our test_class, registers class with factory
    our_packet pkt;
    
     //constructor class
    function new(string name = "our_sequence");
        super.new(name);
    endfunction: new
    
    task body();
        pkt = our_packet::type_id::create("Our packet");
        
        repeat(10)
        begin
            start_item(pkt);
            pkt.randomize();
            finish_item(pkt);
        end
    
    endtask
       
    
endclass: our_sequence 