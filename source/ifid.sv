// interface include
`include "ifid_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module ifid(
	input logic CLK, nRST,
	ifid_if.ifx ifid);
  import cpu_types_pkg::*;

always_ff @ (posedge CLK, negedge nRST) begin
  if(!nRST) begin
    ifid.instr_out<=0;
    ifid.pc_next_out<=0;
  end 
  else if(ifid.nop) begin
    ifid.instr_out <=0;
    ifid.pc_next_out<=0;
  end
  else begin
    if (ifid.enable) begin
      ifid.instr_out<=ifid.instr_in;
      ifid.pc_next_out<=ifid.pc_next_in;
    end
  end
end

endmodule
