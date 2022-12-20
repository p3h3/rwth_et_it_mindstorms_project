function moveUp()
% bewegt den Farbsensor nach hinten

m2.power = 20;
m2.limitMode = 'tachoCount';
m2.limitValue = 10;
m2.resetTachoCount();

m2.start();
m2.waitFor();
m2.stop();

y_Pos = y_Pos + 1;

end

