module memory_driver_off ( input clk, rst,
									input[31:0] data_in,
									output reg write, addr,
									output reg [1:0] current_state, next_state,
									output stop,
									output reg memory_full
								);
	

	`define MAX64BIT 32'h7FFFFFFF //max value
	reg [31:0] memory [63:0]; //memory
	
	localparam state_S1 = 2'b00, 
				  state_S2 = 2'b01, 
				  state_S3 = 2'b10; 
				  
	
	always @(current_state or data_in or write or addr)
			begin
				case (current_state)
					state_S1:
						if (data_in == 1)
							next_state <= state_S2;
						else
							next_state <= state_S1;
					
					state_S2:
						if (data_in == 1 && data_in > `MAX64BIT)
							begin
								write = write +1;
								memory[addr] = data_in; 
								addr = addr + 1;
								next_state <= state_S3;
							end
						else if (data_in == 1 && data_in < `MAX64BIT) 
							begin
								write = write - 1;
								memory_full = memory[addr];
								next_state <= state_S1;
							end
							
					state_S3:
						if (data_in == 0) 
							begin
								write = 0;
								addr = 0;
								next_state <= state_S1;
							end
						else next_state <= state_S3;
						
						default : next_state <= state_S1;
					endcase
				end
	assign stop = memory_full;
	
	always @(posedge clk)
		begin
			if(rst)
				current_state <= state_S1;
			else
				current_state <= next_state;
			end
	
	endmodule
	