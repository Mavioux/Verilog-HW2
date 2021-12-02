
module Noisy_Channel(   output wire[17:1] noisy_ouput,
                        input wire[17:1] input_word,
                        input wire[17:1] error);

xor(noisy_ouput[1], input_word[1], error[1]);
xor(noisy_ouput[2], input_word[2], error[2]);
xor(noisy_ouput[3], input_word[3], error[3]);
xor(noisy_ouput[4], input_word[4], error[4]);
xor(noisy_ouput[5], input_word[5], error[5]);
xor(noisy_ouput[6], input_word[6], error[6]);
xor(noisy_ouput[7], input_word[7], error[7]);
xor(noisy_ouput[8], input_word[8], error[8]);
xor(noisy_ouput[9], input_word[9], error[9]);
xor(noisy_ouput[10], input_word[10], error[10]);
xor(noisy_ouput[11], input_word[11], error[11]);
xor(noisy_ouput[12], input_word[12], error[12]);
xor(noisy_ouput[13], input_word[13], error[13]);
xor(noisy_ouput[14], input_word[14], error[14]);
xor(noisy_ouput[15], input_word[15], error[15]);
xor(noisy_ouput[16], input_word[16], error[16]);
xor(noisy_ouput[17], input_word[17], error[17]);

// Could I create this with a genvar and a for loop and if so how?

endmodule