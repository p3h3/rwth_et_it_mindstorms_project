%% Aufgabe Zahlendarstellung c)
% Template


%%  ----- MATLAB Calculation -----
 

%% Get two numbers from user dialog
% Tips:
% * use MATLAB command "inputdlg".
% * see MATLAB help for usage and more information.
% * convert the reponse cell array into numbers using "str2double"
%
% ... insert here your code
prompt={'Zahl 1','Zahl 1'};
   name='Input for Peaks function';
   numlines=1;
   defaultanswer={'1','1'};
 
   answer1=inputdlg(prompt,name,numlines,defaultanswer);



%% Calculate the summation of the two numbers
% ... insert here your code
realanswer = str2double(answer1(1)) + str2double(answer1(2));
%imaginaryanswer = answer1(2) + answer2(2);

fprintf('Antwort: %f', realanswer)

%% Initialize figures
plot_number_face;   % plot calculator face figure
hold on             % hold on flag to plot more plots into the calculator face figure



%% Calculate pointers to plot
% Tips:
% * for line plotting only the start and end point of the line has to be given
% * the rotated pointers can be easily constructed by a complex number (value and phase)
% * the length of the complex vectors should be different for both pointers and less than one
% * note the number zero is located at the coordinates (x,y) = (0,1) or (0,i) respectively
% * take care to use degrees or radian
% * consider only angles which are related to the exact number position. Angles between two
% numbers should be neglected.
%
% ... insert here your code


ang1 = mod(floor(realanswer), 10) * 36;
rad1 = ang1./180*pi;
    
% calc complex numbers
Vec1 = 1 * exp(-j * (rad1-pi/2));
    
X1 = real(Vec1)
Y1 = imag(Vec1)


line([0;X1], [0;Y1], 'LineStyle', '-', 'Color', 'red', 'LineWidth', 2);







ang10 = floor(realanswer / 10) * 36;
rad10 = ang10./180*pi;
    
% calc complex numbers
Vec10 = 0.75 * exp(-j * (rad10-pi/2));

X2 = real(Vec10);
Y2 = imag(Vec10);


line([0;X2], [0;Y2], 'LineStyle', '-', 'Color', 'blue', 'LineWidth', 2);



handle = EV3();

handle.connect("usb");

m1 = handle.motorB;
m2 = handle.motorC;


m1.limitMode = 'Tacho';
m2.limitMode = 'Tacho';


m1.resetTachoCount();
m2.resetTachoCount();

m1.limitValue = ang10*45;
fprintf("ang10 %d\n", ang10);
fprintf("ang1  %d\n", ang1);
m1.power = -100;
m1.brakeMode = 'Brake';
if ang10 ~= 0
    m1.start();
end


m2.power = 30;
m2.brakeMode = 'Brake';

m2.limitValue = ang1;
if ang1 ~= 0
    m2.start();
end

m1.waitFor();
m2.waitFor();

pause(2);

m1.stop();
m2.stop();

m1.resetTachoCount();
m2.resetTachoCount();

m1.limitValue = ang10*45;
m1.power = 100;
m1.brakeMode = 'Brake';
if ang10 ~= 0
    m1.start();
end


m2.power = -30;
m2.brakeMode = 'Brake';

m2.limitValue = ang1;
if ang1 ~= 0
    m2.start();
end

m1.waitFor();
m2.waitFor();

m1.stop()
m2.stop()


handle.disconnect();
