function latex_str = to_engineering(num)
    s_value = math.engineering_exponent(num);
    
    if (s_value.exponent == 0)
        latex_str = s_value.significand;
    else
        latex_str = sprintf('%s \\cdot 10^{%d}', s_value.significand, s_value.exponent);
    end
end