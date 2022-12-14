%% Lichtsensor-Versuch - Sensor in Schleife auslesen
function lightReadWithLoop(brickObj, numberOfSeconds)
    
    tic;

    values = [];

    while toc < numberOfSeconds
        index = length(values) + 1;
        values(index, 1) = brickObj.sensor4.value;
        values(index, 2) = toc;
        
        pause(0.2);
    end

    values

    plot(values(:,2), values(:,1));
    axis padded

    figure;

    plot(diff(values(:,2)))
    hold on

    median_line = mean(diff(values(:,2))) * ones(size(values));
    plot(median_line, 'r');
    axis padded

end