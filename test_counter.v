`timescale 1ns / 10ps

module test_counter;
//----------------------------------------------------------------------------------------------------------------------//
//Inputs
	reg clk;
	reg rst;
	reg validtocounter;
	reg load;

//----------------------------------------------------------------------------------------------------------------------//
//Outputs
	wire [7:0] validin;

	
//----------------------------------------------------------------------------------------------------------------------//
//Accessing the elements 
	
	localparam period = 20; //period
	
	counter uut (.clk(clk),
									.rst(rst),
									.load(load),
									.validtocounter(validtocounter),
									.validin(validin));
							
	initial
		begin
	
		clk = 1'b1;
		rst  = 1'b0;
		validtocounter= 1'b1;
		
		#period;
			load=1'b1;
			validtocounter = 1'b1;
	
		#period;
			load = 1'b0;
			validtocounter = 1'b1;
		#period;
			validtocounter = 1'b1;
		
		#period;
			validtocounter = 1'b1;
		#period;
			validtocounter = 1'b1;
		
	
	#340 $finish; 
	
	end
	always #10 clk = ~clk;

endmodule
