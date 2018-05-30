function orientim = ...
             ridgeorient(im, gradientsigma, blocksigma, orientsmoothsigma)
    sze = fix(6*gradientsigma);   if ~mod(sze,2); sze = sze+1; end
    f = fspecial('gaussian', sze, gradientsigma);
    [fx,fy] = gradient(f);
    
    Gx = filter2(fx, im);
    Gy = filter2(fy, im);
   
    Gxx = Gx.^2;
    Gxy = Gx.*Gy;
    Gyy = Gy.^2;
    
    sze = fix(6*blocksigma);   if ~mod(sze,2); sze = sze+1; end    
    f = fspecial('gaussian', sze, blocksigma);
    Gxx = filter2(f, Gxx); 
    Gxy = 2*filter2(f, Gxy);
    Gyy = filter2(f, Gyy);
    
    denom = sqrt(Gxy.^2 + (Gxx - Gyy).^2) + eps;
    sin2theta = Gxy./denom;
    cos2theta = (Gxx-Gyy)./denom;
       
    sze = fix(6*orientsmoothsigma);   if ~mod(sze,2); sze = sze+1; end    
    f = fspecial('gaussian', sze, orientsmoothsigma);
    sin2theta = filter2(f, sin2theta);
    cos2theta = filter2(f, cos2theta);
    
    orientim = pi/2 + atan2(sin2theta,cos2theta)/2;
end