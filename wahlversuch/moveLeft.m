function moveLeft()
% bewegt den Papierträger nach links

m1.power = -20;
m1.limitMode = 'tachoCount';
m1.limitValue = 10;
m1.resetTachoCount();

m1.start();
m1.waitFor();
m1.stop();

x_Pos = x_Pos - 1;

end

