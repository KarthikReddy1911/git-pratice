module fa(
  input ain,bin,cin,
  output S_out,c_out);
  assign {c_out,S_out}=ain+bin+cin;
endmodule
