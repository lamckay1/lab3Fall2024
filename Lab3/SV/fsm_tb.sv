`timescale 1ns / 1ps
module stimulus ();

   logic  clk;
   logic  L, R;
   logic  reset;
   
   logic  La, Lb, Lc, Ra, Rb, Rc;
   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
	FSM dut (clk, reset, .L(L), .R(R), La, Lb, Lc, Ra, Rb, Rc);   
   
   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("fsm.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	     #5 $fdisplay(desc3, "%b %b %b || %b %b %b %b %b %b", 
		     reset, L, R , La, Lb, Lc, Ra, Rb, Rc);
     end   
   
   initial 
     begin      
	#0   reset = 1'b1;
	#41  reset = 1'b0;	
	#0   a = 1'b0;
	#20  a = 1'b1;
	#20  a = 1'b0;
     end

endmodule // FSM_tb

