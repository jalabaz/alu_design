module m16Bitadder( input[15:0] iA,			//data input A
						 input[15:0] iB,			//data input B
						 input iC,					//data input C
						 output[15:0] oSum,		//sum out
						 output oCarryout
						 );
//wire for each carry 
wire[16:0] n;

//variable for generate
genvar i;

//generate a 16-bit adder
generate
for (i = 0; i < 16; i = i+1)	//loops the full adder from i=0 to i=15 (16 iterations) to create a 16-bit adder
	begin : forlooping
	if (i == 0)
		begin
		assign n[i] = iC;
		end
	mFulladder Fulladder (.iA (iA[i]), .iB (iB[i]), .iC (n[i]), .oSum (oSum[i]), .oCarryout (n[i+1]));
	end
endgenerate

//assign last carry as output carry
assign oCarryout = n[16];

endmodule
