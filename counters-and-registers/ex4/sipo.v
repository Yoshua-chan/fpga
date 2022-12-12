`timescale 1ns/1ps

module sipo(output [7:0] Pout = 8'b0, input Sin, input clk, input ce);
	always @(posedge clk) begin
		if(ce) begin
			Pout <= { Pout[6:0], Sin};
		end
	end
endmodule
