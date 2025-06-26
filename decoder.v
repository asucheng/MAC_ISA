module decoder(
        sel,
        dout
    );
	
    parameter bit_depth  = 8;
    parameter log_port_depth  = 3;
	
    input [(log_port_depth - 1):0] sel;
    output [(bit_depth - 1):0] dout;
	
	integer int_sel;
	reg [(bit_depth - 1):0]dout;
	
    always @(sel)
    begin
		int_sel = sel;
        dout <= {1'b0};
        dout[int_sel] <= 1'b1;
    end
endmodule 

