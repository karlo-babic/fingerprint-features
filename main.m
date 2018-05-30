
%%
im = imread('test.tif');
imshow(im);

%%
[normim, mask] = ridgesegment(im, 16, 0.4);
orientim = ridgeorient(normim, 1, 10, 3);
imshow(orientim/pi);

%%
poincares = poincare(orientim, mask);

figure; imshow(im);
[h, w] = size(orientim);
for i = 1:h
    for j = 1:w
        if (poincares(i,j) >= 0.9 && poincares(i,j) <= 1.1) % loop
            drawcircle(i, j, 3, 'r');
        elseif (poincares(i,j) <= -0.7 && poincares(i,j) >= -1.3) % delta
            drawcircle(i, j, 3, 'b');
        end
    end
end
