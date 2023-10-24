class our_packet extends uvm_sequence_item; //inherit from uvm_sequence_item-class
    `uvm_object_utils(our_packet) //name of our test_class, registers class with factory
    
    //request
    rand bit[7:0] input_1; //rand: randomize signals
    rand bit[7:0] input_2;
    //response
    bit[15:0] output_3;     
    
     //constructor class
    function new(string name = "our_packet"); 
        super.new(name);
    endfunction
       
    
endclass: our_packet 
