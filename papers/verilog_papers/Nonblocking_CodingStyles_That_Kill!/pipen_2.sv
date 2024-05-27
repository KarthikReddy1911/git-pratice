module pipen_2 (q3, d, clk);
output [7:0] q3;
input [7:0] d;
input clk;
reg [7:0] q3, q2, q1;
always @(posedge clk) begin
  
// If each of the blocking-assignment examples is rewritten with
// nonblocking assignments,each will simulate correctly and synthesize
// the desired pipeline logic.Good nonblocking-assignment sequential coding style #3
  
q3 <= q2;
q2 <= q1;
q1 <= d;
end
endmodule
