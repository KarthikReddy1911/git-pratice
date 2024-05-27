module dffn (q, d, clk, rst);
output q;
input d, clk, rst;
reg q;
always @(posedge clk)
if (rst) q <= 1'b0;
else q <= d;
endmodule

// If an engineer is willing to limit all modules to a single always block, 
// blocking assignments can be used to correctly model, simulate and synthesize
// the desired logic. Unfortunately this reasoning leads to the habit of placing 
// blocking assignments in other, more complex sequential always blocks that will 
// exhibit the race conditions
