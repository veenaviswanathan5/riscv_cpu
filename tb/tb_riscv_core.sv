// Code your testbench here
// or browse Examples
module tb_riscv_core(); 

  // ==========================================
  // 1. THE VIRTUAL WIRES
  // ==========================================
  logic clk;
  logic reset;

  // ==========================================
  // 2. THE DEVICE UNDER TEST (DUT)
  // ==========================================
  riscv_core dut (
    .clk   (clk),
    .reset (reset)
  );

  // ==========================================
  // 3. THE CLOCK GENERATOR
  // ==========================================
  // This statement physically toggles the clock wire every 5 time units.
  always begin
    #5 clk = ~clk; 
  end

  // ==========================================
  // 4. (Boot Sequence)
  // ==========================================
  initial begin
    // vcd 
    // VCD Dump block for EPWave
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_riscv_core);
    
    // Time = 0: Initialize the system.
    // Start with the clock low, and hold the reset button DOWN (1).
    clk = 0;
    reset = 1; 
  // Wait for 10 time units to let the reset propagate through the whole CPU.
    #10;
   
    // Time = 10: Let go of the reset button (0). 
    // The CPU is now active and will start fetching from address 0x00000000.
    reset = 0;

    // Let the simulation run freely for 100 time units.
    #100;

    // Time = 110: Stop the simulation and close the environment.
    $finish; 
    
  end
endmodule