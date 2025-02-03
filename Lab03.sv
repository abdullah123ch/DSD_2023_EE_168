module Lab03(
    input logic a,
    input logic b,
    input logic c,

    output logic x,
    output logic y
);

logic OR_out1;
logic OR_out2;
logic NAND_out;
logic XOR_out;

assign OR_out1 = a | b;
assign x = ~(c)^ OR_out1;
assign NAND_out = ~(a & b);
assign OR_out2 = a | b;
assign XOR_out = NAND_out ^ OR_out2;
assign y = OR_out1 & XOR_out;

endmodule