module counter(
		clk,
		rst,
		increment,
		load,
		preset_val,
		count_out
	);
	
	parameter bit_depth  = 8;

	input clk;
	input rst;
	input increment;
	input load;
	input [(bit_depth-1):0] preset_val;
	output [(bit_depth-1):0] count_out;
	
	reg [(bit_depth-1):0] count_out;
	
	always @(posedge clk) 
		begin 
			if (rst) 
				count_out <= 'b0;
			else if (increment)
				count_out <= count_out + 1;
			else if (load)
				count_out <= preset_val;
			else if (!load && !rst && !increment)
				count_out <= count_out;
		    else 
		        count_out <= 'b0;
		end
endmodule