module testbench;
  reg clk;
  parameter PERIOD = 10;
  always #PERIOD clk=~clk;
  integer total_cycles = 8000000;
  integer cycle        = 8000000; 
  integer f_out;

  

  initial
  begin
        f_out = $fopen("output.txt","w");
        clk = 0;
  end
  
  wire [16:1] out;
  register16bits epa(clk,out);


  always @(posedge clk && cycle) begin
    $fwrite(f_out, "%d\n",out[16]);
    cycle= cycle - 1;
    if(!cycle) begin
      $fclose(f_out);    
      $finish;
    end

  end

endmodule