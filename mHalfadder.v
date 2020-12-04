module mHalfadder( input iA,			//data input A
						 input iB,			//data input B
						 output oSum,		//sum out
						 output oCarryout	//carry out
						 
						 );
						 
assign oCarryout = iA&iB;
assign oSum = iA^iB;

endmodule