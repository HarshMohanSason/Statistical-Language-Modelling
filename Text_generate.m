function generated_text = Text_generate(filename, start_word, num_words)   % This function takes three inputs the filename, startword and the number of words user wants to generate
[total_unique_words, unique_words] = UniqueWords(filename);            % get the unique words and the total number of unique words
get_bi_gram = bi_gram(filename);              % get the bigram matrix


start_word_idx = find(strcmp(unique_words, start_word), 1); % We find the index of the start word in the Unique word's list.

% Constraint1: If there is no start_word present in the file, it will randomly select a start word to generate the text to improve the text generation.
if isempty(start_word_idx)
    start_word_idx = randi(total_unique_words);
    start_word = unique_words{start_word_idx};
end

% Generating the text
generated_text = start_word;
current_word = start_word;

for i = 1:num_words
    % Get the probabilities of the next word based on the current word

    current_word_idx = find(strcmp(unique_words, current_word));

    % Constraint 2:

    % Using lapace smoothing to make sure words with very low probability are also chosen by the text generator
    % We added 1 to all the counts in the bigram matrix to avoid zero probabilities,
    % and we added the size of the vocabulary to the denominator to normalize the probabilities.
    % This will ensure that even rare words have a non-zero probability of being selected during text generation.

    next_word_probs = (get_bi_gram(current_word_idx, :) + 1) / (sum(get_bi_gram(current_word_idx, :)) + total_unique_words);


    % Choosing the next word based on the probabilities
    next_word_idx = randsample(total_unique_words, 1, true, next_word_probs);
    next_word = unique_words{next_word_idx};


    generated_text = [generated_text,' ',next_word];  % Add the next word to the generated text


    current_word = next_word;  % To set the current word to the next word
end
end

