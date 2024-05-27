module all_gates_u1(input a,b,output not_out,and_out,or_not);
wire w0,w1;
//NOT
gates_u1 U1(a,a,not_out);
//AND
gates_u1 U2(a,b,w0);
gates_u1 U3(w0,w0,and_out);
//OR
gates_u1 U4(b,b,w1);
gates_u1 U5(not_out,w1,or_not);
 
endmodule
