function ToLowerCase = To_Lower(file)       % Function to get the whole file in lowercase
file_contents = ReadFile(file);        % To read the contents of the file
ToLowerCase = lower(regexprep(file_contents,'[^a-zA-Z\s]','')); % getting to lower case and removing any non alphabetic characters
end