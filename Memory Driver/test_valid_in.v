`timescale 1ns / 10ps

module test_valid_in;
//----------------------------------------------------------------------------------------------------------------------//
//Inputs
	reg clk;
	reg rst;
	reg button;
	//reg validtocounter;
	//reg data_8;
	//reg data;
	
//----------------------------------------------------------------------------------------------------------------------//
//Outputs
	wire [7:0] valid_in;
	//wire [7:0] validin;
	//wire [31:0] data_32;
	//wire memory_full;
	//wire mem_full;
	
//----------------------------------------------------------------------------------------------------------------------//
//Accessing the elements 
	
	
	
	
	localparam period = 20; //period
	
	valid_in uut (.clk(clk),
									.rst(rst),
									.button(button),
									.valid_in(valid_in));
							
	initial
		begin
	
		clk = 1'b1;
		button = 1'b1;
	
		#period;
		button = 1'b1;
		
		#period;
		button = 1'b1;
		#period;
		button = 1'b1;
		#period;
		button = 1'b1;
		#period;
		button = 1'b0;
		#period;
		button = 1'b1;
		#period;
		button = 1'b0;
		#period;
		rst = 1'b1;
		
		#period;
		button = 1'b1;
		#period;
		button = 1'b0;
		//#period;
		//button = 1'b1;
		/*#period;
		validtocounter= 1'b1;
		#period;
		validtocounter= 1'b1;
		#period;
		validtocounter= 1'b1;
		#period;
		data_8 = 8'd1;
		
		#period;
		data_8 = 8'd1;
		#period;
		data_8 = 8'd1;
			#period;
		data_8 = 8'd15;
		#period;
		data_8 = 8'd30;
		#period;
		data = 32'd4;
		
		#period;
		data = 32'd4;
		#period;
		data = 32'd20; */
		
	#340 $finish; 
	
	end
	always #10 clk = ~clk;

endmodule

	