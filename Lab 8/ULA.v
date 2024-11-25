module ULA(
    input            clk,
    input      [0:3] inputULA, 
    input      [0:31] a,        
    input      [0:31] b,        
    output reg [0:31] outputULA 
);

always @(posedge clk) begin
    case(inputULA)
        4'b0000: outputULA = a & b;         
        4'b0001: outputULA = a | b;         
        4'b0010: outputULA = a + b;         
        4'b0110: outputULA = a - b;         
        4'b0111: outputULA = (a < b) ? 32'b1 : 32'b0; 
        default: outputULA = 32'b0;         // Default case (error)
    endcase
end

endmodule
