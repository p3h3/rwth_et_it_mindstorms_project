function clapsensor_zusatz()
% open a new object
ev3_obj=EV3();
ev3_obj.connect('usb','beep','on');

% set mode to dB
ev3_obj.sensor2.mode = DeviceMode.NXTSound.DB;

% clap detection threshold
clapThreshold = 30;
clapDerivativeThreshold = 20;
numSamples = 15;

% initialize sample array and state of lamps
values = zeros(numSamples, 1);
changes = zeros(numSamples - 1, 1);
states = [0 0 0];

% initially, create the figure without data, all lamps off
plot_handles = []; % will be initiliazed by clapsensorPlot
plot_handles = clapsensorPlot(plot_handles, values, values, [0 0 0], 0);

max_iterations = 50;
iterations = 0;
while iterations < max_iterations  && isvalid(plot_handles.h_fig)
% start loop
    iterations = iterations + 1;
    
    % get a new sample from the sensor    
    s = ev3_obj.sensor2.value;  

    if length(values) > 2
        values = values(2:end);
        values(end+1) = s;
    else
        values(end+1) = s;
    end

    changes = diff(values);

    num_claps = 0;
    for i=1:numSamples-1
        if changes(i) > clapDerivativeThreshold
            num_claps = num_claps+1;
        end
    end


    states = zeros(3,1);

    if num_claps == 1
        states(1) = 1;
    elseif num_claps == 2
        states(1) = 1;
        states(2) = 1;
    elseif num_claps >= 3
        states(1) = 1;
        states(2) = 1;
        states(3) = 1;
    end



    % display plot and lamps
    clapsensorPlot(plot_handles, values, changes, states, clapThreshold);


    
    % wait 10ms between samples
    pause(0.01);
end

% close object
ev3_obj.disconnect();
end

