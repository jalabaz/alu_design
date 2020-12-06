module mShiftReg(input[15:0] iD,
							input iClock,
							input [2:0] RegCommand,
							output reg[15:0] oQ
							);

always @ (posedge iClock)
	begin
	oQ <= iD;
	if ((RegCommand[2:0]==3'b000))
		oQ <= iD >> 1;
	else if ((RegCommand[2:0]==3'b001))
		oQ <= iD << 1;
	else if ((RegCommand[2:0]==3'b011))
	begin
		oQ <= iD << 1;
		oQ[0] <= iD[15];
	end
	else if ((RegCommand[2:0]==3'b010))
	begin
		oQ <= iD >> 1;
		oQ[15] <= iD[0];
	end
	end

endmodule
	
				