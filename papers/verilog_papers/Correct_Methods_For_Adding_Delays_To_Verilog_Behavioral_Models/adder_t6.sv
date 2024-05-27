module adder_t6 (co, sum, a, b, ci);
output co;
output [3:0] sum;
input [3:0] a, b;
input ci;
reg co;
reg [3:0] sum;
  
// For the adder_t6 example, the outputs should be updated 12ns 
// after input changes. If the a input changes at time 15, the 
// RHS input values will be sampled and the outputs will be updated
// with the sampled value, while all other a, b and ci input changes
// during the next 12ns will not be evaluated. This means old erroneous
// values will remain on the outputs until more input changes occur.
  
always @(a or b or ci)
{co, sum} = #12 a + b + ci;
endmodule
