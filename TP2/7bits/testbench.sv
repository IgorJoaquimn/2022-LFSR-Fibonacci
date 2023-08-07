module testbench;
  reg clk;
  parameter PERIOD = 10;
  always #PERIOD clk=~clk;
  integer total_cycles = 200;
  integer cycle        = 200; 
  integer f_out;

  

  initial
  begin
        f_out = $fopen("output.txt","w");
        clk = 0;
  end
  
  wire [7:1] out;
  register7bits epa(clk,out);


  always @(posedge clk && cycle) begin
    $fwrite(f_out, "%d\n",out);
    cycle= cycle - 1;
    if(!cycle) begin
      $fclose(f_out);    
      $finish;
    end

  end

endmodule