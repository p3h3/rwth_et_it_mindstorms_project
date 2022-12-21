function values = maze_scan()
    %Zettel etwa 11cm x 17cm
    
    handle = EV3();
    handle.connect('usb','beep','on')
    
    close all
    
    laenge = 15;
    MAX_Y = laenge;
    
    breite = 10;
    MAX_X = breite;
    
    MAX_VAL=10;
    
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
    
    found_start = 0;
    found_target = 0;
    
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
    
            elseif scanValue == 2   %Startpunkt
    
                if found_start == 0
                plot(x,y,"o",'Color','g');
    
                    values(x,y) = 1;
                    xStart=x;
                    yStart=y;
                else
                    values(x,y) = 2;
                end
                found_start = 1;
    
    
            elseif scanValue == 5   %Ziel
    
                if found_target == 0
                plot(x,y,"o",'Color','r');
                    values(x,y) = 0;
                    xTarget = x;
                    yTarget = y;
                else
                    values(x,y) = 2;
                end
    
                found_target = 1
            else
                plot(x,y,"square",'Color','k');
                values(x,y) = -1;
            end
    
        end
        move.Left2(handle, breite + 1)
    end
    
    move.resetPos(handle);
    
    
    
    handle.disconnect();
    
    %solve(values, MAX_X, MAX_Y, xTarget, yTarget, xStart, yStart)

end

