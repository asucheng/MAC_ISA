module regmn(								//ports for the entity 
        clk_n,
        rst,
        inputs,
        outputs
    );
	
	//generic 
    parameter bit_depth = 32;				//blocking assignment, combinational logic
	
	//inputs&outputs
    input clk_n;
    input rst;
    input [(bit_depth - 1):0] inputs;
    output [(bit_depth - 1):0] outputs;
    
	//signals
	reg [(bit_depth - 1):0] outputs;			//reg is equvient to signal in VHDL
	
    always @(posedge clk_n)					//process block with sensitivty list
    begin
        if (rst) 
            outputs <= 0;
        else
            outputs <= inputs;				//<= non-blocking assignment, sequential logic
    end
endmodule 