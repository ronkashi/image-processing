src_img = imread('foodiesfeed.com_colorful-tomatoes_low.jpg');

src_img = removeLightReflection(src_img);
gray_img = rgb2gray(src_img);

labeled_img = watershedfunc(gray_img);

figure
imshow(src_img)
title('Circled tomato image');
ellipseProps = drawEllipseAccordingToImage(labeled_img);

plotTomatosRadiusGraph(ellipseProps,src_img);
