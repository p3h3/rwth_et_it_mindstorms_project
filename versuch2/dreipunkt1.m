function dreipunkt1()
    handle = EV3();
    handle.connect("usb")
    handle.debug = 2;
tt1Aa
    for i= [50, 100]
        for j=[500, 1500]
            for k=[500, 1000, 2000]
                handle.playTone(i, j, k)
            end
        end
    end
end

%[ F 0 2A 0 80 0 0 94 1 81 32 82 F4 1 82 F4 1 ]
%                          ^      ^ ^     ^ ^
%                          |       |       |
%                  lautstärke  frequenz   länge b