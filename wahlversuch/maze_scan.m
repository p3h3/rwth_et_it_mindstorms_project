handle = EV3();
handle.connect('usb')

close all

size = 8;

clc

values = (size:size);
values(:) = 2

handle.sensor4.mode = DeviceMode.Color.Col;

%pause(5);
figure();
plot(0,0,"diamond",'Color','b');
hold on
plot(size+1,size+1,"diamond",'Color','b');
xlim([-1 size+2])
ylim([-1 size+2])
 

for y=1:laenge
    moveDown();
    for x=1:breite
        moveRight();
        scanValue = handle.sensor4.value;
        if scanValue == 6       %Leer
            plot(x,y,"*",'Color','g');
        elseif scanValue == 1   %Barriere
            plot(x,y,"square",'Color','k');
            values(x,y) = -1
        elseif scanValue == 3   %Startpunkt
            plot(x,y,"o",'Color','k');
            values(x,y) = 1
        elseif scanValue == 5   %Ziel
            plot(x,y,"o",'Color','k');
            values(x,y) = 0
        end
    end
    for x=1:breite
        moveLeft();
    end
end

for y=1:laenge
    moveUp();
end

values

handle.disconnect();