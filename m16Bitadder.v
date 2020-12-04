module m16Bitadder( input[15:0] iA,			//data input A
						 input[15:0] iB,			//data input B
						 input iC,					//data input C
						 output[15:0] oSum,		//sum out
						 output oCarryout
						 );
wire[16:0] n;
genvar i;

generate
for (i = 0; i < 16; i = i+1)
	begin : forlooping
	if (i == 0)
		begin
		assign n[i] = iC;
		end
	mFulladder Fulladder (.iA (iA[i]), .iB (iB[i]), .iC (n[i]), .oSum (oSum[i]), .oCarryout (n[i+1]));
	end
endgenerate

assign oCarryout = n[16];

endmodule
