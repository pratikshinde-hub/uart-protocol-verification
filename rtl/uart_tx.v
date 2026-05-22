module uart_tx (
    input clk,
    input reset,
    input tx_start,
    input [7:0] data_in,
    output reg tx,
    output reg tx_busy
);

parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

reg [1:0] state;
reg [7:0] tx_data;
reg [2:0] bit_index;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        state <= IDLE;
        tx <= 1'b1;
        tx_busy <= 1'b0;
        bit_index <= 3'b000;
    end

    else
    begin
        case(state)

        IDLE:
        begin
            tx <= 1'b1;
            tx_busy <= 1'b0;

            if (tx_start)
            begin
                tx_data <= data_in;
                state <= START;
                tx_busy <= 1'b1;
            end
        end

        START:
        begin
            tx <= 1'b0;
            state <= DATA;
            bit_index <= 3'b000;
        end

        DATA:
        begin
            tx <= tx_data[bit_index];

            if (bit_index < 7)
                bit_index <= bit_index + 1;

            else
                state <= STOP;
        end

        STOP:
        begin
            tx <= 1'b1;
            state <= IDLE;
        end

        default:
            state <= IDLE;

        endcase
    end
end

endmodule
