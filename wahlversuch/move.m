classdef move
    methods(Static)
            
    %% bewegt den Farbsensor nach hinten
    function Up(handle)
        m2 = handle.motorB;

        m2.power = 20;
        m2.limitMode = 'Tacho';
        m2.limitValue = 10;
        m2.resetTachoCount();

        m2.start();
        m2.waitFor();
        m2.stop();
    end



    %% bewegt den Farbsensor nach vorne
    function Down(handle)
        m2 = handle.motorB;

        m2.power = -20;
        m2.limitMode = 'Tacho';
        m2.limitValue = 10;
        m2.resetTachoCount();

        m2.start();
        m2.waitFor();
        m2.stop();
    end



    %% bewegt den Papierträger nach links
    function Left(handle)
        m1 = handle.motorC;

        m1.power = -20;
        m1.limitMode = 'Tacho';
        m1.limitValue = 10;
        m1.resetTachoCount();

        m1.start();
        m1.waitFor();
        m1.stop();
    end




    %% bewegt den Papierträger nach rechts
    function Right(handle)
        m1 = handle.motorC;

        m1.power = 20;
        m1.limitMode = 'Tacho';
        m1.limitValue = 10;
        m1.resetTachoCount();

        m1.start();
        m1.waitFor();
        m1.stop();
    end

    
    %% bewegt Frabsensor und Papierträger auf die Ausgangsposition
    function resetPos(handle)
        m1 = handle.motorC;

        m1.power = 20;
        m1.limitMode = 'Tacho';
        m1.limitValue = 1000;
        m1.resetTachoCount();

        m1.start();
        m1.waitFor();
        m1.stop();

        m2 = handle.motorB;

        m2.power = -20;
        m2.limitMode = 'Tacho';
        m2.limitValue = 1000;
        m2.resetTachoCount();

        m2.start();
        m2.waitFor();
        m2.stop();
end
end