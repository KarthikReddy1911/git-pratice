module adder_t1(co, sum, a, b, ci);
output co;
output [3:0] sum;
input [3:0] a, b;
input ci;
reg co;
reg [3:0] sum;
  
// For the adder_t1, the outputs should be updated 12ns after input changes. 
// If the a input changes at time 15 as shown in Figure 3, then if the a, b 
// and ci inputs all change during the next 9ns, the outputs will be updated 
// with the latest values of a, b and ci. This modeling style has just permitted 
// the ci input to propagate a value to the sum and carry outputs after only 3ns 
// instead of the required 12ns propagation delay.
  
always @(a or b or ci)
#12 {co, sum} = a + b + ci;
endmodule
