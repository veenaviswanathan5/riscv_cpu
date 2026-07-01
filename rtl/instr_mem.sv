module instr_mem #( parameter WIDTH =32, 
                  parameter DEPTH = 64)
  ( input logic [WIDTH-1 :0] pc,
   output logic [WIDTH-1 :0] instr
  );
  
  logic [WIDTH-1:0] ram [0:DEPTH-1];
   
initial begin

    ram[0] = 32'h00500113; // addi x2, x0, 5
    ram[1] = 32'h00c00193; // addi x3, x0, 12
    ram[2] = 32'h00218233; // add  x4, x3, x2
    ram[3] = 32'h00402223; // sw   x4, 4(x0)
    ram[4] = 32'h00402283; // lw   x5, 4(x0)
    ram[5] = 32'h00428463; // beq  x5, x4, 8
    ram[6] = 32'h00000293; // addi x5, x0, 0 (Skipped)
    ram[7] = 32'h00128293; // addi x5, x5, 1

end
  
  assign instr = ram[pc[7:2]];
  
endmodule 