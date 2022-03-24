function main()
  a = input('');
  num = input('');
  num = str2num(num);
  switch a 
      case 10
          tentotwo(num);
      case 2
          twototen(num);
      otherwise
          fprintf('default');
  end
end

function [outputnum] = tentotwo(inputnum)
  digit = 0;
  n = 0;
  outputnum = 0;
  temp = inputnum;
  while temp >= 0
      temp = temp - 2^n;
      if temp >= 0
          temp = temp + 2^n;
          digit = digit + 1;
          n = n + 1;
      end
  end
  n = n - 1;
  for j = 1:digit
      inputnum = inputnum - 2^n;
      if inputnum >= 0
          outputnum = outputnum + 10^n;
      else
          inputnum = inputnum + 2^n;
      end
      n = n - 1;
  end
  outputnum = num2str(outputnum);
  sprintf(outputnum)
end

function [outputnum] = twototen(inputnum)
  digit = 0;
  n = 0;
  outputnum = 0;
  temp = inputnum;
  while temp >= 0
      temp = temp - 10^n;
      if temp >= 0
          temp = temp + 10^n;
          digit = digit + 1;
          n = n + 1;
      end
  end
  n = n - 1;
%  for j = 1:digit
%      if inputnum - 10^n >= 0
%          inputnum = inputnum - 10^n;
%          outputnum = outputnum + 2^n;
%      end
  for j = 1:digit
        inputnum = inputnum - 10^n;
        if inputnum >= 0
            outputnum = outputnum + 2^n;
        else
            inputnum = inputnum + 10^n;
        end
      n = n - 1;
  end
  outputnum = num2str(outputnum);
  sprintf(outputnum)
end