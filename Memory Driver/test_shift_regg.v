`timescale 1ns / 10ps

module test_shift_regg;
//----------------------------------------------------------------------------------------------------------------------//
//Inputs
	reg clk;
	reg si;
	reg shift;
	

//----------------------------------------------------------------------------------------------------------------------//
//Outputs
	
	wire po;

//----------------------------------------------------------------------------------------------------------------------//
//Accessing the elements 
	
	localparam period = 20; //period
	
	shift_regg uut (	.clk(clk),
							.po(po),
							.shift(shift),
							.si(si)
						);
							
	initial
		begin
	
		clk = 1'b1;
		shift= 1'b1;
		
		#period;
		shift= 1'b0;
			
		#period;
		shift= 1'b1;
		
		#period;
		shift= 1'b0;
		
		#period;
		si= 1'b0;
		
		#period;
		si= 1'b1;
		
		#period;
		si= 1'b1;

		#period;
		si= 1'b1;
		
		#period;
		shift= 1'b0;
		
		#period;
		shift= 1'b1;
		#period;
		shift= 1'b0;
	
		#period;
		si= 1'b0;
		
		#period;
		si= 1'b1;

		#period;
		si= 1'b1;

		#period;
		si= 1'b1;

	
	#400 $finish; 
	
	end
	always #10 clk = ~clk;

endmodule
