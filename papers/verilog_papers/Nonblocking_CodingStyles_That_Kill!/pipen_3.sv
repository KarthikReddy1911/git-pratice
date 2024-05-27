module pipen_3 (q3, d, clk);
output [7:0] q3;
input [7:0] d;
input clk;
reg [7:0] q3, q2, q1;
  
// If each of the blocking-assignment examples is rewritten with
// nonblocking assignments,each will simulate correctly and synthesize
// the desired pipeline logic.Good nonblocking-assignment sequential coding style #3
  
always @(posedge clk) q1<=d;
always @(posedge clk) q2<=q1;
always @(posedge clk) q3<=q2;
endmodule
