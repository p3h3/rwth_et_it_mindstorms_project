function [value switchstate] = touchGetYPos(actualval_vector,cyclecount,brickObj)
% Berechnet den Wert des manuell veraenderlichen Signals fuer die GUI
% Beim Druecken des Tastsensors erhoeht sich der Wert
% und der Wert sinkt beim Loslassen des Tastsensors.
% Ausgabewerte:
%   value: neuer Y-Wert  neuerWert
%   switchstate: Tastsensor-Status
% Eingabewerte:
%   actualval_vector: speichert alle vorherigen Y-Werte (der letzte
%   Eintrag ist die letzte Y-Position)
%   cyclecount: Anzahl der bisherigen Funktionsaufrufe


% % Initialisieren der Bluetooth Verbindung
% brickObj = EV3();
% brickObj.connect('ioType','bt','serPort','/dev/rfcomm0');
% 
% 
% %COM_SetDefaultNXT(h);   gibt es keinen ersatzbefehl fuer?
% 
% % Initialisierung des Sensors und Aufruf der GUI
% 
% %OpenSwitch(SENSOR_1);
% brickObj.sensor1.mode = DeviceMode.Touch.Pushed;
% %
%% Bearbeitung des Codes ab hier:

switchstate = brickObj.sensor1.value;
if(cyclecount > 1)
    lastvalue = actualval_vector(cyclecount);
else
    lastvalue = 0;
end

value = lastvalue;

if switchstate == 1 && lastvalue <= 1.5
    value = lastvalue + 0.15;
end
if switchstate == 0 && lastvalue >= -1.5
    value = lastvalue - 0.15;
end


end
