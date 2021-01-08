module memory (	input [31:0] data_32,
						input write, address,
						input clk,
						output reg [31:0] memory_out
					);

						
	reg [31:0] memory [61:0];
	
	always @(posedge clk) 
	begin
		if(write) begin
			memory[address] <= data_32;
		end
			memory_out <=memory[address];
	end
	
endmodule
