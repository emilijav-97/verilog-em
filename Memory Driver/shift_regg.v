//SIPO reg has been used to count 4 counter outputs.
module shift_regg (	input clk, si, validin
		    	input  [7:0] shift,
			output po
		    );
						
	reg [31:0] data;
	
	always @(posedge clk or validin)
		begin
			if (shift == 8'b0 && validin == 1'b0)
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
