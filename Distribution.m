function Distribution(filename)        % Function to plot the distribution of the words which takes fileame as an input
[~, words] = CountWords(filename);    % Get just the words from the CountWords function
words = string(words);               % creates a string array name words to put all the words in it
[total_unique_words, unique_words] = UniqueWords(filename); % get the total number of unique words and the unique words from the uniquewords function

counts = zeros(total_unique_words,1);   % Creating a counts matrix and initializing it with zeroes
for i = 1:total_unique_words            % looping till the length of the total unique words
    counts(i) = sum(strcmp(words, unique_words(i)));  % Updating the matrix and comparing each word to the unique words and adding the summing its count.
end

[sorted_counts, sorted_indices] = sort(counts, 'descend'); % To sort the counts array in descending order
sorted_words = unique_words(sorted_indices);               %To get the indicies of the sorted words.


% Only Display the top 40 words with the highest frequency.
if total_unique_words > 40
    sorted_counts = sorted_counts(1:40);
    sorted_words = sorted_words(1:40);
end

% Get the top 10 words with highest frequency
figure('Position', [100, 100, 1000, 400]);
bar(sorted_counts(1:10));  % Display the graph for the top 10 words with highest freq
set(gca, 'XTick', 1:10);  % To set the tick positions on the x axis (GCA is get current axis and Xtick specifies the axis which we want to mark and till 10 values (1:10))
set(gca, 'XTickLabel', cellstr(sorted_words(1:10)));% get the sorted words in a cell
xtickangle(gca, 45);       % to display the words on x axis at a certain angle to look more presentable
xlabel('Words');           % Labelling x axis
ylabel('Frequency');       % Labelling y axis
title("Top 10 Most Frequent Words"); % Title for the figure

% Get the bottom 10 words with lowest frequency
figure('Position', [100, 100, 1000, 400]);
bar(sorted_counts(end-9:end));  % Display the bar graph
set(gca, 'XTick', 1:10);
set(gca, 'XTickLabel', cellstr(sorted_words(end-9:end)));     % To get the sorted words in a cell
xtickangle(gca, 45);     % to display the words on x axis at a certain angle to look more presentable
xlabel('Words');         % Labelling x axis
ylabel('Frequency');     % Labelling y axis
title("Bottom 10 Least Frequent Words"); % Title for the figure


% Get the top 40 unique words with the highest frequency
figure('Position', [100, 100, 1000, 400]);
bar(sorted_counts);     % Display the bar graph
set(gca, 'XTick', 1:total_unique_words);
set(gca, 'XTickLabel', cellstr(sorted_words));     % To get the sorted words in a cell
xtickangle(gca, 45);     % to display the words on x axis at a certain angle to look more presentable
xlabel('Unique Words');  % Labelling x axis
ylabel('Frequency');     % Labelling y axis
title("Plot Distribution of the Unique Words"); % Title for the figure
end