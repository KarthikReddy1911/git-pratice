module pipeb_4 (q3, d, clk);
output [7:0] q3;
input [7:0] d;
input clk;
reg [7:0] q3, q2, q1;
  
// The pipeb4 example, or any other ordering of the same always 
// block statements will also synthesize to the correct pipeline 
// logic, but might not simulate correctly.Bad blocking-assignment 
// sequential coding style #4
  
  always @(posedge clk) q3=q2;
  always @(posedge clk) q2=q1;
always @(posedge clk) q1=d;
endmodule
