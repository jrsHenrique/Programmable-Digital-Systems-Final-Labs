module ULAControl(
    input            clk,
    input      [0:1] OpALU,
    input      [0:5] funct,
    output reg [0:3] inputALU
);

always @(*) begin
    case(OpALU)
        2'b00: begin  // LW or SW
            inputALU = 4'b0010; 
        end
        
        2'b01: begin  // Branch equal
            inputALU = 4'b0110;  
        end
        
        2'b10: begin  // R-type operations
            case(funct)
                6'b100000: inputALU = 4'b0010;  
                6'b100010: inputALU = 4'b0110;  
                6'b100100: inputALU = 4'b0000;  
                6'b100101: inputALU = 4'b0001;  
                6'b101010: inputALU = 4'b0111;  
                default: inputALU = 4'bxxxx;    // Default case (error)
            endcase
        end
        
        default: begin
            inputALU = 4'b0000;  // Default case (error)
        end
    endcase
end

endmodule
