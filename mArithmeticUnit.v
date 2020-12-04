module mArithmeticUnit (input[15:0] iPortA,
								input[15:0] iPortB,
								input[1:0] iOpcode,
								output[15:0] oAccumulator,
								input iClock,
								input iReset,
								output nCarryflagout, nZeroflagout
								);

//initialize all variables and wires
wire nCarryflagin;	//wire for the carry flag; used as input for the flipflop
wire nAdderCin, enCin;	//wire for carry; used as input for the 16-bit adder
wire nCarry,nBorrow;		//wire for the carry and borrow; borrow is always GND since it is not used.
wire[15:0] nAddAns;	//wire for the sum; used as input for MUX in accumulator
wire[15:0] nSubAns;	//wire for the difference; used as input for MUX in accumulator

//initialize all variables; used for checking the opcode
`define opADD 2'b01
`define opADC 2'b10
`define opSUB 2'b11

//check if opcode is for addition with carry; apply carry as input if so
assign enCin = (iOpcode == `opADC) ? 1'b1: 1'b0;
assign nAdderCin = enCin & nCarryflagout;

//runs the adder and subtracter
m16Bitadder bit16Adder(iPortA[15:0],iPortB[15:0],nAdderCin,nAddAns[15:0],nCarry);
m16Bitsubtracter bit16subtracter(iPortA[15:0],iPortB[15:0],1'b0,nSubAns[15:0],nBorrow);

//code for carry flag
assign nCarryflagin = (iOpcode == `opSUB) ? 1'b0: nCarry;	//if opcode is for subtraction, then carry is 0
mDFF_Risingedge_Resetasynclow Carryflag(nCarryflagin,iClock,iReset,nCarryflagout);	//stores value of flag to flipflop
//code for zero flag
assign nZeroflagout = (oAccumulator == 16'h0000) ? 1'b1 : 1'b0;	//if accumulator is 0, then zero flag is 1

//assign value for accumulator output
assign oAccumulator = (iOpcode == `opSUB) ? nSubAns[15:0]: nAddAns[15:0];

endmodule