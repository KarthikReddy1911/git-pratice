// In contrast, the oscillator uses nonblocking assignments. After 
// the first @(clk) trigger, the RHS expression of the nonblocking 
// assignment is evaluated and the LHS value scheduled into the 
// nonblocking assign updates event queue. Before the nonblocking 
// assign updates event queue is "activated," the @(clk) trigger
// statement is encountered and the always block again becomes 
// sensitive to changes on the clk signal. When the nonblocking 
// LHS value is updated later in the same time step, the @(clk) 
// is again triggered(which is not necessarily a recommended coding style).
  
module osc2 (clk);
output clk;
reg clk;
initial begin
  #10 clk = 0;
  #100 $finish();
end
always @(clk) #10 clk <= ~clk;
endmodule
