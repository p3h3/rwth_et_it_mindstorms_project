handle = EV3();
handle.connect('usb','beep','on')

close all

laenge = 11;
breite = 17;

clc

values = (laenge:breite);
values(:) = 2;

handle.sensor4.mode = DeviceMode.Color.Col;

%pause(5);
figure();
%plot(0,0,"diamond",'Color','b');
hold on
grid on
%plot(breite+1,laenge+1,"diamond",'Color','b');
xlim([-1 breite+2])
ylim([-1 laenge+2])
 
move.resetPos(handle);

for y=1:1:laenge
    move.Down(handle);
    for x=1:breite
        move.Right(handle);
        scanValue = handle.sensor4.value;

        if scanValue == 6       %Leer
            plot(x,y,"*",'Color','y');
            values(x,y) = 2;

        elseif scanValue == 1   %Barriere
            plot(x,y,"square",'Color','k');
            values(x,y) = -1;

        elseif scanValue == 3   %Startpunkt
            plot(x,y,"o",'Color','g');
            values(x,y) = 1;

        elseif scanValue == 5   %Ziel
            plot(x,y,"o",'Color','r');
            values(x,y) = 0;
        end
    end
    move.Left2(handle, breite + 1)
end

for y=1:laenge
    move.Up(handle);
end

move.resetPos(handle); 




values

handle.disconnect();