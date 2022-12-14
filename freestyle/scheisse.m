function scheisse()

    handle = initEv3();

    val = 20

    
    %pause(5000);

    while 1==1
    
        while val > 10
            drive(handle, 100, 100, 300)
            pause(300);
            val = handle.sensor4.value
        end
    
        drive(handle, -100, 100, 200)

        handle.playTone(10, 1000, 200);
        pause(200)


        val = handle.sensor4.value

    end

end


function handle = initEv3()
    handle = EV3();
    handle.connect("bt");

end

function drive(handle, powerb, powerc, time)
    mb = handle.motorB;
    mc = handle.motorC;

    if powerb == 0
        if powerc == 0
            mb.syncedStop();
        end
    end

    mb.setProperties('power', powerb, 'limitMode', 'Time', 'limitValue', time, 'brakeMode', 'Brake');

    mc.setProperties('power', powerc, 'limitMode', 'Time', 'limitValue', time, 'brakeMode', 'Brake');
    if mb.isRunning ~= 1
        mc.syncedStart(mb);
    end
end

function pause(ms)
    java.lang.Thread.sleep(ms);
end