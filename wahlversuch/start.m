% Skript zum Einscannen eines 15 * 15 Rasters aus weißen
% und schwarzen Quadraten

handle = EV3();
handle.connect('usb');

m1 = handle.motorA;
m2 = handle.motorB;

farbsensor = handle.sensor4();

laenge = 15;
breite = 15;

x_Pos = 0;
y_Pos = 0;

scan = einscannen();