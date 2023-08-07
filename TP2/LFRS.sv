module LFSR(clock,clear,out);
    input clock, clear;
  	output out;
    reg [18:1] memory;
    initial memory = 18'd1; 
    assign out = memory[18];

    reg retro;
    always @(posedge clock) begin
        if(clear == 1) memory = 18'd1;
        retro        = memory[11] ^ memory[18];
        memory[18]  <= memory[17];
        memory[17]  <= memory[16];
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