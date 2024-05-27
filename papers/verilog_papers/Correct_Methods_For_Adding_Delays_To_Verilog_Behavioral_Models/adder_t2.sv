module adder_t2 (co, sum, a, b, ci);
output co;
output [3:0] sum;
input [3:0] a, b;
input ci;
reg co;
  
// In the adder_t2 example  (nonblocking assignments) that existed in the adder_t1 
//example (blockingassignments).If the a input changes at time 15, then if the
// a, b and ci inputs all change during the next 9ns, the outputs will be updated with the 
// latest values of a, b and ci. This modeling style permitted the ci input to
// propagate a value to the sum and carry outputs after only 3ns instead of the required 12ns //propagation delay.
  
reg [3:0] sum;
always @(a or b or ci)
#12 {co, sum} <= a + b + ci;
endmodule
