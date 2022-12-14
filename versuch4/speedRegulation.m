function speedRegulation()

    handle = EV3();
    handle.connect('usb');


    m = handle.motorC;

    m.power = 100;

    m.brakeMode = 'Brake';

    m.speedRegulation = 1;

    % speedregulation regelt das drehmoment so, dass möglicvhst eine
    % konstante drehzahl erreicht wird

    % speedregulation false hat konstantes drehmoment

    m.start();
    pause(10);
    m.stop();

    handle.disconnect();
end