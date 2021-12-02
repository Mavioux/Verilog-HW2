
module Hamming_Encoder (output wire[17:1] encoded_word,
                        input wire[12:1] input_word);


xor(w1_1, input_word[1], input_word[2]);
xor(w1_2, input_word[4], input_word[5]);
xor(w1_3, input_word[7], input_word[9]);
xor(w1_4, input_word[11], input_word[12]);
xor(w1_5, w1_1, w1_2);
xor(w1_6, w1_3, w1_4);
xor(encoded_word[1], w1_5, w1_6);


xor(w2_1, input_word[1], input_word[3]);
xor(w2_2, input_word[4], input_word[6]);
xor(w2_3, input_word[7], input_word[10]);
xor(w2_4, w2_1, w2_2);
xor(w2_5, w2_3, input_word[11]);
xor(encoded_word[2], w2_4, w2_5);

xor(w3_1, input_word[2], input_word[3]);
xor(w3_2, input_word[4], input_word[8]);
xor(w3_3, input_word[9], input_word[10]);
xor(w3_4, w3_1, w3_2);
xor(w3_5, w3_3, input_word[11]);
xor(encoded_word[4], w3_4, w3_5);

xor(w4_1, input_word[5], input_word[6]);
xor(w4_2, input_word[7], input_word[8]);
xor(w4_3, input_word[9], input_word[10]);
xor(w4_4, w4_1, w4_2);
xor(w4_5, w4_3, input_word[11]);
xor(encoded_word[8], w4_4, w4_5);

assign encoded_word[3] = input_word[1];
assign encoded_word[5] = input_word[2];
assign encoded_word[6] = input_word[3];
assign encoded_word[7] = input_word[4];
assign encoded_word[9] = input_word[5];
assign encoded_word[10] = input_word[6];
assign encoded_word[11] = input_word[7];
assign encoded_word[12] = input_word[8];
assign encoded_word[13] = input_word[9];
assign encoded_word[14] = input_word[10];
assign encoded_word[15] = input_word[11];
assign encoded_word[16] = input_word[12];
assign encoded_word[17] = input_word[12];

endmodule
