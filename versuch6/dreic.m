function values = dreic()
    handle = EV3();
    
    handle.connect("usb");

    t = timer;
    set(t, 'ExecutionMode', 'fixedRate');
    set(t, 'StartFcn', @timerFcn);
    set(t, 'StopFcn', @timerFcn);
    set(t, 'TimerFcn', @timerFcn);
    set(t, 'ErrorFcn', @timerFcn);
    set(t, 'Period', 0.03);
    set(t, 'StartDelay', 0);
    myData.values = zeros(1,2);
    myData.stopped = 0;
    myData.brick = handle;
    set(t, 'UserData', myData);

    s = handle.sensor4;
    
    m1 = handle.motorB;
    m2 = handle.motorC;
    
    
    m1.limitMode = 'Tacho';
    m2.limitMode = 'Tacho';
    
    
    m1.resetTachoCount();
    m2.resetTachoCount();
    
    m1.limitValue = 5000;
    m1.power = 80;
    m1.brakeMode = 'Coast';
    
    m2.limitValue = 5000;
    m2.power = 80;
    m2.brakeMode = 'Coast';

    m1.syncedStart(m2);

    tic;
    start(t);

    while s.value > 40
        pause(0.02)
    end

    m1.syncedStop();
    t.userData.stopped = 1;

    pause(2);
    
    stop(t);

    
    handle.disconnect();

    values = t.UserData.values;

    plot(values(:,2), values(:,1), values(:,2), values(:,3));
    axis padded
end



function timerFcn (timerObj, event)
    
    vals = timerObj.UserData.values;

    vals

    index = length(vals) + 1;
    vals(index, 1) = timerObj.UserData.brick.sensor4.value;
    vals(index, 3) = timerObj.UserData.stopped;
    vals(index, 2) = toc;

    timerObj.UserData.values = vals;

end
