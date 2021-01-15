//Test 
`timescale 1ns/1ns

module test_state;

	logic clk;
	logic rst;
	logic in;
	logic out;
	
	
	localparam period = 10; //period
	
	state_machine dut (
						.clk(clk),
						.rst(rst),
						.X(in),
						.Y(out)
									);
	initial
		begin
		
		rst <= 1; #period;
		assert(out == 0) else $error("Problem at 0");
		
		rst <= 0; in <= 0; #period;
		assert(out == 0) else $error("Problem at 1");
		
		in <= 1; #period;
		assert(out == 0) else $error("Problem at 2");
		
		in <= 1; #period;
		assert(out == 1) else $error("Problem at 3");
		
		in <= 1; #period;
		assert(out == 0) else $error("Problem at 4");
		
		in <= 0; #period;
		assert(out == 0) else $error("Problem at 5");
		
		in <= 1; #period;
		assert(out == 0) else $error("Problem at 6");
		
		in <= 0; #period;
		assert(out == 1) else $error("Problem at 7");
		
		#150 $finish; 
	
		end
	
	always
	
		begin
		clk = 1; #5;
		clk = 0; #5;
		end
		
	endmodule						  
			