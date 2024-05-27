module pipeb_1 (q3, d, clk);
output [7:0] q3;
input [7:0] d;
input clk;
reg [7:0] q3, q2, q1;
  
// In the pipeb1, the sequentially ordered blocking assignments will 
// cause the input value, d, to be placed on the output of every register 
// on the next posedge clk. On every clock edge, the input value is 
// transferred directly to the q3-output without delay. This clearly does
// not model a pipeline register and will actually synthesize to a single
// register!Bad blocking-assignment sequential coding style #1.
  
always @(posedge clk) begin
q1 = d;
q2 = q1;
q3 = q2;
end
endmodule
