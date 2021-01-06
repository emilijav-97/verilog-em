//Fifo module
module fifo_2 (	input clk, wr_en, rd_en, rst, fifo_on,
						output empty, full,		
						input [31:0] din,
						output reg [31:0] dout
				  );

//------------------------------------------------------------------------------------------------------------//
//Registers
				
	reg [2:0]  count = 0;
	reg [31:0] fifo [0:7];
	reg [2:0]  write = 0;
	reg [2:0]  read = 0;

//------------------------------------------------------------------------------------------------------------//
//FIFO logic

	always @(posedge clk) 
		begin
			if(fifo_on == 0);
			else 
				begin
					if(rst) 
						begin
							read = 0;
							write = 0;
					   end

			else if (rd_en == 1'b1 && count != 0) 
				begin
					dout = fifo[read];
					read = read + 1'b1; //if counter is not equal to 0 and read is enabled
				end

			else if (wr_en == 1'b1 && count < 8)
				begin
					fifo[write] = din;
					write = write + 1'b1; //if counter is less than 8 than increment the writing option
				end
			else;
		end

			if (write == 8)
					write = 0;
	
			else if(read == 8)
					read = 0;
		else;
	
			if (read > write)
				count = read- write;
	
			else if (write > read)
				count = write - read;
				else;
		end
//-----------------------------------------------------------------------------------------------------------------------//
//assigning for either a full or empty 

	assign empty = (count == 0)? 1'b1 : 1'b0;
	assign full = (count == 8)? 1'b1 : 1'b0;
	
endmodule
