% Skript zum Einscannen eines 15 * 15 Rasters aus weißen
% und schwarzen Quadraten

handle = EV3();
handle.connect('usb');

farbsensor = handle.sensor4;

laenge = 15;
breite = 15;

scan = einscannen(15, 10);