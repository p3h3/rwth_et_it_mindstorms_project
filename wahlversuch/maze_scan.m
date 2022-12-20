handle = EV3();
handle.connect('usb','beep','on')

close all

laenge = 5;
breite = 5;

clc

values = (size:size);
values(:) = 2;

handle.sensor4.mode = DeviceMode.Color.Col;

%pause(5);
figure();
plot(0,0,"diamond",'Color','b');
hold on
grid on
plot(laenge+1,breite+1,"diamond",'Color','b');
xlim([-1 size+2])
ylim([-1 size+2])
 

for y=1:laenge
    move.moveDown(handle);
    for x=1:breite
        move.moveRight(handle);
        scanValue = handle.sensor4.value;
        if scanValue == 6       %Leer
            plot(x,y,"*",'Color','w');
        elseif scanValue == 1   %Barriere
            plot(x,y,"square",'Color','k');
            values(x,y) = -1
        elseif scanValue == 3   %Startpunkt
            plot(x,y,"o",'Color','g');
            values(x,y) = 1
        elseif scanValue == 5   %Ziel
            plot(x,y,"o",'Color','r');
            values(x,y) = 0
        end
    end
    for x=1:breite
        move.moveLeft(handle);
    end
end

for y=1:laenge
    move.moveUp(handle);
end

values

handle.disconnect();