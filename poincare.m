function poincares = poincare(orientim, mask)

[h, w] = size(orientim);
poincares = zeros(h, w);

for i = 2:h-1
    for j = 2:w-1
        if (mask(i,j) == 0)
            continue
        end
        
        d = zeros(1,8);
        d(1) = orientim(i-1, j-1);
        d(2) = orientim(i-1, j  );
        d(3) = orientim(i-1, j+1);
        d(4) = orientim(i  , j+1);
        d(5) = orientim(i+1, j+1);
        d(6) = orientim(i+1, j  );
        d(7) = orientim(i+1, j-1);
        d(8) = orientim(i  , j-1);
        d(9) = d(1);
        
        for k = 1:8
            angle = d(k+1) - d(k);
            if (angle > pi/2)
                angle = pi - angle;
            elseif (angle < -pi/2)
                angle = pi + angle;
            end
            poincares(i,j) = poincares(i,j) + angle;
        end
        poincares(i,j) = poincares(i,j) / pi;
    end
end

end