module register11bits(clk,saida);
    output wire [11:1] saida;
    input clk;

    reg [11:1] memory;
    initial memory = 11'd2047; 
    assign saida = memory;

    reg retro;
    always @(posedge clk) begin
        retro =  memory[9] ^ memory[11];
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