// 
// LFSR Image Cypher
// 
// Course: Introdução a Sistemas Lógicos,
//         Universidade Federal de Minas Gerais
// Date:   June 2022 
// 
// Description: The following module simulates the encryption of an
//              image using an LFSR as a Vernam cypher keystream.
//
//				The defined value below corresponds to the number
//              of bits in the image minus 1, and should be changed
//              accordingly to the number of bits.
//
// Execution:   It is mandatory to upload the file with the bits to
//              be encrypted/decrypted in a single string. The name of
//              the file must be "bits.txt". Afterwards, the program
//              is ready for execution. The result will be outputted
//              to the file "lfsr_output.txt". Make sure the option
//              "Download files after run" is checked in order to
//              access it.
//

`define BITS 95480

module lfsr_cypher;
  integer f_in, f_out;
  reg [`BITS:0] s_in;
  integer i, char, j = 0;
  reg clk,clr,res;
  wire s_out;
  LFSR LFSR(clk, clr, s_out);

  ///////////////// READS INPUT FILE
  initial begin
    f_in = $fopen("bits.txt","r");

    if (f_in)  $display("File was opened successfully");
    else       $display("File was NOT opened successfully");

    for (i=`BITS; i>=0; i=i-1) begin  
      char = $fgetc(f_in); 
      if (char=="1") begin 
        s_in[i]= 1'b1; 
      end
      else begin
        s_in[i]=1'b0; 
      end
    end
    
	$fclose(f_in);    
  end
  
  ///////////////// OUTPUT FILE AND VARIABLE ASSIGNMENT
  initial begin
    f_out = $fopen("lfsr_output.txt","w");
    j = `BITS;
    clk=1'b0;
  end
 
  always #1 clk=~clk;  
  
  initial begin
    #1 clr=0; #1 clr=1;
  end
  
  ///////////////// CYPHER BITS
  always @(posedge clk)
    begin
      if (j >= 0) begin
        if(s_out == 1 || s_out == 0) begin
          res = s_in[j] ^ s_out;
          $fwrite(f_out, "%d\n", res);
          j=j-1;
        end
      end
    end
  
  ///////////////// LENGTH OF SIMULATION AND DUMPING
  initial begin
    #220000
    $dumpfile("LFSR.vcd");
    $dumpvars(0, lfsr_cypher);
    $fclose(f_out);    
    $finish;
  end
  
endmodule