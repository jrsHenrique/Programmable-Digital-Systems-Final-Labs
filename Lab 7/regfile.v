module regfile(input wire clk,
					input wire we3,
					input wire [4:0] ra1, ra2, wa3,
					input wire [31:0] wd3,
					output wire [31:0] rd1, rd2);

		reg [31:0] registers [31:0];
		
		assign rd1 = registers[ra1];
		assign rd2 = registers[ra2];
		
		always @(posedge clk) begin
			if (we3) begin
				registers[wa3] <= wd3;
			end
		end
endmodule
					