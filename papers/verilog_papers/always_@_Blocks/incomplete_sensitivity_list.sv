module incomplete_sensitivity_list(
  output reg C,
  input A,B);
  
// An incompletely specified sensitivity list, will create 
// an always@ block that doesn’t always set/update its elements 
// when it should.
  
  
//   	always @ ( A or B ) begin
//          C = A ^ B ;
//      end
    	
//     always @ ( A ) begin
//          C = A ^ B ;
//      end
    	
     always @ (  B ) begin
         C = A ^ B ;
     end

endmodule
