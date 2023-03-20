function [total_word_count, words] = CountWords(filename)       %function to count the number of words
file_contents = To_Lower(filename);       % to read the contents of the file
words = strsplit(file_contents);    % Split the string into set of words
total_word_count = length(words);          % Count the number of words
end