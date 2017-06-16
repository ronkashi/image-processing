
%% the code based on the code posted here :
%% https://www.mathworks.com/help/images/examples/marker-controlled-watershed-segmentation.html

% % input - I  = image in grayscale %%
function labeled_img = watershedfunc(I)    
    hy = fspecial('sobel');
    %transpose operation
    hx = hy'; 
    Iy = imfilter(double(I), hy, 'replicate');
    Ix = imfilter(double(I), hx, 'replicate');
    gradmag = sqrt(Ix.^2 + Iy.^2);

    %filter noises
    s_erosion = strel('disk', 15);

    Ie = imerode(I, s_erosion);
    Iobr = imreconstruct(Ie, I);

    Iobrd = imdilate(Iobr, s_erosion);
    Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
    Iobrcbr = imcomplement(Iobrcbr);

    fgm = imregionalmax(Iobrcbr);

    se2 = strel(ones(5,5));
    fgm2 = imclose(fgm, se2);
    fgm3 = imerode(fgm2, se2);

    fgm4 = bwareaopen(fgm3, 20);

    bw = im2bw(Iobrcbr,0.4);

    D = bwdist(bw);
    DL = watershed(D);
    bgm = DL == 0;

    gradmag2 = imimposemin(gradmag, bgm | fgm4);
    labeled_img = watershed(gradmag2);

end
