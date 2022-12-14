function readValuesContinuisly
    lightConnectEV3('usb', 'ambient');

    while 1==1
        brickObj.sensor4.value
        pause(0.5);
    end
end