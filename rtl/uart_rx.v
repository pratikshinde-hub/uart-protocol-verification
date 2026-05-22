module uart_rx (
    input clk,
    input reset,
    input rx,
    output reg [7:0] data_out,
    output reg rx_done
);

parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

reg [1:0] state;
reg [2:0] bit_index;
reg [7:0] rx_data;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        state <= IDLE;
        bit_index <= 3'b000;
        rx_done <= 1'b0;
    end

    else
    begin
        case(state)

        IDLE:
        begin
            rx_done <= 1'b0;

            if (rx == 1'b0)
                state <= START;
        end

        START:
        begin
            state <= DATA;
            bit_index <= 3'b000;
        end

        DATA:
        begin
            rx_data[bit_index] <= rx;

            if (bit_index < 7)
                bit_index <= bit_index + 1;

            else
                state <= STOP;
        end

        STOP:
        begin
            data_out <= rx_data;
            rx_done <= 1'b1;
            state <= IDLE;
        end

        default:
            state <= IDLE;

        endcase
    end
end

endmodule
