module lab7 (
    input logic [3:0] num,  
    input logic [2:0] sel,  
    input logic write,      
    input logic clk,        
    input logic rst,       

    output logic a, b, c, d, e, f, g,    
    output logic an0, an1, an2, an3, an4, an5, an6, an7 
);

    logic [7:0] sel_output;         
    logic [7:0][3:0] stored_values; 
    logic [3:0] selected_num;       
    logic [7:0] write_enable;       
    logic [3:0] displayed_num;
    logic [7:0] an;
    logic div_clk;
    logic [2:0] counter;
    logic [2:0] sel_sig;

        
    always @(posedge clk) begin
        write_enable <= write ? ~sel_output : 8'b00000000; 
    end
    

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : dff_loop
            d_ff dff_inst (
                .clk(clk),
                .rst(rst),
                .write(write_enable[i]),  
                .d(num),                  
                .q(stored_values[i])      
            );
        end
    endgenerate

        
    freq_div_sim freq_divider_inst (.clk(clk), .rst(rst), .clk_out(div_clk));

    sel_counter sel_counter_inst (.clk(div_clk), .rst(rst), .Q(counter));

    mux8x1 mux8x1_inst (
        .num(stored_values),  
        .sel(counter),            
        .selected_num(selected_num) 
    );

    mux2x1 mux2x1_inst (.a(counter), .b(sel), .w(write), .o(sel_sig)); 

    sel sel_decoder (
        .sel(sel_sig),
        .out(sel_output)
    );

    assign displayed_num = write ? 4'b1111 : selected_num;

    num num_decoder (
        .num(displayed_num),  
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g) 
    );

    assign an = write ? 8'b1111_1111 : sel_output;
    assign {an7, an6, an5, an4, an3, an2, an1, an0} = an;

endmodule

module d_ff (
    input clk,          
    input rst,          
    input write,        
    input [3:0] d,      
    output reg [3:0] q  
);

    always @(posedge clk) begin
        if (rst) 
            q <= 4'b0000;      
        else if (write) 
            q <= d;            
    end

endmodule

module freq_div (
    input logic clk,     // 100 MHz clock input
    input logic rst,     // Active-high rst
    output logic clk_out // 100 Hz output clock
);

    logic [19:0] count = 0; 

    // 1/100M = 10 ns
    // 1/100 = 10 ms
    // toggle per cycle = 2

    // (10ms/10ns * 2) = 5_00_000 cycles

    always_ff @(posedge clk) begin
        if (rst) begin
            count <= 0;
            clk_out <= 0;
        end 
        else if (count == 499_999) begin
            count <= 0;
            clk_out <= ~clk_out; 
        end 
        else begin
            count <= count + 1;
        end
    end

endmodule

module freq_div_sim (
    input logic clk,      
    input logic rst,      
    output logic clk_out  
);

    logic [2:0] count = 3'b000; 

    always_ff @(posedge clk) begin
        if (rst) begin
            count <= 3'b000;
            clk_out <= 0; 
        end 
        else if (count == 3'b111) begin
            count <= 3'b000;
            clk_out <= ~clk_out;
        end 
        else begin
            count <= count + 1;
        end
    end    

endmodule

module mux8x1 (
    input  [7:0][3:0] num,  
    input  [2:0] sel,       
    output reg [3:0] selected_num    
);

always_comb begin
    case (sel)
        3'b000: selected_num = num[0];
        3'b001: selected_num = num[1];
        3'b010: selected_num = num[2];
        3'b011: selected_num = num[3];
        3'b100: selected_num = num[4];
        3'b101: selected_num = num[5];
        3'b110: selected_num = num[6];
        3'b111: selected_num = num[7];
        default: selected_num = 4'b0000;
    endcase
end

endmodule


module mux2x1 (
    input logic [2:0] a, b, 
    input logic w,          
    output logic [2:0] o    
);

    assign o = w ? b : a;  

endmodule

module num (
    input logic [3:0] num,   
    output logic a, b, c, d, e, f, g
);

    always_comb begin
        case (num)
            4'h0: {a, b, c, d, e, f, g} = 7'b0000001;
            4'h1: {a, b, c, d, e, f, g} = 7'b1001111;
            4'h2: {a, b, c, d, e, f, g} = 7'b0010010;
            4'h3: {a, b, c, d, e, f, g} = 7'b0000110;
            4'h4: {a, b, c, d, e, f, g} = 7'b1001100;
            4'h5: {a, b, c, d, e, f, g} = 7'b0100100;
            4'h6: {a, b, c, d, e, f, g} = 7'b0100000;
            4'h7: {a, b, c, d, e, f, g} = 7'b0001111;
            4'h8: {a, b, c, d, e, f, g} = 7'b0000000;
            4'h9: {a, b, c, d, e, f, g} = 7'b0000100;
            4'hA: {a, b, c, d, e, f, g} = 7'b0001000;
            4'hB: {a, b, c, d, e, f, g} = 7'b1100000;
            4'hC: {a, b, c, d, e, f, g} = 7'b0110001;
            4'hD: {a, b, c, d, e, f, g} = 7'b1000010;
            4'hE: {a, b, c, d, e, f, g} = 7'b0110000;
            4'hF: {a, b, c, d, e, f, g} = 7'b0111000;
            default: {a, b, c, d, e, f, g} = 7'b1111111; 
        endcase
    end

endmodule

module sel (
    input  logic [2:0] sel,    
    output logic [7:0] out     
);

    always_comb begin
        out = 8'b1111_1111;    
        out[sel] = 0;          
    end
    
endmodule

module sel_counter (
    input logic clk,    
    input logic rst,    
    output logic [2:0] Q 
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 3'b000;
        else 
            Q <= Q + 1'b1;
    end

endmodule