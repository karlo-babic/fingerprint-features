function h = drawcircle(y, x, r, color)  

nsegments = 8;

hold on
th = 0:2*pi/nsegments:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit, color);
hold off

end