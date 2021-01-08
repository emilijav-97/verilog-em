
module counter (	input clk, rst, validtocounter,load,
						output reg [7:0] validin,
						output reg match
					);
		
	always @(posedge clk)
		if(rst)
				validin <= 8'h00;
			else if (load)
					validin <= load;
			else  
				validin <= validin + 8'h01;
				
	always @ validin
			if (validin == load)
				match = 1'b1;
			else
				match = 1'b0;
			
	valid_in instat(.clk(clk), .rst(rst),.button(validtocounter));	
	
endmodule
