
function I = removeLightReflection(I)    
   for i = 4:size(I,1)
       for j = 4:size(I,2)
           for k = 1:3
               I(i,j,k) = 16*sqrt(double(I(i,j,k)));
               if(I(i,j,1)+I(i,j,2)+I(i,j,3)>350)
                   I(i,j,k) = avg(imcrop(I,[i-3,j-3,6,6]));
               end
           end
       end
   end

end


