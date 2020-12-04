module mHalfsubtracter( input iA,			//data input A
								input iB,			//data input B
								output oDiff,		//difference out
								output oBorrow	//borrow out
								);
						 
assign oBorrow = ~iA & iB;
assign oDiff = iA^iB;

endmodule