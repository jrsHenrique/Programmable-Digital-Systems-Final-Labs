`timescale 1ns/1ps

module regfile_tb;

    // Sinais do DUT (Device Under Test)
    reg clk;
    reg we3;
    reg [4:0] ra1, ra2, wa3;
    reg [31:0] wd3;
    wire [31:0] rd1, rd2;

    // Instância do módulo regfile
    regfile uut (
        .clk(clk),
        .we3(we3),
        .ra1(ra1),
        .ra2(ra2),
        .wa3(wa3),
        .wd3(wd3),
        .rd1(rd1),
        .rd2(rd2)
    );

    // Clock de 10ns (100MHz)
    always #5 clk = ~clk;

    initial begin
        // Inicialização
        clk = 0;
        we3 = 0;
        ra1 = 0;
        ra2 = 0;
        wa3 = 0;
        wd3 = 0;

        // Aguarde a borda de clock inicial
        #10;

        // Caso 1: Escrever no registrador 0000
        wa3 = 5'b00000; // Endereço do registrador 0000
        wd3 = 32'hA5A5A5A5; // Valor a ser escrito
        we3 = 1; // Habilitar escrita
        #10; // Esperar borda de clock

        // Caso 2: Escrever no registrador 0001
        wa3 = 5'b00001; // Endereço do registrador 0001
        wd3 = 32'h5A5A5A5A; // Outro valor a ser escrito
        we3 = 1; // Habilitar escrita
        #10; // Esperar borda de clock

        // Desativar escrita
        we3 = 0;

        // Caso 3: Ler do registrador 0000
        ra1 = 5'b00000; // Endereço de leitura 0000
        #10; // Esperar propagação

        // Caso 4: Ler do registrador 0001
        ra2 = 5'b00001; // Endereço de leitura 0001
        #10; // Esperar propagação

        // Verificar resultados
        if (rd1 == 32'hA5A5A5A5)
            $display("Teste de leitura 0000: SUCESSO");
        else
            $display("Teste de leitura 0000: FALHA, valor retornado = %h", rd1);

        if (rd2 == 32'h5A5A5A5A)
            $display("Teste de leitura 0001: SUCESSO");
        else
            $display("Teste de leitura 0001: FALHA, valor retornado = %h", rd2);

        // Finalizar simulação
        $finish;
    end

    // Exibir ondas no GTKWave
    initial begin
        $dumpfile("regfile_tb.vcd"); // Arquivo de saída para GTKWave
        $dumpvars(0, regfile_tb); // Dump de todas as variáveis
    end

endmodule
