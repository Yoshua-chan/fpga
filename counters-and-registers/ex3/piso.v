// Układ PISO (Parallel-In Serial-Out) z dodatkowym sygnałem zezwolenia zegara
// (Clock Enable).
`timescale 1ns/1ps

module piso(output reg Sout, input [7:0] Pin, input load, input clk, input ce, input rst);
	reg [7:0] tmp = 8'b0;
	
    always @(posedge clk or rst) begin
		if(rst) begin
			tmp  <= 8'b0;
			Sout <= 1'b0;
		end else if(ce) begin
				if(load) begin
				tmp <= Pin;
			end else begin
				Sout <= tmp[7];
				tmp  <= { tmp[6:0], 1'b0 };
			end
		end
	end
endmodule
