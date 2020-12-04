module mFulladder ( input iA,			 //data input A
						  input iB, 		 //data input B
						  input iC,			 //data input C
						  output oSum,		 //sum out
						  output oCarryout //carry out
						  
						  );
wire n1, n2, n3;

mHalfadder Halfadder_0 (.iA (iB), .iB(iC), .oSum (n1), .oCarryout (n2));
mHalfadder Halfadder_1 (.iA (iA), .iB (n1), .oSum (oSum), .oCarryout (n3));
or OR_0(oCarryout, n2, n3);

endmodule