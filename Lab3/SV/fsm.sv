module FSM (clk, reset, L, R, La, Lb, Lc, Ra, Rb, Rc);

   input logic  clk;
   input logic  reset;
   input logic 	L, R;
   
   output logic La, Lb, Lc, Ra, Rb, Rc;

   typedef enum logic [3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
	       
	       La <= 1'b0;
	       Lb <= 1'b0;
	       Lc <= 1'b0;
	       Ra <= 1'b0;
	       Rb <= 1'b0;
	       Rc <= 1'b0;
	       
	       if(L&&R) nextstate <= S7;
	       else if (L) nextstate <= S1;
	       else if (R) nextstate <= S4;
       end
       S1: begin
	       La <= 1'b0;
	       Lb <= 1'b0;
	       Lc <= 1'b1;
	       Ra <= 1'b0;
	       Rb <= 1'b0;
	       Rc <= 1'b0;	  
		   if(L&&R) nextstate <= S0;
		   else if (R) nextstate <= S0;
	  		else nextstate <= S2;
       end
       S2: begin
	  La <= 1'b0;
	  Lb <= 1'b1;
	  Lc <= 1'b1;
	  Ra <= 1'b0;
	  Rb <= 1'b0;
	  Rc <= 1'b0;	  
	  if(L&&R) nextstate <= S0;
	  else if (R) nextstate <= S0;
	  else nextstate <= S3;
       end
	S3: begin
	  La <= 1'b1;
	  Lb <= 1'b1;
	  Lc <= 1'b1;
	  Ra <= 1'b0;
	  Rb <= 1'b0;
	  Rc <= 1'b0;	  
	   nextstate <= S0;
       end
	     S4: begin
	  La <= 1'b0;
	  Lb <= 1'b0;
	  Lc <= 1'b0;
	  Ra <= 1'b1;
	  Rb <= 1'b0;
	  Rc <= 1'b0;	  
	   if(L&&R) nextstate <= S0;
	  else if (L) nextstate <= S0;
	  else nextstate <= S5;
       end
	     S5: begin
	  La <= 1'b0;
	  Lb <= 1'b0;
	  Lc <= 1'b0;
	  Ra <= 1'b1;
	  Rb <= 1'b1;
	  Rc <= 1'b0;	  
	   if(L&&R) nextstate <= S0;
	  else if (L) nextstate <= S0;
	  else nextstate <= S6;
       end
	      S6: begin
	  La <= 1'b0;
	  Lb <= 1'b0;
	  Lc <= 1'b0;
	  Ra <= 1'b1;
	  Rb <= 1'b1;
	  Rc <= 1'b1;	  
	   nextstate <= S0;
       end
	      S7: begin
	  La <= 1'b0;
	  Lb <= 1'b0;
	  Lc <= 1'b1;
	  Ra <= 1'b1;
	  Rb <= 1'b0;
	  Rc <= 1'b0;	  
	   if(L^R) nextstate <= S0;
	  else nextstate <= S8;
       end
	   S8: begin
	  La <= 1'b0;
	  Lb <= 1'b1;
	  Lc <= 1'b1;
	  Ra <= 1'b1;
	  Rb <= 1'b1;
	  Rc <= 1'b0;
	  if(L^R) nextstate <= S0;
	  else nextstate <= S9;
	   end
	  S9: begin
	  La <= 1'b1;
	  Lb <= 1'b1;
	  Lc <= 1'b1;
	  Ra <= 1'b1;
	  Rb <= 1'b1;
	  Rc <= 1'b1;	  
	   nextstate <= S0;
       end
       default: begin	  	  
	  nextstate <= S0;
       end
     endcase
   
endmodule
