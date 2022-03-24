function mainfun()
  M = input('');
  row = M(1,1);
  times = M(1,3);
  for n = 1:row
      Matrix(n,:) = input('');
  end
%  InputMatrix = input('');
  for m = 1:times
      parameter = input('');
      switch parameter
          case 1
          Matrix = parameter1(Matrix);
          case 2
          Matrix = parameter2(Matrix);
          case 3
          Matrix = parameter3(Matrix);
          case 4
          Matrix = parameter4(Matrix);
          otherwise
          fprintf('default')
      end
  end
  disp(Matrix)
end

function [OutputMatrix] = parameter1(InputMatrix)
  A = input('');
  i = A(1,1);
  j = A(1,2);
  Temp = InputMatrix(:,i);
  InputMatrix(:,i) = InputMatrix(:,j);
  InputMatrix(:,j) = Temp;
  OutputMatrix = InputMatrix;
end

function [OutputMatrix] = parameter2(InputMatrix)
  A = input('');
  i = A(1,1);
  j = A(1,2);
  l = A(1,3);
  r = A(1,4);
  t = A(1,5);
  InputMatrix(i:j, l:r) = InputMatrix(i:j, l:r) + t;
  OutputMatrix = InputMatrix;
end

function [OutputMatrix] = parameter3(InputMatrix)
  A = input('');
  i = A(1,1);
  j = A(1,2);
  t = A(1,3);
  InputMatrix(i:i+t-1, j:j+t-1) = InputMatrix(i:i+t-1, j:j+t-1)';
  OutputMatrix = InputMatrix;
end

function [OutputMatrix] = parameter4(InputMatrix)
  A = input('');
  i = A(1,1);
  j = A(1,2);
  InputMatrix(j,:) = InputMatrix(j,:) + InputMatrix(i,:);
  OutputMatrix = InputMatrix;
end

