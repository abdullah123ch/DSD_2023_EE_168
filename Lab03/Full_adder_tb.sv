module Full_adder_tb();
 reg a1,b1,c1;
 wire sum1,carry1;

 Full_adder UUT(
 .a(a1),
 .b(b1),
 .c(c1),
 .sum(sum1),
 .carry(carry1));

 initial begin

    a1 = 0; b1=0; c1=0;
    #10;
    a1 = 0; b1=0; c1=1;
    #10;
    a1 = 0; b1=1; c1=1;
    #10;
    a1 = 0; b1=1; c1=1;
    #10;
    a1 = 1; b1=0; c1=0;
    #10;
    a1 = 1; b1=0; c1=1;
    #10;
    a1 = 1; b1=1; c1=0;
    #10;
    a1 = 1; b1=1; c1=1;
    #10;
    $stop;
    
 end
endmodule