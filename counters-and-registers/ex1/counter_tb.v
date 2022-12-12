`timescale 1ns/1ps

module counter_tb();
	wire [3:0] Q;
	reg up;
	reg clk;
	reg clk_en;
	reg rst;

    counter cnt(Q, up, clk, clk_en, rst);
	
    initial begin // For EDA Playground to work for some reason
      $dumpfile("dump.vcd"); $dumpvars;
    end
  
	initial begin
		up = 1;
		clk = 0;
		clk_en = 0;
		rst = 0;
	end

	always begin
		#10 clk = ~clk;
	end

	initial	begin
		#30 clk_en = 1;
		#200 up = 0;
		#230 rst = 1;
		#10  rst = 0;
      	#100 $finish;
    end
endmodule
