function u1 = lm25117()
    % timer resistor
    u1.fsw = 435e3;
    u1.rt = 5.2e9 / u1.fsw - 949;
end