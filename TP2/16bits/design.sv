module register16bits(clk,saida);
    output wire [16:1] saida;
    input clk;

    reg [16:1] memory;
    initial memory = 16'd123; 
    assign saida = memory;

    reg retro;
    always @(posedge clk) begin
        retro        = ((memory[16] ^ memory[15]) ^ memory[13]) ^ memory[4];
        memory[16]  <= memory[15];
        memory[15]  <= memory[14];
        memory[14]  <= memory[13];
        memory[13]  <= memory[12];
        memory[12]  <= memory[11];
        memory[11]  <= memory[10];
        memory[10]  <= memory[9];
        memory[9]   <= memory[8];
        memory[8]   <= memory[7];
        memory[7]   <= memory[6];
        memory[6]   <= memory[5];
        memory[5]   <= memory[4];
        memory[4]   <= memory[3];
        memory[3]   <= memory[2];
        memory[2]   <= memory[1];
        memory[1]   <= retro;
    end

endmodule