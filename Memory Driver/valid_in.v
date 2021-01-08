//This is the Valid moddule , where the button is getting pressed

module valid_in (	input clk, rst, button,
						output reg [7:0] valid_in);

		
	always @(posedge clk)
	begin
		if(rst)
			valid_in	<= 0;
		else
			valid_in <= button;
			
	end
endmodule 
//When the button is pressed valid_in is getting value of 1 otherwise when reseted valid_in is with value of 0