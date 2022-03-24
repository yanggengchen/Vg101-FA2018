clear all;clc;
fid = fopen('prob1.txt','r');
non = fscanf(fid, '%s', 2);
date = fscanf(fid, '%s', 1);
 ii = 1;
 while ~isempty(date)  %length(name) > 0;
     Price(ii) = fscanf(fid, '%f', 1);
     date = fscanf(fid, '%s', 1);
     ii = ii + 1;
 end
 sum = 0;
 %for x = 1:ii
%      sum = sum + Price(x);
%  end
%  mean = sum/ii;
%  fang = 0;
%  for s = 1:ii
%      fang = fang + (Price(x) - mean)^2;
%  end
 mean = mean(Price);
 var = var(Price);
 high = max(max(Price));
 low = min(min(Price));
 disp(mean)
 disp(var)
 disp(high)
 disp(low)
 fclose(fid);