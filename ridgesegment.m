function [normim, mask] = ridgesegment(im, blksze, thresh)
    im = normalise(im,0,1);
    
    fun = inline('std(x(:))*ones(size(x))');
    stddevim = blkproc(im, [blksze blksze], fun);
    
    mask = stddevim > thresh;
    maskind = find(mask);

    im = im - mean(im(maskind));
    normim = im/std(im(maskind));    
end