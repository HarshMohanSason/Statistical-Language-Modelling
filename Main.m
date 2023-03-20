Name_of_the_file = "TheAdventuresofHatimTai.txt";    %load the filename

% Call the generate text function.
% Note: hellish is a word occuring in the book. You can choose any word but
% if the word is not in the book, it will randomly choose a start word
generatetext = Text_generate(Name_of_the_file , 'hellish', 10);
disp(generatetext);      % Display the text
Distribution(Name_of_the_file) ;    % Distribute the words to create a graph.

