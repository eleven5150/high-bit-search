module tb;
    reg tb_clk = 1;
    initial
        forever #5 tb_clk=~tb_clk;

    initial
    begin
        $dumpfile("high_bit_search.vcd");
        $dumpvars(0, tb);
    end

    
endmodule