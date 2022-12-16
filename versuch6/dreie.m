function dreie()
    handle = EV3();
    
    handle.connect("usb");
    s = handle.sensor4;
    
    m1 = handle.motorA;
    
    m1.limitMode = 'Tacho';
    m1.limitValue = 360 * 15;
    m1.power = 5;
    m1.brakeMode = 'Brake';

    m1.resetTachoCount();

    values = zeros(1,2);


    tic;

    m1.start();

    while handle.motorA.tachoCount < 360 * 15
        index = length(values) + 1;
        sens_val = handle.sensor4.value;
        values(index, 1) = sens_val;
        values(index, 3) = deg2rad(double(handle.motorA.tachoCount / 15));
        values(index, 2) = toc;
    end

    m1.stop();

    pause(0.5);


    m1.limitValue = 360 * 15;
    m1.power = -80;
    m1.brakeMode = 'Brake';

    m1.start();
    m1.waitFor();
    m1.stop();


    handle.disconnect();


    polarplot(values(:,3), values(:,1));
    axis padded
end