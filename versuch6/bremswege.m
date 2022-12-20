close all

values = [20,30,40,50,60,70,80;2,3.4,5.3,7.2,9.5,12.7,15.7]

p = polyfit(values(1, :), values(2,:), 2)

plot(values(1,:), values(2,:))