// Licznik synchroniczny zliczający a) w górę b) w dół, modulo 2 n (n=2-8) pracujący w
// kodzie binarnym z dodatkowym wejściem zezwolenia zegara i A) asynchronicznym
// B) synchronicznym resetem.

`timescale 1ns/1ps

module counter(output reg [3:0] Q, input up, input clk, input clk_en, input rst);
	initial
		Q = 4'b0000;
	
	always @(posedge clk or rst) begin
	// For synchronous reset you woul use `always @(posedge clk) begin`
		if(rst) 
			Q = 4'b0000;

		else if(clk_en) begin
			if(up) begin
				if(Q == 4'b1111)
					Q = 4'b0000;
				else
					Q = Q + 1;
			end else begin
				if(Q == 4'b0000)
					Q = 4'b1111;
				else
					Q = Q - 1;
			end
		end
	end
endmodule
