module Lab04_tb;
  logic [1:0] a;
  logic [1:0] b;
  logic red;
  logic green;
  logic blue;

  Lab04 UUT (
    .a(a),
    .b(b),
    .red(red),
    .green(green),
    .blue(blue)
  );

  // Test cases (all 16 combinations)
  initial begin
    a = 2'b00; b = 2'b00; #10;
    a = 2'b00; b = 2'b01; #10;
    a = 2'b00; b = 2'b10; #10;
    a = 2'b00; b = 2'b11; #10;
    a = 2'b01; b = 2'b00; #10;
    a = 2'b01; b = 2'b01; #10;
    a = 2'b01; b = 2'b10; #10;
    a = 2'b01; b = 2'b11; #10;
    a = 2'b10; b = 2'b00; #10;
    a = 2'b10; b = 2'b01; #10;
    a = 2'b10; b = 2'b10; #10;
    a = 2'b10; b = 2'b11; #10;
    a = 2'b11; b = 2'b00; #10;
    a = 2'b11; b = 2'b01; #10;
    a = 2'b11; b = 2'b10; #10;
    a = 2'b11; b = 2'b11; #10;

    $finish;
  end

  // Display the results
  initial begin
    $monitor("a=%0d, b=%0d, red=%0d, green=%0d, blue=%0d", a, b, red, green, blue);
  end

endmodule