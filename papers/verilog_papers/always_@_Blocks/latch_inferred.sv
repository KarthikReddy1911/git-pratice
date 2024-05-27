module latch_inffered(
  output reg A,C,
  input Trigger,Pass);
 
  
//If you don’t assign every element that can be assigned inside an always@( * ) 
//block every time that always@( * ) block is executed, a latch  will be inferred 
//for that element.
  	
   
   always @ ( * ) begin
	    A = 1'b0 ;
	     if ( Trigger ) begin
	       A = Pass ;
	       C = Pass ;
	  end
	end
endmodule
