module tb_serial_adder #(parameter WIDTH=8);
 
logic clk,resetn,start;
logic [WIDTH-1:0]A,B;
logic [WIDTH:0]sum;
bit[3:0] i;
 
covergroup adder_coverage;
        c1: coverpoint A{
              bins zero  ={0};
              bins one  ={1};
              bins mid  ={[2:253]};
              bins last1 ={254};
              bins last2  ={255};}
        c2: coverpoint B{ 
              bins zero  ={0};
              bins one  ={1};
              bins mid  ={[2:253]};
              bins last1 ={254};
              bins last2  ={255};}
        c3 : coverpoint resetn{
              bins v1 ={[0:1]};
                         }
        c4 : coverpoint start{
              bins v2 ={[0:1]};
                         }
        AB:  cross c1,c2;
        reset_n_start: cross c3,c4;
    endgroup:adder_coverage
 
  //Handle of covergroup
  adder_coverage cg=new();
 
 
task load;
begin
   @(negedge clk)
     resetn = 1;
     start=1;
    A = $urandom_range(0, (1<<WIDTH)-1);
    B = $urandom_range(0, (1<<WIDTH)-1);
    cg.sample();
end
endtask
 
 
task shift;
begin
@(negedge clk)
     start = 0;
end
endtask
 
task wait_time;
repeat(WIDTH+3)@(negedge clk);
endtask
serial_adder dut(
              .start(start),
              .clk(clk),
              .resetn(resetn),              
              .A(A),
              .B(B),
              .sum(sum)
           );
 
//clock_module 
clk_gen dut2(clk);
  initial begin
   start=0;resetn=0;
repeat(1075)begin 
   load;
   shift; 
   wait_time;
    check_sum;
  end
 
   load;
   shift; 
   wait_time;
 
//A=0 and B=0 case
@(negedge clk)
start=1; resetn=1;
A=8'h00;
B=8'h00;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=1 and B=0 case
@(negedge clk)
start=1; resetn=1;
A=8'h01;
B=8'h00;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=0 and B=1 case
@(negedge clk)
start=1; resetn=1;
A=8'h00;
B=8'h01;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=254 and B=0 case
@(negedge clk)
start=1; resetn=1;
A=8'hfe;
B=8'h00;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=0 and B=254 case
@(negedge clk)
start=1; resetn=1;
A=8'hfe;
B=8'h00;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
 
//A=255 and B=255 case
@(negedge clk)
start=1; resetn=1;
A=8'hff;
B=8'hff;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=0 and B=254 case
@(negedge clk)
start=1; resetn=1;
A=8'h00;
B=8'hfe;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=0 and B=255 case
@(negedge clk)
start=1; resetn=1;
A=8'h00;
B=8'hff;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=1 and B=1 case
@(negedge clk)
start=1; resetn=1;
A=8'h01;
B=8'h01;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=1 and B=255 case
@(negedge clk)
start=1; resetn=1;
A=8'h01;
B=8'hff;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=1 and B=254 case
@(negedge clk)
start=1; resetn=1;
A=8'h01;
B=8'hfe;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=255 and B=0 case
@(negedge clk)
start=1; resetn=1;
A=8'hff;
B=8'h00;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=255 and B=1 case
@(negedge clk)
start=1; resetn=1;
A=8'hff;
B=8'h01;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=255 and B=254 case
@(negedge clk)
start=1; resetn=1;
A=8'hff;
B=8'hfe;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=254 and B=254 case
@(negedge clk)
start=1; resetn=1;
A=8'hfe;
B=8'hfe;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//A=254 and B=1 case
@(negedge clk)
start=1; resetn=1;
A=8'hfe;
B=8'h01;
cg.sample();
@(negedge clk)
start=0;
wait_time;
 
//load-->idle
 
  load;
   @(negedge clk)
    resetn=0;start=0;
    shift; 
    wait_time;
 
 
//shift-->idle
  load;
   shift; 
  @(negedge clk)
    resetn=0;start=0;
    wait_time;
  // #150;
  cg.get_coverage();
 
 
i=0;
 
   #300 $finish;
end     
 
 
//self-- checking test bench
 
    task check_sum;
	begin
	  @(negedge clk);
              repeat(WIDTH + 2)@(posedge clk);
	     if (sum == A+B)
		$display("Test passed: A = %d, B = %d, sum = %d", A, B, sum); 
	     else
		$display("Test failed: A = %d, B = %d, sum = %d", A, B, sum); 
	 end
	endtask
//specify

// endspecify
 
endmodule
