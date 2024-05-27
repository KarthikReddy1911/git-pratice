
module serial_adder #(parameter WIDTH=8)(
  input start,clk,resetn,
  input [WIDTH-1:0]A,[WIDTH-1:0]B,
  output reg [WIDTH:0] sum);
 
  reg rst,en,load;
  wire Serial_Out_1,Serial_Out_2;
  wire serial_in;
  wire c_out,cin;
  
  fsm U1(start,clk,resetn,rst,load,en);
  
  piso_register #(WIDTH) U2(clk,load,en,A,Serial_Out_1);
  
  piso_register #(WIDTH) U3(clk,load,en,B,Serial_Out_2);
  
  fa U4(Serial_Out_1,Serial_Out_2,cin,serial_in,c_out);
  
  dff U5(clk,rst,c_out,cin);
   
  sipo_register #(WIDTH) U6(clk,rst,serial_in,en,sum);
 
endmodule

   
