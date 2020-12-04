module aluMain (input[15:0] iA,
					 input[15:0] iB,
					 input[2:0] iOpcode,
					 input iClock,
					 output[15:0] oAccumulator,
					 output nCarryflagout, nZeroflagout
					);					

// iOpcode values 3'b000 to 3'b100 -->	used by logic unit
// iOpcode values 3'b101 to 3'b111 --> used by arithmetic unit
`define opcodeArith 3'b101

//initialize all wires
wire[1:0] iOpArith = iOpcode[1:0];
wire nZeroflagin, nZeroLogic, nZeroArith;
wire nCarryflagin;
wire[15:0] nOutLogic;
wire[15:0] nOutArith;
wire checkifArith = (iOpcode >= `opcodeArith) ? 1'b1: 1'b0;
wire nReset = (checkifArith == 1'b1) ? 1'b1: 1'b0;
					
mLogicUnit logic_unit (iA,iB,iOpcode,nOutLogic,nZeroLogic);
mArithmeticUnit arith_unit (iA,iB,iOpArith,nOutArith,iClock,nReset,nCarryflagin, nZeroArith);

assign oAccumulator = (checkifArith == 1'b1) ? nOutArith: nOutLogic;

assign nCarryflagout = (checkifArith == 1'b1) ? nCarryflagin: 1'b0;

assign nZeroflagin = (checkifArith == 1'b1) ? nZeroArith: nZeroLogic;
mDFF_Risingedge_Resetasynclow Zeroflag(nZeroflagin,iClock,1'b1,nZeroflagout);

endmodule