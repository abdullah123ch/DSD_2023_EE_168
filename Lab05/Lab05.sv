module Lab05(
    input logic [3:0] num,     
    input logic [2:0] sel,     
    output logic segA, segB, segC, segD, segE, segF, segG,
    output logic AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7
);
    assign segA = (num[2] | num[0]) & (num[3] | ~num[1]) & (num[2] | ~num[1]) & (~num[3] |num[0]) & (~num[2] | num[1] | ~num[0]);
    assign segB = (num[3] | num[2]) & (~num[2] | num[1] | num[0]) & (num[3] | ~num[1] | ~num[0]) & (~num[3] | num[1] | ~num[0]) & (~num[3] | ~num[2] | num[0]);
    assign segC = (~num[2]) & (num[3] | num[1]) & (num[3] | ~num[0]) & (num[1] | ~num[0]);
    assign segD = (num[2] | num[0]) & (~num[3] | num[1]) & (num[3] | num[2] | ~num[1]) & (num[3] | ~num[1] | num[0]) & (~num[2] | num[1] | ~num[0]) & (~num[3] | ~num[2] | ~num[0]);
    assign segE = (num[2] | num[0]) & (~num[1] | num[0]) & (~num[3] | num[2]) & (~num[3] | num[0]) & (~num[3] | ~num[1]);
    assign segF = (num[1] | num[0]) & (~num[2] | num[1]) & (~num[2] | num[0]) & (~num[3] | ~num[1]);
    assign segG = (~num[1] | num[0]) & (~num[2] | num[1]) & (~num[3] | ~num[0]);

    assign AN0 = ~(~sel[2] & ~sel[1] & ~sel[0]);
    assign AN1 = ~(~sel[2] & ~sel[1] &  sel[0]);
    assign AN2 = ~(~sel[2] &  sel[1] & ~sel[0]);
    assign AN3 = ~(~sel[2] &  sel[1] &  sel[0]);
    assign AN4 = ~( sel[2] & ~sel[1] & ~sel[0]);
    assign AN5 = ~( sel[2] & ~sel[1] &  sel[0]);
    assign AN6 = ~( sel[2] &  sel[1] & ~sel[0]);
    assign AN7 = ~( sel[2] &  sel[1] &  sel[0]);

endmodule