module adder_t7a (co, sum, a, b, ci);
output co;
output [3:0] sum;
input [3:0] a, b;
input ci;
reg co;
reg [3:0] sum;
reg [4:0] tmp;
  
// The adder_t7a example , places the delay on the first blocking assignment and no // delay on the second assignment. This will have the same flawed
// behavior as the adder_t1 example.
  
always @(a or b or ci) begin
#12 tmp = a + b + ci;
 {co, sum} = tmp;
end
endmodule

// The adder_t7b example,places the delay on the second blocking assignment and
// no delay on the first. This model will sample the inputs on the first input 
// change and assign the outputs to a temporary location until after completion
// of the specified blocking delay. Then the outputs will be written with the
// old temporary output values that are no longer valid.Other input changes within the 12ns delay period will not be evaluated, which means old erroneous values will remain on the outputs until more input changes occur.




// module adder_t7b (co, sum, a, b, ci);
// output co;
// output [3:0] sum;
// input [3:0] a, b;
// input ci;
// reg co;
// reg [3:0] sum;
// reg [4:0] tmp;
// always @(a or b or ci) begin
// tmp = a + b + ci;
// #12 {co, sum} = tmp;
// end
// endmodule
