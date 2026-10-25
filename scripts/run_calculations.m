clear; clc;
board.vin = 20;

file_id = fopen('variables.tex', 'w');
tex.write_variables(file_id, board)

u1 = calculators.lm25117();
tex.write_variables(file_id, u1)
fclose(file_id);