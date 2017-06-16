function  plotTomatosRadiusGraph(ellipseProps,image)
    
    %%params%%
    markerSize = 8;
    %%params%%
    
    figure
    hold on
    set(gca, 'XTick',1:4, 'XTickLabel',{'Red' 'Brown' 'Green' 'Yellow'})
    title('Tomato color v.s. Its radius')
    ylabel('Radius [pixel]')
    for ellipseNum = 1:size(ellipseProps,1)
        testPix = image(ellipseProps(ellipseNum,1),ellipseProps(ellipseNum,2),:);
        %Yelow
        if(testPix(1,1,1)>220 && testPix(1,1,2) > 150)
            plot (4, ellipseProps(ellipseNum,3),'o',...
                'MarkerSize',markerSize);
        %Red
        elseif( testPix(1,1,1)>220 && testPix(1,1,2) > 90)
            plot (1, ellipseProps(ellipseNum,3),'o',...
                'MarkerSize',markerSize);
        %Brown
        elseif(testPix(1,1,1)>190 && testPix(1,1,2) > 60)
            plot (2, ellipseProps(ellipseNum,3),'o',...
                'MarkerSize',markerSize);
        %Green
        else
            plot (3, ellipseProps(ellipseNum,3),'o',...
                'MarkerSize',markerSize);    
        end
    end
    
    hold off
end