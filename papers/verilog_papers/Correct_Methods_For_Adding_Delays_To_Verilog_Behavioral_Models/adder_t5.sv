module adder_t5 (co, sum, a, b, ci);
output co;
output [3:0] sum;
input [3:0] a, b;
input ci;
reg [4:0] tmp;
  
// For the adder_t5 example, the tmp variable is updated after any and 
// all input events.The continuous assignment outputs do not change 
// until 12ns after the last change on the tmp variable. Any sequence 
// of always block input changes will cause tmp to change, which will 
// cause a new output event on to be scheduled on the continuous assignment 
// outputs. The continuous assignment outputs will not be updated until tmp 
// remains unchanged for 12ns. This coding style models combinational logic 
// with inertial delays.
  
  
always @(a or b or ci) begin
 tmp =  a + b + ci;
end
 #12  assign  {co, sum} = tmp;
endmodule
