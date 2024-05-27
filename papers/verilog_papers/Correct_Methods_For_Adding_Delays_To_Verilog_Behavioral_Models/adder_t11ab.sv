// module adder_t11a (co, sum, a, b, ci);
// output co;
// output [3:0] sum;
// input [3:0] a, b;
// input ci;
// reg co;
// reg [3:0] sum;
// reg [4:0] tmp;
// always @(a or b or ci) begin
// tmp = #12 a + b + ci;
// {co, sum} = tmp;
// end
// endmodule

// The same problem exists with multiple blocking assignments when 
// delays are placed on the RHS of the assignment statements. The 
// adder_t11a and adder_t11b demonstrate the same flawed behavior 
// as the adder_t6 example.None of the adder examples with delays on 
// the RHS

// None of the adder examples with delays on the RHS of blocking assignments 
// behave like any known hardware.

module adder_t11b (co, sum, a, b, ci);
output co;
output [3:0] sum;
input [3:0] a, b;
input ci;
reg co;
reg [3:0] sum;
reg [4:0] tmp;
always @(a or b or ci) begin
tmp = a + b + ci;
{co, sum} = #12 tmp;
end
endmodule
