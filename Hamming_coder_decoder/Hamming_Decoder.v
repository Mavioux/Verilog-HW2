module Hamming_Decoder(  output wire[12:1] decoded_word,
                        input wire[17:1] noisy_word);

wire p1, p2, p3, p4, p5;

wire[1:5] err_num;

xor(w1_1, noisy_word[1], noisy_word[3]);
xor(w1_2, noisy_word[5], noisy_word[7]);
xor(w1_3, noisy_word[9], noisy_word[11]);
xor(w1_4, noisy_word[13], noisy_word[15]);
xor(w1_5, w1_1, w1_2);
xor(w1_6, w1_3, w1_4);
xor(w1_7, w1_5, w1_6);
xor(err_num[1], w1_7, noisy_word[17]);

xor(w2_1, noisy_word[2], noisy_word[3]);
xor(w2_2, noisy_word[6], noisy_word[7]);
xor(w2_3, noisy_word[10], noisy_word[11]);
xor(w2_4, noisy_word[14], noisy_word[15]);
xor(w2_5, w2_1, w2_2);
xor(w2_6, w2_3, w2_4);
xor(err_num[2], w2_5, w2_6);

xor(w3_1, noisy_word[4], noisy_word[5]);
xor(w3_2, noisy_word[6], noisy_word[7]);
xor(w3_3, noisy_word[12], noisy_word[13]);
xor(w3_4, noisy_word[14], noisy_word[15]);
xor(w3_5, w3_1, w3_2);
xor(w3_6, w3_3, w3_4);
xor(err_num[3], w3_5, w3_6);

xor(w4_1, noisy_word[8], noisy_word[9]);
xor(w4_2, noisy_word[10], noisy_word[11]);
xor(w4_3, noisy_word[12], noisy_word[13]);
xor(w4_4, noisy_word[14], noisy_word[15]);
xor(w4_5, w4_1, w4_2);
xor(w4_6, w4_3, w4_4);
xor(err_num[4], w3_5, w3_6);

xor(err_num[5], noisy_word[16], noisy_word[17]);

//3 - 00011
and(temp1, ~err_num[5], ~err_num[4], ~err_num[3], err_num[2], err_num[1]);
xor(decoded_word[1], temp1, noisy_word[3]);

//5 - 00101
and(temp2, ~err_num[5], ~err_num[4], err_num[3], ~err_num[2], err_num[1]);
xor(decoded_word[2], temp2, noisy_word[5]);

//6 - 00110
and(temp3, ~err_num[5], ~err_num[4], err_num[3], err_num[2], ~err_num[1]);
xor(decoded_word[3], temp3, noisy_word[6]);

//7 - 00111
and(temp4, ~err_num[5], ~err_num[4], err_num[3], err_num[2], err_num[1]);
xor(decoded_word[4], temp4, noisy_word[7]);

//9 - 01001
and(temp5, ~err_num[5], err_num[4], ~err_num[3], ~err_num[2], err_num[1]);
xor(decoded_word[5], temp5, noisy_word[9]);

//10 - 01010
and(temp6, ~err_num[5], err_num[4], ~err_num[3], err_num[2], ~err_num[1]);
xor(decoded_word[6], temp6, noisy_word[10]);

//11 - 01011
and(temp7, ~err_num[5], ~err_num[4], err_num[3], ~err_num[2], err_num[1]);
xor(decoded_word[7], temp7, noisy_word[11]);

//12 - 01100
and(temp8, ~err_num[5], ~err_num[4], err_num[3], ~err_num[2], err_num[1]);
xor(decoded_word[8], temp8, noisy_word[12]);

//13 - 01101
and(temp9, ~err_num[5], err_num[4], err_num[3], ~err_num[2], err_num[1]);
xor(decoded_word[9], temp9, noisy_word[13]);

//14 - 01110
and(temp10, ~err_num[5], err_num[4], err_num[3], err_num[2], ~err_num[1]);
xor(decoded_word[10], temp10, noisy_word[14]);

//15 - 01111
and(temp11, ~err_num[5], err_num[4], err_num[3], err_num[2], err_num[1]);
xor(decoded_word[11], temp11, noisy_word[15]);

//17 - 10001
and(temp12, err_num[5], ~err_num[4], ~err_num[3], ~err_num[2], err_num[1]);
xor(decoded_word[12], temp12, noisy_word[17]);

endmodule
