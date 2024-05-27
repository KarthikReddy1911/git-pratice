module pipeb_3 (q3, d, clk);
output [7:0] q3;
input [7:0] d;
input clk;
reg [7:0] q3, q2, q1;
always @(posedge clk) q1=d;
always @(posedge clk) q2=q1;
always @(posedge clk) q3=q2;
endmodule

// In the pipeb3 example, the blocking assignments have been 
// split into separate always blocks.Verilog is permitted to 
// simulate the always blocks in any order, which might cause 
// this pipeline simulation to be wrong. This is a **Verilog 
// race condition!** Executing the always blocks in a different
// order yields a different result. However, this Verilog code will 
// synthesize to the correct pipeline register. This means that there 
// might be a mismatch between the pre-synthesis and post-synthesis 
// simulations.Bad blocking-assignment sequential coding style #2 - 
// but it works!
