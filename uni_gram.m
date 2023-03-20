function Unigram = uni_gram(filename)   %Creating function to count occurence of each word
     [total_words, words] = CountWords(filename);  %Get the total unique words and the actual unique words
  
    Unigram = zeros(1, total_words); % Create a Matrix named Unigram which is initialized with zeros initally
                                            % Here total_unique_words is
                                            % the length of the matrix
    
    for i = 1:total_words          %Looping through the  words
        current_word = words{i};   %Get the current word which the iterator i is at
        
        occurrences = sum(strcmp(words, current_word)); % We count the number of occurences of the word 
        
        
        Unigram(i) = occurrences; % % Update the unigram matrix with the count of each word
    end
end