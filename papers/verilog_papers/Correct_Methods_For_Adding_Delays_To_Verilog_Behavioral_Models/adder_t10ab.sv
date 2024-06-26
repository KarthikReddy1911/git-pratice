// module adder_t10a (co, sum, a, b, ci);
// output co;
// output [3:0] sum;
// input [3:0] a, b;
// input ci;
// wire [4:0] tmp;
// assign tmp = a + b + ci;
// assign #12 {co, sum} = tmp;
// endmodule


// It can similarly be shown that modeling logic functionality by 
// adding delays to continuous assignments,whose outputs are used 
// to drive the inputs of other continuous assignments with delays,
// also accurately models combinational logic with **inertial delays.**

module adder_t10b (co, sum, a, b, ci);
output co;
output [3:0] sum;
input [3:0] a, b;
input ci;
wire [4:0] tmp;
assign #12 tmp = a + b + ci;
assign {co, sum} = tmp;
endmodule
