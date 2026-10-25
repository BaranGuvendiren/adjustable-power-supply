function formatted_name = format_variable(var_name)
    % remove '_' and capitalize the letter after it for readability
    raw_name = regexprep(var_name, '_([a-z])', '${upper($1)}');
    raw_name = regexprep(raw_name, '_', '');

    % map numbers to convert indexes to text
    num_map = containers.Map(...
        {'1','2','3','4','5','6','7','8','9'}, ...
        {'one','two','three','four','five','six','seven','eight','nine'});

    digits = regexp(raw_name, '\d', 'match');
    designator = regexprep(raw_name, '\d', '');
    
    if ~isempty(digits) % convert digit to text if it exist
        formatted_name = [designator, num_map(digits{1})];
    else
        formatted_name = designator;
    end
end