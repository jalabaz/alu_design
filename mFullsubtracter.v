module mFullsubtracter ( input iA,			 //data input A
								input iB, 		 //data input B
								input iC,			 //data input C
								output oDiff,		 //sum out
								output oBorrow //carry out
								);
wire n1, n2, n3;

mHalfadder Halfadder (.iA (iB), .iB(iC), .oSum (n1), .oCarryout (n2));

mHalfsubtracter Halfsubtracter (.iA (iA), .iB (n1), .oDiff (oDiff), .oBorrow (n3));

or OR_0(oBorrow, n2, n3);

endmodule