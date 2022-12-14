function touchPlot(nominalval_vector,actualval_vector,switchstate_vector)
% Ausgabe der Ergebnisse von der GUI "touchGUI"
% Eingabewerte:
%   nominalval_vector: speichert die Sinuswelle
%   actualval_vector: speichert alle vorherigen Y-Werte (der letzte Eintrag
%   ist die letzte Y-Position)
%   switchstate_vector: speichert die Schalterzustaende des NXT Tastsensors


%% Variablen
x_values = 1:length(nominalval_vector);  % Vektor der x-Werte

%% Bearbeitung des Codes ab hier:

true_vals = 0

for i = 1:length(switchstate_vector)
    if(switchstate_vector(i) == 1)
        true_vals = true_vals + 1
    end
end



plot( ...
    x_values, nominalval_vector,...
    x_values, actualval_vector...
    )
legend({'Sollwert','Istwert'},'Location','southwest')


figure("Name", "Taster")
plot(x_values, switchstate_vector)
axis padded
text(0,0,0,"Treu State Count: " + num2str(true_vals))


end