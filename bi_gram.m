function Bigram = bi_gram(filename)    % Create a function to get a matrix to get the number of worrds, based on the previous word (Bigram)
[total_words, allwords] = CountWords(filename);  % Get all the words from the CountWords function
[total_unique_words, unique_words] = UniqueWords(filename); % Get the total Unique word Count and the unique words from the Unique Word function


Bigram = zeros(total_unique_words);  % We Initialize the bigram matrix with zeros


for i = 1:total_words - 1         % Loop through all unique words
    curr_word_idx = find(strcmp(unique_words, allwords{i}));          % compare the unique words with all the set of the words and
    next_word_idx = find(strcmp(unique_words, allwords{i+1}));        % compare the unique words with the all the set of words with one index higher.

    Bigram(curr_word_idx, next_word_idx) = Bigram(curr_word_idx, next_word_idx) + 1;  %Update the bigram matrix with the values
end
end