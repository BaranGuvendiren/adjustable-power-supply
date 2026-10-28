clear; clc;
board.vin = 20;
board.iload = 2.75;
board.iout_max = board.iload * 1.5;

file_id = fopen('variables.tex', 'w');
tex.write_variables(file_id, board)

u1 = calculators.lm25117(board);
tex.write_variables(file_id, u1)
fclose(file_id);