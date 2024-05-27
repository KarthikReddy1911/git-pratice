module adder_t3 (co, sum, a, b, ci);
output co;
output [3:0] sum;
input [3:0] a, b;
input ci;
reg co;
reg [3:0] sum;
  
// In the adder_t3 example, if the a input changes at time 15, then all inputs will be 
// evaluated and new output values will be queued for assignment 12ns later.Immediately 
// after the outputs have been queued (scheduled for future assignment) but not yet assigned,
// the always block will again be setup to trigger on the next input event. This means that 
// all input events will queue new values to be placed on the outputs after a 12ns delay.
// This coding style models combinational logic with **transport delays.**  

always @(a or b or ci)
{co, sum} <= #12 a + b + ci;
endmodule
