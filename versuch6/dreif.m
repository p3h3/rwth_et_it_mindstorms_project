function dreif()
    handle = EV3();
    close all
    clc
    
    handle.connect("usb");
    s = handle.sensor4;
    
    m1 = handle.motorA;

    

    mb = handle.motorB;
    mc = handle.motorC;
    
    m1.limitMode = 'Tacho';
    m1.limitValue = 360 * 15;
    m1.power = 15;
    m1.brakeMode = 'Brake';

    m1.resetTachoCount();

    m1.tachoCount()

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


    opening_start = 500;
    opening_end = 500;
    continue_search = 0;


    for i = 2:length(values(:,1))
        if values(i,1) >= 45 && values(i-1,1) >= 45
            if continue_search == 1
                opening_end = rad2deg(values(i,3));
            end

            if opening_start == 500
                opening_start = rad2deg(values(i,3));
                continue_search = 1;
            end
        end
    end

    opening_start
    opening_end


    opening = (opening_end+opening_start)/2

    polarplot(values(:,3), values(:,1));
    axis padded

    hold on

    polarplot(deg2rad(double(opening)), 20);

    pause(1)


    %FAhrzeug dreht sih zur Öffnung
    %mb.limitValue = 5000;
    mb.power = -10;
    mb.brakeMode = 'Brake';

    %mc.limitValue = 5000;
    mc.power = 10;
    mc.brakeMode = 'Brake';

    %handle.sensor3.reset();

    mb.start();
    mc.start();

    while handle.sensor4.value < 45
        %fprintf("%f\n", handle.sensor4.value())
        pause(0.1)
    end

    pause(0.05)

    mb.stop();
    mc.stop();

    %Fahrzeug fährt gerade aus der Öffnung raus
    mb.limitValue = 5000;
    mb.power = 70;
    mb.brakeMode = 'Brake';

    mc.limitValue = 5000;
    mc.power = 70;
    mc.brakeMode = 'Brake';

    mb.start();
    mc.start();

    while handle.sensor4.value > 20
        pause(0.1)
    end

    mb.stop();
    mc.stop();

    handle.disconnect();
end