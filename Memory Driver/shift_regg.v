//SIPO reg
module shift_regg (	input clk, si, shift,
							output po
						);
						
	reg [31:0] data;
	
	always @(posedge clk)
		begin
			if (shift == 1'b0)
				begin
					data = {data [30:0], si};
				end
			else
				begin	
					data = {si, data [30:0]};
				end
		end
		assign po = data;
		
		//counter count1(.validin(si), .clk(clk));
		
endmodule 