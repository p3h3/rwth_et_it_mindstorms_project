function soundsensor()

    v = messung;

    x_werte = [1:1000];

    plot(x_werte, v);
end

function values = messung()
    handle = EV3();
    handle.connect("usb");

    handle.sensor2.mode = DeviceMode.NXTSound.DB;

    values = [];
    
    fprintf("Recording... ")

    for i = 1:1000
        values(i) = handle.sensor2.value;
        pause(5);
    end
    fprintf("finished\n")

    handle.disconnect();
end


function pause(ms)
    java.lang.Thread.sleep(ms);
end