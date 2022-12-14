%% Lichtsensor-Versuch - Sensor timergesteuert auslesen
function lightReadWithTimer(brickObj, numberOfSeconds)

    t = timer;
    set(t, 'ExecutionMode', 'fixedRate');
    set(t, 'StartFcn', @readLightTimerFcn);
    set(t, 'StopFcn', @readLightTimerFcn);
    set(t, 'TimerFcn', @readLightTimerFcn);
    set(t, 'ErrorFcn', @readLightTimerFcn);
    set(t, 'Period', 0.05);
    set(t, 'StartDelay', 0);
    myData.values = zeros(2,2);
    myData.brick = brickObj;
    set(t, 'UserData', myData);

    tic;
    start(t)
    pause(numberOfSeconds);
    stop(t);

    

    values = t.UserData.values;

    plot(values(:,2), values(:,1));
    axis padded

    figure;

    plot(diff(values(:,2)))
    hold on

    median_line = mean(diff(values(:,2))) * ones(size(values));
    plot(median_line, 'r');
    axis padded

end

%--------------------------------------------------------------------------

%%
function readLightTimerFcn (timerObj, event)
    
    vals = timerObj.UserData.values

    index = length(vals) + 1;
    vals(index, 1) = timerObj.UserData.brick.sensor4.value;
    vals(index, 2) = toc;

    timerObj.UserData.values = vals;

    fprintf("moin");

end
