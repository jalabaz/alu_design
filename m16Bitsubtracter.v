module m16Bitsubtracter( input[15:0] iA,			//data input A
								 input[15:0] iB,			//data input B
								 input iC,				//data input C
								 output[15:0] oDiff		        //difference out
								 );
								 
//wire for each borrow
wire[16:0] n;
//variable for generate
genvar i;

//generate a 16-bit subtracter
generate
for (i = 0; i < 16; i = i+1)	//loops the fullsubtracter from i=0 to i=15 (16 iterations) to create a 16-bit subtracter
	begin : forlooping
	if (i == 0)
		begin
		assign n[i] = iC;		//assign the carry input as the first carry
		end
	mFullsubtracter Fullsubtracter (.iA (iA[i]), .iB (iB[i]), .iC (n[i]), .oDiff (oDiff[i]), .oBorrow (n[i+1]));
	end
endgenerate

endmodule