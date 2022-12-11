module tb;
    reg tb_clk = 1;
    localparam TB_INPUT_WIDTH = 8;
    reg [TB_INPUT_WIDTH-1:0] data;

    initial
        forever #5 tb_clk=~tb_clk;

    integer i;
    integer tb_data[9:0];

    initial 
    begin
        tb_data[0] = 8'hDE;
        tb_data[1] = 8'hAD;
        tb_data[2] = 8'hBE;
        tb_data[3] = 8'hEF;
        tb_data[4] = 8'hCA;
        tb_data[5] = 8'hFE;
        tb_data[6] = 8'hBA;
        tb_data[7] = 8'hBA;
        tb_data[8] = 8'hDE;
        tb_data[9] = 8'hDA;
        data = 0;
        for(i = 0; i < 10; i = i + 1)
        begin
            data = tb_data[i];
            #10;
        end
    end

    initial
    begin
        $dumpfile("high_bit_search.vcd");
        $dumpvars(0, tb);
    end

    high_bit_search #(
        .INPUT_WIDTH(TB_INPUT_WIDTH)
    ) high_bit_search_instance(
        .clk(tb_clk),
        .input_data(data)
    );

endmodule