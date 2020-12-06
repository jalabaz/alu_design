module ALU_DESIGN (input[15:0] iA,
						input[15:0] iB,
						input[2:0] iAluOpcode,
						input[2:0] iRegACommand,
						input[2:0] iRegBCommand,
						input iClock,
						output[15:0] oAccumulator,
						output nCarryflagout, nZeroflagout
						);

//for iRegXCommands: 0xx will enable shift; 1xx disables shift
//							xx0 and xx1 dictates the direction of shift (right and left, respectively)
//							x0x and x1x dictates the type of shift (linear and circular, respectively)

//initialize wires; used to connect register output to alu operand inputs
wire[15:0] nRegA;
wire[15:0] nRegB;

//runs the functions(designated by their opcode) of both logic unit and arithmetic unit					
mALU ALU_BLOCK(nRegA[15:0],nRegB[15:0],iAluOpcode[2:0], iClock, oAccumulator[15:0], nCarryflagout, nZeroflagout);
mShiftReg REGA_BLOCK(iA[15:0],iClock,iRegACommand[2:0],nRegA[15:0]);
mShiftReg REGB_BLOCK(iB[15:0],iClock,iRegBCommand[2:0],nRegB[15:0]);

endmodule