function  myim2bw(filename, threshold) 
myim = imread(filename);
Myimg = imbinarize(myim,threshold/255);
str1 = num2str(threshold);
str2 = strcat('bw_',str1,'_',filename);
imwrite(Myimg,str2)
end