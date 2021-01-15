module state_machine ( input logic clk,
							  input logic rst,
							  input logic X,
							  output logic Y
							  ); 
							  
	typedef enum logic [2:0] {A, B, C, D, E} state;
	
	state current_state, next_state;
	
	always_ff @(posedge clk) //sequential logic- using always_ff
		if (rst)
			current_state <= A;
		else 
			current_state <= next_state;
			
	always_comb  //combinational logig - evaluated at time 0
	
		case(current_state)
			A: if(X)		 next_state = C;
				else		 next_state = B;
				
			B: if(X) 	 next_state = D;
				else		 next_state = B;
				
			C: if(X)		 next_state = C;
				else		 next_state = E;
			
			D: if(X)		 next_state = C;
				else		 next_state = E;
			
			E: if(X)		 next_state = D;
				else		 next_state = B;
			
			default:		 next_state = A;
				
		endcase
	
	//Moore machine- for this two state output is 1
		assign Y = (current_state == D | current_state == E);
		
endmodule
