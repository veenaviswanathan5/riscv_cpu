module program_counter #(parameter WIDTH = 32) (
    input  logic             clk,
    input  logic             reset,
  input  logic [WIDTH-1:0] pc_next,
  output logic [WIDTH-1:0] pc
);
  
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            // On reset, force the PC to 0
            pc <= {WIDTH{1'b0}}; 
        end
        else begin
            pc <= pc_next;
        end
    end

endmodule