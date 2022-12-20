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
plot(0,0,"diamond",'Color','b');
hold on
grid on
plot(breite+1,laenge+1,"diamond",'Color','b');
xlim([-1 breite+2])
ylim([-1 laenge+2])
 
move.resetPos(handle);

for y=1:2:laenge
    move.Down(handle);
    for x=1:breite
        move.Right(handle);
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
    move.Down(handle);
    for x=breite:-1:1
        move.Left(handle);
        scanValue = handle.sensor4.value;
        if scanValue == 6       %Leer
            plot(x,y+1,"*",'Color','w');
        elseif scanValue == 1   %Barriere
            plot(x,y+1,"square",'Color','k');
            values(x,y+1) = -1
        elseif scanValue == 3   %Startpunkt
            plot(x,y+1,"o",'Color','g');
            values(x,y+1) = 1
        elseif scanValue == 5   %Ziel
            plot(x,y+1,"o",'Color','r');
            values(x,y+1) = 0
        end
    end
end

for y=1:laenge
    move.Up(handle);
end

move.resetPos(handle); 

values

handle.disconnect();