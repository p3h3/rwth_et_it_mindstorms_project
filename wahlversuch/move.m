classdef move
    methods(Static)
            
    %% bewegt den Farbsensor nach hinten
    function moveUp(handle)
        m2 = handle.motorB;

        m2.power = 20;
        m2.limitMode = 'tachoCount';
        m2.limitValue = 10;
        m2.resetTachoCount();

        m2.start();
        m2.waitFor();
        m2.stop();

        handle.y_Pos = y_Pos + 1;

    end



    %% bewegt den Farbsensor nach vorne
    function moveDown(handle)
        m2 = handle.motorB;

        m2.power = -20;
        m2.limitMode = 'tachoCount';
        m2.limitValue = 10;
        m2.resetTachoCount();

        m2.start();
        m2.waitFor();
        m2.stop();

        handle.y_Pos = y_Pos - 1;

    end



    %% bewegt den Papierträger nach links
    function moveLeft(handle)
        m1 = handle.motorC;

        m1.power = -20;
        m1.limitMode = 'tachoCount';
        m1.limitValue = 10;
        m1.resetTachoCount();

        m1.start();
        m1.waitFor();
        m1.stop();

        handle.x_Pos = x_Pos - 1;

    end




    %% bewegt den Papierträger nach rechts
    function moveRight(handle)
        m1 = handle.motorC;

        m1.power = 20;
        m1.limitMode = 'tachoCount';
        m1.limitValue = 10;
        m1.resetTachoCount();

        m1.start();
        m1.waitFor();
        m1.stop();

        handle.x_Pos = x_Pos +1;

    end

end