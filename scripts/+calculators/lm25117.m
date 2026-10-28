function u1 = lm25117(board)
    u1.fsw = 435e3;    
    % timer resistor
    u1.rt_calc = 5.2e9 / u1.fsw - 949;
    u1.rt = 11e3;
    
    u1.ipp = board.iload * 0.2;
    u1.vout_typ = 8;
    % output inductor
    u1.lo_calc = u1.vout_typ / (u1.ipp * u1.fsw) * (1 - u1.vout_typ / board.vin);
    u1.lo = 20e-6;

    u1.vout_min = 1.25;
    % current sense resistor
    u1.rcs_calc = 0.12 / (board.iout_max + u1.vout_typ / (u1.fsw * u1.lo) - u1.ipp / 2);
    u1.rcs = 25e-3;
    u1.prcs_calc = (1 - u1.vout_min / board.vin) * board.iload^2 * u1.rcs;

    % ramp resistor and capacitor
    u1.cramp = 1e-9;
    u1.rramp_calc = u1.lo / (u1.cramp * u1.rcs * 10);
    u1.rramp = 80e3;
end