`timescale 1ns/1ns

module high_bit_search_tb;
    localparam TB_INPUT_WIDTH = 8;

    reg tb_clk = 1;
    reg [TB_INPUT_WIDTH-1:0] input_data;

    reg unsigned [TB_INPUT_WIDTH-1:0] idx; 

    initial 
        forever #5 tb_clk=~tb_clk;

    integer tb_data[9:0];

    initial 
    begin
    tb_data[0] = 8'hDE;
    tb_data[1] = 8'h03;
    tb_data[2] = 8'hBE;
    tb_data[3] = 8'h15;
    tb_data[4] = 8'hCA;
    tb_data[5] = 8'h24;
    tb_data[6] = 8'hBA;
    tb_data[7] = 8'h76;
    tb_data[8] = 8'hDE;
    tb_data[9] = 8'h43;
    input_data = 0; 
    for(idx = 0; idx < 10; idx = idx + 1)
    begin 
        input_data = tb_data[idx]; 
        #10; 
    end
    end

    initial
    begin
        $dumpfile("high_bit_search.vcd");
        $dumpvars(0, high_bit_search_tb);
    end

    high_bit_search #(.INPUT_WIDTH(TB_INPUT_WIDTH)) high_bit_search_instance (
    .clk(tb_clk),
    .input_data(input_data)
    );

endmodule 
