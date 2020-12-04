module mXORgate(input [15:0] iA,input [15:0] iB, output[15:0] oX);

assign oX[15:0] = iA[15:0] ^ iB[15:0];
endmodule
