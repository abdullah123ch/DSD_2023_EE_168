module Lab05_behavioural (
    input logic [3:0] num,     
    input logic [2:0] sel,     
    output logic [6:0] segment_pattern,
    output logic [7:0] display_enable
);
  

    always_comb begin
        case (num)
            4'h0: segment_pattern = 7'b0000001;
            4'h1: segment_pattern = 7'b1001111;
            4'h2: segment_pattern = 7'b0010010;
            4'h3: segment_pattern = 7'b0000110;
            4'h4: segment_pattern = 7'b1001100;
            4'h5: segment_pattern = 7'b0100100;
            4'h6: segment_pattern = 7'b0100000;
            4'h7: segment_pattern = 7'b0001111;
            4'h8: segment_pattern = 7'b0000000;
            4'h9: segment_pattern = 7'b0000100;
            4'hA: segment_pattern = 7'b0001000;
            4'hB: segment_pattern = 7'b1100000;
            4'hC: segment_pattern = 7'b0110001;
            4'hD: segment_pattern = 7'b1000010;
            4'hE: segment_pattern = 7'b0110000;
            4'hF: segment_pattern = 7'b0111000;
            default: segment_pattern = 7'b1111111;
        endcase
    end

    always_comb begin
        case (sel)
            3'b000: anode = 8'b11111110;
            3'b001: anode = 8'b11111101;
            3'b010: anode = 8'b11111011;
            3'b011: anode = 8'b11110111;
            3'b100: anode = 8'b11101111;
            3'b101: anode = 8'b11011111;
            3'b110: anode = 8'b10111111;
            3'b111: anode = 8'b01111111;
            default: anode = 8'b11111111; 
        endcase
    end
endmodule