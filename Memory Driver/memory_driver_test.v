`timescale 1ns / 10ps

module memory_driver_test;
//----------------------------------------------------------------------------------------------------------------------//
//Inputs
	reg clk;
	reg rst;
	reg data_in;

//----------------------------------------------------------------------------------------------------------------------//
//Outputs
	
		wire write;
		wire addr;
		wire [1:0] current_state;
		wire [1:0] next_state;
		wire stop;
		wire memory_full;

//----------------------------------------------------------------------------------------------------------------------//
//Accessing the elements 
	
	localparam period = 20; //period
	
 memory_driver_off uut (	.clk(clk),
									.data_in(data_in),
									.rst(rst),
									.write(write),
									.addr(addr),
									.current_state(current_state),
									.next_state(next_state),
									.stop(stop),
									.memory_full(memory_full)
						);
							
	initial
		begin
	
		clk = 1'b1;
		data_in= 1'b1;
		
		#period;
		data_in= 1'b0;
			
		#period;
		data_in= 1'b1;
		
		#period;
		data_in= 1'b0;
		
		#period;
		data_in= 1'b0;
		

	
	#400 $finish; 
	end
	always #10 clk = ~clk;
endmodule
