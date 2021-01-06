`timescale 1ns / 10ps

module test_fifo;
//----------------------------------------------------------------------------------------------------------------------//
//Inputs
	reg clk;
	reg fifo_on;
	reg [31:0] din;
	reg rd_en;
	reg wr_en;
	reg rst;

//----------------------------------------------------------------------------------------------------------------------//
//Outputs
	wire [31:0] dout;
	wire empty;
	wire full;
	
//----------------------------------------------------------------------------------------------------------------------//
//Accessing the elements from the fifo module

	localparam period = 20; //period

	fifo_2 uut (	.clk(clk),
						.din(din),
						.wr_en(wr_en),
						.rd_en(rd_en),
						.rst(rst),
						.dout(dout),
						.empty(empty),
						.full(full),
						.fifo_on(fifo_on)
					);
//----------------------------------------------------------------------------------------------------------------------//
//Test					
	initial
		begin
	
		clk = 1'b0;
		din = 32'h0;
		rd_en = 1'b0;
		wr_en = 1'b0;
		fifo_on = 1'b0;
		rst = 1'b1;
	
	#100;
		fifo_on = 1'h1;
		rst = 1'h1;
	
	#period;
		rst = 1'h0;
		wr_en = 1'b1;
		din = 32'h0;
	
	#period;
		din = 32'h1;
	
	#period;
		din = 32'h2;
	
	#period;
		din = 32'h3;
	
	#period;
		din = 32'h4;
	
	#period;
		din = 32'h5;
	
	#period;
		wr_en = 1'b0;
		rd_en = 1'b1;
	
	#340 $finish; 
	
	end
	always #10 clk = ~clk;

endmodule

	