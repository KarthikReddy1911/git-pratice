module shift_reg_pitfall(CLK,A,B,C,D);
  input CLK,A;
  output reg B,C,D;

// Instead of Non-Blocking Assignment, if you place = assignments inside of an 
// always@(posedge Clock) block to produce the shift register, you instead get 
// the parallel registers
  
//   always @(posedge CLK) begin
//  	B <= A ;
// 	C <= B ;
// 	D <= C ;
//   end

  
always @(posedge CLK) begin
   	    B = A ;
	    C = B ;
	    D = C ;
end

endmodule
