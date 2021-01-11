module full_construction (input clk, rst,button,
									output mem_full  
								  );

	wire memory_full;
	wire [31:0] countertoshift; 
	wire [31:0] shifttome;
	wire [7:0] validintocounter1;


	valid_in valid_in1 (.button(button), .clk(clk), .rst(rst), .valid_in(validintocounter1));
	
	counter counter1 (.validtocounter(validintocounter1),.clk(clk), .rst(rst), .validin(countertoshift));
	
	shift_regg shift_regg1 (.shift(countertoshift),.clk(clk), .po(shifttomem));
	
	memory_driver_off  memory_driver_off1(.clk(clk), .rst(rst), .memory_full(mem_full), .data_in(shifttomem));
	
	
	
endmodule
