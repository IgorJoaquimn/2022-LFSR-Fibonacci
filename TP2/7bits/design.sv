module register7bits(clk,saida);
    output wire [7:1] saida;
    input clk;

    reg [7:1] memory;
    initial memory = 7'd127; 
    assign saida = memory;

    reg retro;
    always @(posedge clk) begin
        retro =  memory[6] ^ memory[7];
        memory[7] <= memory[6];
        memory[6] <= memory[5];
        memory[5] <= memory[4];
        memory[4] <= memory[3];
        memory[3] <= memory[2];
        memory[2] <= memory[1];
        memory[1] <= retro;
    end

endmodule