function latex_str = to_si_unit(component_id, num)
    % define a unit based on variable type
    switch lower(component_id(1))
        case 'r',  unit = '\ohm';
        case 'v',  unit = '\volt';
        case 'c',  unit = '\farad';
        case 'l',  unit = '\henry';
        case 'f',  unit = '\hertz';
        case 'i',  unit = '\ampere';
        otherwise, unit = '';
    end
    
    % return zero if the num is zero
    if num == 0
        latex_str = sprintf('\\qty{0}{%s}', unit);
        return
    end
    
    s_value = math.engineering_exponent(num);
    switch s_value.exponent
        case 9,    prefix = '\giga';
        case 6,    prefix = '\mega';
        case 3,    prefix = '\kilo';
        case 0,    prefix = '';
        case -3,   prefix = '\milli';
        case -6,   prefix = '\micro';
        case -9,   prefix = '\nano';
        case -12,  prefix = '\pico';
        otherwise, prefix = '';
    end
        
    % use raw string if no unit is found, otherwise use \qty
    if isempty(unit) && isempty(prefix)
        latex_str = sprintf('%s', s_value.significand);
    else
        latex_str = sprintf('\\qty{%s}{%s%s}', s_value.significand, prefix, unit);
    end
end