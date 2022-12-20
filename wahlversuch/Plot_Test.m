handle = EV3();
handle.connect('usb')

close all

size = 8;

clc

values = zeros(size:size);

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
        values(x,y) = handle.sensor4.value;
        if values(x,y) == 6
            plot(x,y,"*",'Color','g');
        elseif values(x,y) ~= 6
            plot(x,y,"square",'Color','k');
        end
        
        pause(0.2);

    end
end


values

handle.disconnect();