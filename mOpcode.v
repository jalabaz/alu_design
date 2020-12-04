module mOpcodeDecoder (input op0,op1,op2,
							  output d0,d1,d2,d3,d4,d5,d6,d7
							  );

assign d0 = ~op2 & ~op1 & ~op0;
assign d1 = ~op2 & ~op1 & op0;
assign d2 = ~op2 & op1 & ~op0;
assign d3 = ~op2 & op1 & op0;
assign d4 = op2 & ~op1 & ~op0;
assign d5 = op2 & ~op1 & op0;
assign d6 = op2 & op1 & ~op0;
assign d7 = op2 & op1 & op0;
endmodule
	
	
				