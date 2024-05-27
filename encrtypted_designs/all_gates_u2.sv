module all_gates_u2(input a,b,output not_out,and_out,or_not);
wire w0,w1;
//NOT
gates_u2 U1(a,a,not_out);
//OR
gates_u2 U2(a,b,w0);
gates_u2 U3(w0,w0,or_not);
//AND
gates_u2 U4(b,b,w1);
gates_u2 U5(not_out,w1,and_out);
 
endmodule
