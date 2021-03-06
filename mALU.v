module mALU (input[15:0] iA,
					input[15:0] iB,
					input[2:0] iOpcode,
					input iClock,
					output[15:0] oAccumulator,
					output nCarryflagout, nZeroflagout
					);

// iOpcode values 3'bxx000 to 3'bxx100 -->	used by logic unit
// iOpcode values 3'bxx101 to 3'bxx111 --> used by arithmetic unit
`define opcodeArith 3'b101

//initialize all wires
wire[1:0] iOpArith = iOpcode[1:0];	//arithmetic unit only uses 2-bit opcode; takes the first 2 bits of the ALU opcode
wire nZeroflagin, nZeroLogic, nZeroArith;		//used to determine which zeroflag to use
wire nCarryflagin;	//used to check for carry flag
wire[15:0] nOutLogic;	//output of the logic unit
wire[15:0] nOutArith;	//output of the arithmetic unit
wire checkifArith = (iOpcode >= `opcodeArith) ? 1'b1: 1'b0;	//checks if opcode value is for arithmetic unit; used for conditional operators
wire nReset = ~checkifArith;		//resets the carry flipflop of arithmetic unit if the opcode is designated for logic unit

//runs the functions(designated by their opcode) of both logic unit and arithmetic unit					
mLogicUnit logic_unit (iA,iB,iOpcode,nOutLogic,nZeroLogic);
mArithmeticUnit arith_unit (iA,iB,iOpArith,nOutArith,iClock,nReset,nCarryflagout, nZeroArith);

//assigns the arithmetic unit output as the accumulator value if opcode is for the arithmetic unit; otherwise use logic unit output
assign oAccumulator[15:0] = (checkifArith == 1'b1) ? nOutArith[15:0]: nOutLogic[15:0];

//assigns the arithmetic unit zero flag as the ALU zero flag if opcode is for the arithmetic unit; otherwise use logic unit zero flag
assign nZeroflagin = (checkifArith == 1'b1) ? nZeroArith: nZeroLogic;
mDFF_Risingedge_Resetasynclow Zeroflag(nZeroflagin,iClock,1'b1,nZeroflagout);	//stores zero flag in the flipflop

endmodule