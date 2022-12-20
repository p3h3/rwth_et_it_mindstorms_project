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



for x = 1:8
    for y = 1:8
        scanValue = handle.sensor4.value;
        if scanValue == 6
            plot(x,y,"*",'Color','g');
            
        elseif scanValue ~= 6
            plot(x,y,"square",'Color','k');
            values(x,y) = -1
        end
        
        pause(0.2);

    end
end


values

handle.disconnect();