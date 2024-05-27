module adder_t4 (co, sum, a, b, ci);
output co;
output [3:0] sum;
input [3:0] a, b;
input ci;
  
  
// In  adder_t4 code, e first a-input change occurs at time 15, which causes an 
// output event to be scheduled for time 27, but a change on the b-input and two 
// more changes on the a-input at times 17, 19 and 21 respectively, cause three 
// new output events to be scheduled. Only the last output event actually completes 
// and the outputs are assigned at time 33.

// **Continuous assignments do not "queue up" output assignments, they only keep track of the 
// next output value and when it will occur; therefore, continuous assignments model combinational 
// logic with inertial delays**.  
  
  
assign #12 {co, sum} = a + b + ci;
endmodule
