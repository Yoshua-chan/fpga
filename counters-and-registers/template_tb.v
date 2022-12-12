`timescale 1ns/1ps

module template_tb();
	initial begin
		$dumpfile("dump.vcd"); $dumpvars;
	end

	always begin
		#10 clk = ~clk;
	end
endmodule
