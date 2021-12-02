`timescale 1ns/1ns
module Hamming_Encoder_TB();

reg[12:1] number;
reg[17:1] error_position;
reg clock;
reg[12:1] i;

wire[17:1] encoded_number;
wire[17:1] noisy_number;
wire[12:1] decoded_number;

Hamming_Encoder hamming_enc(encoded_number, number);
Noisy_Channel noisy_channel(noisy_number, encoded_number, error_position);
Hamming_Decoder hamming_dec(decoded_number, noisy_number);

initial begin
    number <= 0;
    clock <= 0;
    i <= 0;
    error_position <= 17'b10000000000000000;
    forever #5 clock = ~clock;
end

always @ (posedge clock) begin
    number <= i;
    if(number != decoded_number) begin
        $display("Number: %b different to decoded number: %b \n", number, decoded_number);
    end
end

always @ (negedge clock) begin
    i = i + 1;
end

endmodule