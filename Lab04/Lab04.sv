module Lab04 (
  input logic [1:0] a,
  input logic [1:0] b,
  output logic red,
  output logic blue,
  output logic green
);
  assign red = (~b[0] & ~b[1]) | (a[0] & a[1]) | (a[0] & ~b[1]) | (a[1] & b[1]) | (a[1] & ~b[0]);
  assign blue = (~a[0] & b[0]) | (a[0] & ~b[0]) | (~a[1] & b[1]) | (a[1] & ~b[1]);
  assign green = (~a[1] & ~a[0]) | (b[1] & b[0]) | (~a[1] & b[0]) | (~a[1] & ~b[0]) | (~a[0] & b[1]);

endmodule