module LFSR(clock,clear,out);
    input clock, clear;
  	output out;
    reg [7:1] memory;
    initial memory = 7'd16; 
    assign out = memory[7];

    reg retro;
    always @(posedge clock) begin
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