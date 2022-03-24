function A = computeArea(fx) 
  fx = input('');
  S{3} = '0';
  S = regexp(fx, '+', 'split');
  for ele = S
      S{1};
  end    
  X3 = char(S{1});
  X2 = char(S{2});
  X1 = char(S{3});
  s1 = strfind(X3, 'x');
  s2 = strfind(X2, 'x');
  s3 = strfind(X1, 'x');
  x3 = 0;
  x2 = 0;
  x1 = 0;
%first
  if X3(s1 + 1) == '3'
      if X3(1) == 'x'
          x3 = 1;
      else
          x3 = str2num(X3(1:s1 - 1));
      end
  elseif X3(s1 + 1) == '2'
      if X3(1) == 'x'
          x2 = 1;
      else
          x2 = str2num(X3(1:s1 - 1));
      end
  else
      if X3(1) == 'x'
          x1 = 1;
      else
          x1 = str2num(X3(1:s1 - 1));
      end
  end
%second
  if isempty(X1) == 0
    if X2(s2 + 1) == '2'
        if X2(1) == 'x'
            x2 = 1;
        else
            x2 = str2num(X2(1:s2 - 1));
        end
    else
        if X2(1) == 'x'
            x1 = 1;
        else
            x1 = str2num(X2(1:s2 - 1));
        end
    end
  end
%third
  if isempty(X1) == 0
    if X1(1) == 'x'
            x1 = 1;
    else
            x1 = str2num(X1(1:s3 - 1));
    end
  end
  syms x;
  fx = (x3)*x^3 + (x2)*x^2 + (x1)*x;
  A = int(fx, 0, 1);
  disp(A)
end