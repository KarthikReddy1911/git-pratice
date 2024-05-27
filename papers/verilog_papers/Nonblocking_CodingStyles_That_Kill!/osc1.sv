// In general, a Verilog always block cannot trigger itself. Consider 
// the oscillator, uses blocking assignments. Blocking assignments 
// evaluate their RHS expression and update their LHS value without 
// interruption. The blocking assignment must complete before the @(clk) 
// edge-trigger event can be scheduled. By the time the trigger event has 
// been scheduled, the blocking clk assignment has completed; therefore, 
// there is no trigger event from within the always block to trigger the @(clk) trigger.

module osc1 (clk);
output clk;
reg clk;
initial #10 clk = 0;
always @(clk) #10 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
