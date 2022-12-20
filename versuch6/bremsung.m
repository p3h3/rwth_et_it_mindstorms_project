function abstand = bremsung(speed)
%BREMSUNG Summary of this function goes here
%   Detailed explanation goes here
handle = EV3();
handle.connect('usb');

m1 = handle.motorB;
m2 = handle.motorC;

m1.power = speed;
m2.power = speed;

m1.brakeMode = 'Coast';
m2.brakeMode = 'Coast';


bremsweg = 0.0018 * speed * speed + 0.0461 * speed + 0.3857
m1.start();
m2.start();
while(handle.sensor4.value > 40 + bremsweg)
    pause(0.01);
end
m2.stop();
m1.stop();
pause(2);
abstand = handle.sensor4.value;

