
prompt={'Komplexe Zahl 1','Komplexe Zahl 2', 'Operation'};
   name='yo mama';
   numlines=1;
   defaultanswer={'1+2i','2-1i','mul'};
 
   answer1=inputdlg(prompt,name,numlines,defaultanswer);


num1 = str2double(answer1(1));
num2 = str2double(answer1(2));
operation = answer1(3);

fprintf('1: real: %f, complex: %f\n', real(num1), imag(num1))
fprintf('2: real: %f, complex: %f\n', real(num2), imag(num2))



plot_number_face;   % plot calculator face figure
hold on             % hold on flag to plot more plots into the calculator face figure





X2 = real(num1)
Y2 = imag(num1)
line([0;X2], [0;Y2], 'LineStyle', '-', 'Color', 'blue', 'LineWidth', 2);

X3 = real(num2)
Y3 = imag(num2)
line([0;X3], [0;Y3], 'LineStyle', '-', 'Color', 'green', 'LineWidth', 2);




rad1 = 0;
rad2 = 0;

switch cell2mat(operation)
    case "mul"
        rad1 = angle(num1 * num2);
        Vec1 = num1*num2;
        fprintf("mul")
    case "div"
        rad1 = angle(num1 / num2);
        Vec1 = num1/num2;
        fprintf("div")
    case "conj"
        rad1 = angle(conj(num1));
        Vec1 = conj(num1);
        fprintf("conj")
    case "sqrt"
        rad1 = angle(sqrt(num1));
        Vec1 = sqrt(num1);
        fprintf("sqrt")
end

X1 = real(Vec1)
Y1 = imag(Vec1)


line([0;X1], [0;Y1], 'LineStyle', '-', 'Color', 'red', 'LineWidth', 2);



realang1 = 0
realang10 = 0
if -angle(num1) < 0
    realang1 = rad2deg(-angle(num1)+2*pi)+90
else
    realang1 = rad2deg(-angle(num1))+90
end

if -angle(num2) < 0
    realang10 = rad2deg(-angle(num2)+2*pi)+90
else
    realang10 = rad2deg(-angle(num2))+90
end

angle_show(realang1, realang10)

pause(5);

angle_show(rad2deg(rad1)+90, 0)






function angle_show(ang1, ang10)

    ang1
    ang10
    
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
    
    
    m2.power = 15;
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
    
    
    m2.power = -15;
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
end



function readLightTimerFcn (timerObj, event)
    
    vals = timerObj.UserData.values

    index = length(vals) + 1;
    vals(index, 1) = timerObj.UserData.brick.sensor4.value;
    vals(index, 2) = toc;

    timerObj.UserData.values = vals;

    fprintf("moin");

end
