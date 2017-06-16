

function ellipseProps = drawEllipseAccordingToImage(labeled_img)
    %%params%%
    ellipseMinArea = 200;
    ellipseMaxArea = 28000;
    Proportion = 2.5;
    lineColor = 'r';
    lineWidth = 3;
    %%params%%

    s = regionprops(labeled_img,{...
    'Area'...
    'Centroid',...
    'MajorAxisLength',...
    'MinorAxisLength',...
    'Orientation'});


    t = linspace(0,2*pi,50);
    hold on
    numDetectedEllipse = 1;
    for k = 1:length(s)
        a = s(k).MajorAxisLength/2;
        b = s(k).MinorAxisLength/2;
        Xc = s(k).Centroid(1);
        Yc = s(k).Centroid(2);        
        if(ellipseMinArea < s(k).Area && ellipseMaxArea > s(k).Area && b*Proportion>a)
           
            ellipseProps(numDetectedEllipse,1) = floor(Yc);
            ellipseProps(numDetectedEllipse,2) = floor(Xc);
            ellipseProps(numDetectedEllipse,3) = floor((a+b)/2);
            
            numDetectedEllipse = numDetectedEllipse +1;
            
            phi = deg2rad(-s(k).Orientation);
            x = Xc + a*cos(t)*cos(phi) - b*sin(t)*sin(phi);
            y = Yc + a*cos(t)*sin(phi) + b*sin(t)*cos(phi);
            plot(x,y,lineColor,'Linewidth',lineWidth)
       end     
    end
    hold off
end