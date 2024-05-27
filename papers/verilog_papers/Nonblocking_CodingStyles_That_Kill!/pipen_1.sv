module pipen_1 (q3, d, clk);
output [7:0] q3;
input [7:0] d;
input clk;
reg [7:0] q3, q2, q1;
  
// If each of the blocking-assignment examples is rewritten with nonblocking 
// assignments,each will simulate correctly and synthesize the desired pipeline 
// logic.Good nonblocking-assignment sequential coding style #1
  
always @(posedge clk) begin
q1 <= d;
q2 <= q1;
q3 <= q2;
end
endmodule
