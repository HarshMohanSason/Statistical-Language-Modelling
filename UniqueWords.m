function [total_unique_words, get_unique_words] = UniqueWords(filename)     % Function to get the total number of unique words in matlab. We can say a unique word with a frequency of 1 in the given text file
file_contents = To_Lower(filename);      % to extract the text file in lowercase
words = split(file_contents);            % to split the text file into words and store in array
get_unique_words = unique(words);        % to get the unique words using in built unique function given by matlab
total_unique_words = length(get_unique_words); % to get the total number of unique words
end