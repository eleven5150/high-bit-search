module high_bit_search(
    input clk,
    input [INPUT_WIDTH-1:0] input_data,

    output reg [RESULT_WIDTH-1:0]result = 0
);

parameter INPUT_WIDTH = 8;
localparam RESULT_WIDTH = $clog2(INPUT_WIDTH);

reg [INPUT_WIDTH-1:0] data = 1;
reg [(INPUT_WIDTH/2)-1:0] half = 0;
reg [RESULT_WIDTH:0] size = 0;

always @(posedge clk)
begin
    data <= input_data;
    size <= (INPUT_WIDTH / 8) * 4;
    while (data != 1)
    begin
        half <= data >> size;
        if (half)
        begin
            data <= half;
            result <= result + size;
        end
        else
        begin
            data <= data ^ (half << size);
        end
        size <= size >> 1; 
    end
end

endmodule