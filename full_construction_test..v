`timescale 1ns / 10ps

module full_construction_test;
//----------------------------------------------------------------------------------------------------------------------//
//Inputs
	reg clk;
	reg rst;
	reg button;
	

//----------------------------------------------------------------------------------------------------------------------//
//Outputs
	
	wire mem_full;

//----------------------------------------------------------------------------------------------------------------------//
//Accessing the elements 
	
	localparam period = 20; //period
	
	full_construction uut (	.clk(clk),
							.rst(rst),
							.button(button),
							.mem_full(mem_full)
						);
							
	initial
		begin
	
		clk = 1'b1;
		button= 1'b1;
		
		#period;
		button= 1'b0;
			
		#period;
		button= 1'b1;
		
		#period;
		button= 1'b0;
		
		#period;
		button= 1'b0;
		rst = 1'b1;
		
		#period;
		button= 1'b1;
		
		#period;
		button= 1'b1;

		#period;
		button= 1'b1;
		
	
	#400 $finish; 
	
	end
	always #10 clk = ~clk;

endmodule
