function uniq_words = Unique_words_SpecifyOption(filename) % function to get the number of unique words where you specify as an option the minimum number of characters in the word
file_contents = To_Lower(filename);  % Get everything in lowercase and remove puntuations
words = strsplit(file_contents);    % get the text file into words of a cell array.

unique_words = unique(words(cellfun(@(w) length(w) >= min_word_length, words)));

% Here we use cellfun function which applies to each element in a
% cell array. We store all the words in the cell array called
%'words' and then we apply the unique function to it where
%length(w) checks if the length of a word 'w' is greater than or
% equal to the specified word length mentioned

uniq_words = length(unique_words);    % Get the total number of unique words in the given file
end