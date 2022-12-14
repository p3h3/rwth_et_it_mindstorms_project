function [values, xTarget, yTarget, xStart, yStart] = maze_scan(handle, axes, speed, scan_progress, breite, laenge)
    %Zettel etwa 11cm x 17cm
    
    MAX_Y = laenge;
    
    MAX_X = breite;
    
    MAX_VAL=10;
    
    clc
    
    values = (laenge:breite);
    values(:) = 2;
    
    handle.sensor4.mode = DeviceMode.Color.Col;
    
    
    move.resetPos(speed, handle);
    
    found_start = 0;
    found_target = 0;
    
    for y=1:1:laenge
        
        for x=1:breite
            move.Right(speed, handle);
            scanValue = handle.sensor4.value;
    
            if scanValue == 6       %Leer
                plot(axes, x,y,"*",'Color','y');
                values(x,y) = 2;
    
            elseif scanValue == 1   %Barriere
                plot(axes,x,y,"square",'Color','k');
                values(x,y) = -1;
    
            elseif scanValue == 2   %Startpunkt
    
                if found_start == 0
                    plot(axes,x,y,"o",'Color','b');
    
                    values(x,y) = 1;
                    xStart=x;
                    yStart=y;
                else
                    values(x,y) = 2;
                    plot(axes,x,y,"*",'Color','y');
                end
                found_start = 1;
    
    
            elseif scanValue == 5   %Ziel
    
                if found_target == 0
                    plot(axes,x,y,"o",'Color','r');
                    values(x,y) = 0;
                    xTarget = x;
                    yTarget = y;
                else
                    values(x,y) = 2;
                    plot(axes, x,y,"*",'Color','y');
                end
    
                found_target = 1
            else
                plot(axes,x,y,"square",'Color','k');
                values(x,y) = -1;
            end
    
        end
        move.Down(speed, handle);
        move.Left2(speed, handle, breite + 2)
        scan_progress.Value = (y / laenge)*100;
    end
    
    move.resetPos(speed, handle);


end

