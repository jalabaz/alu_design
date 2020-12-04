module mLogicUnit (iA,iB,iOpcode,oX,nZeroflagout);

input[15:0] iA;
input[15:0] iB;
input[2:0] iOpcode;
output[15:0] oX;
output nZeroflagout;

//initialize wires for outputs of each logic function
wire[15:0] nOutA;
wire[15:0] nOutB;
wire[15:0] nOutOr;
wire[15:0] nOutAnd;
wire[15:0] nOutXor;
//define variables; used for checking the opcode
`define ocna 3'b000
`define ocnb 3'b001
`define ocor 3'b010
`define ocand 3'b011
`define ocxor 3'b100

//runs all logic functions
mNOTa NOTa (iA[15:0],iB[15:0], nOutA[15:0]);
mNOTb NOTb (iA[15:0],iB[15:0], nOutB[15:0]);
mANDgate ANDgate (iA[15:0],iB[15:0], nOutAnd[15:0]);
mORgate ORgate (iA[15:0],iB[15:0], nOutOr[15:0]);
mXORgate XORgate (iA[15:0],iB[15:0], nOutXor[15:0]);

//assigns the specified logic function output to the logic unit output depending on the iOpcode
assign oX = (iOpcode == `ocna) ? 
					nOutA[15:0] : 
					((iOpcode == `ocnb) ? 
						nOutB[15:0] : 
						((iOpcode == `ocor) ?
							nOutOr[15:0] : 
							((iOpcode == `ocand) ? 
								nOutAnd[15:0] : 
								((iOpcode == `ocxor) ? 
									nOutXor[15:0] : 16'h0000))));	//results to an all zero 16-bit if iOpcode value is unknown/dontcare

//check if the output is a zero
assign nZeroflagout = (oX == 16'h0000) ? 1'b1 : 1'b0;

endmodule