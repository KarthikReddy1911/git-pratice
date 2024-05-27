module pipeb_2 (q3, d, clk);
output [7:0] q3;
input [7:0] d;
input clk;
reg [7:0] q3, q2, q1;

// In the pipeb2 example, the blocking assignments have been carefully 
// ordered to cause the simulation to correctly behave like a pipeline register. 
// This model also synthesizes to the pipeline register.Bad blocking-assignment 
// sequential coding style #2 - but it works!
  
always @(posedge clk) begin
q3 = q2;
q2 = q1;
q1 = d;
end
endmodule
