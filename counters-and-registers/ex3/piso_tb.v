`timescale 1ns/1ps

module piso_tb();
	initial begin
		$dumpfile("dump.vcd"); $dumpvars;
	end
	
	reg load, clk, ce, rst;
	reg [7:0] Pin = 8'b01010101;
	wire Sout;

	piso piso1(Sout, Pin, load, clk, ce, rst);

	initial begin
		#10 load = 1;
			ce   = 1;
		#10 clk = 1;
		#10 clk = 0;
			load = 0;
		forever #10 clk = ~clk;
	end
  
	initial
		#1000 $finish;
endmodule
