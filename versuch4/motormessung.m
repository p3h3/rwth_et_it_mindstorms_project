function motormessung()
    
    values_30 = messung(30);
    
    values_50 = messung(50);

    values_70 = messung(70);

    plot_shit(values_30, values_50, values_70)
end

function plot_shit(array1, array2, array3)
    figure();
    plot(array1(:, 3), array1(:, 1), ...
        array2(:, 3), array2(:, 1), ...
        array3(:, 3), array3(:, 1))
    legend({'Power 30', 'Power 50', 'Power 70'}, Location="southeast")
    axis padded

    figure();

    plot(array1(:, 3), array1(:, 2), ...
        array2(:, 3), array2(:, 2), ...
        array3(:, 3), array3(:, 2))
    legend({'Power 30', 'Power 50', 'Power 70'}, Location="southeast")
    axis padded
end


function values = messung(power)


    handle = EV3();
    handle.connect('usb');



    values = zeros(200,3);



    m = handle.motorC;

    m.power = power;

    m.brakeMode = 'Brake';
    % 2 is coast
    % 1 is brake

    m.limitMode = 'Tacho';
    m.limitValue = 1000;

    m.resetTachoCount();

    m.start();

    tic;
    for i= 1:200
        values(i, 1) = m.tachoCount;
        values(i, 2) = m.isRunning;
        values(i, 3) = toc;
    end


    m.stop();





    handle.disconnect();

end
