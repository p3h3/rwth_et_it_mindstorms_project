classdef move
    methods(Static)
            
    %% bewegt den Farbsensor nach hinten
    function Up(speed, handle)
        m2 = handle.motorB;

        m2.power = 40 * (speed/2);
        m2.limitMode = 'Tacho';
        m2.brakeMode = 'Brake';
        m2.limitValue = 17;
        m2.resetTachoCount();

        m2.start();
        m2.waitFor();
        m2.stop();
    end



    %% bewegt den Farbsensor nach vorne
    function Down(speed, handle)
        m2 = handle.motorB;

        m2.power = -40 * (speed/2);
        m2.limitMode = 'Tacho';
        m2.brakeMode = 'Brake';
        m2.limitValue = 17;
        m2.resetTachoCount();

        m2.start();
        m2.waitFor();
        m2.stop();
    end



    %% bewegt den Papierträger nach links
    function Left(speed, handle)
        m1 = handle.motorC;

        m1.power = -40 * (speed/2);
        m1.limitMode = 'Tacho';
        m1.brakeMode = 'Brake';
        m1.limitValue = 18;
        m1.resetTachoCount();

        m1.start();
        m1.waitFor();
        m1.stop();
    end

    %% bewegt den Papierträger nach links
    function Left2(speed, handle, fields)
        m1 = handle.motorC;

        m1.power = -40 * (speed/2);
        m1.limitMode = 'Tacho';
        m1.brakeMode = 'Brake';
        m1.limitValue = 20*fields;
        m1.resetTachoCount();

        m1.start();
        m1.waitFor();
        m1.stop();
    end




    %% bewegt den Papierträger nach rechts
    function Right(speed, handle)
        m1 = handle.motorC;

        m1.power = 40 * (speed/2);
        m1.limitMode = 'Tacho';
        m1.brakeMode = 'Brake';
        m1.limitValue = 20;
        m1.resetTachoCount();

        m1.start();
        m1.waitFor();
        m1.stop();
    end

    
    %% bewegt Frabsensor und Papierträger auf die Ausgangsposition

    %m1 = Scanner
    %m2 = Bett
    function resetPos(speed, handle)
        m1 = handle.motorC;

        m1.power = -40 * (speed/2);
        m1.limitMode = 'Tacho';
        m1.brakeMode = 'Brake';
        m1.limitValue = 400;
        m1.resetTachoCount();

        m1.start();
        m1.waitFor();
        m1.stop();

        m2 = handle.motorB;

        m2.power = 30;
        m2.limitMode = 'Tacho';
        m2.brakeMode = 'Brake';
        m2.limitValue = 400;
        m2.resetTachoCount();


        m2.start();
        m2.waitFor();
        m2.stop();
end
end
end