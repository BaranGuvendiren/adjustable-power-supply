function s_value = engineering_exponent(num)
    % check zero input to prevent error
    if num == 0
        s_value.exponent = 0;
        s_value.significand = '0.00';
        return;
    end

    % calculate engineering exponent (multiples of 3)
    raw_exponent = 3 * floor(log10(abs(num)) / 3);
    s_value.exponent = max(-12, min(9, raw_exponent)); % keep exponent between pico (-12) and giga (9)
    
    % calculate significand and format as string
    calculated_significand = num / (10^s_value.exponent);
    s_value.significand = regexprep(sprintf('%.2f', calculated_significand), '\.0+$', '');
end