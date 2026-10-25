function write_variables(file_id, s_data)
    % get struct name
    struct_name = inputname(2);
    if isempty(struct_name) % set name to 'u' if there is none
        struct_name = 'u';
    end
    struct_name = tex.format_variable(struct_name);
    
    fields = fieldnames(s_data);
    for i = 1:length(fields) % process all components in the struct
        s_variable.name = fields{i};
        s_variable.value = s_data.(s_variable.name);
        
        s_variable.name(1) = upper(s_variable.name(1)); % capitalize the first letter of the variable for readability
        s_variable.name = tex.format_variable(s_variable.name);

        % get converted strings
        si_str = converters.to_si_unit(s_variable.name, s_variable.value);
        eng_str = converters.to_engineering(s_variable.value);

        macro_name = [struct_name, s_variable.name];
        % save to tex file
        fprintf(file_id, '\\newcommand{\\%sSI}{%s}\n', macro_name, si_str);
        fprintf(file_id, '\\newcommand{\\%s}{%s}\n', macro_name, eng_str);
    end
end