module MIPS(
    input             clk,
    input      [0:1]  OpALU,
    input      [0:5]  funct,
    input      [0:31] a,
    input      [0:31] b,
    output     [0:31] outputULA
);

    
    wire [0:3] inputALU;

    
    ULAControl control_unit (
        .clk(clk),         
        .OpALU(OpALU),     
        .funct(funct),     
        .inputALU(inputALU)
    );

    
    ULA alu_unit (
        .clk(clk),          
        .inputULA(inputALU), 
        .a(a),              
        .b(b),              
        .outputULA(outputULA) 
    );

endmodule
