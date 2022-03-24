% A = input('');
% B = input('');
% A(A>B(1,2)) = 255;
% A(A<B(1,1)) = 0;
% A(B(1,1)<=A & A<=B(1,2)) = (A(B(1,1)<=A & A<=B(1,2))-B(1,1))/(B(1,2) - B(1,1))*255;
% disp(A);
% function  f = fib(num)
%   if num == 1
%       f = 1;
%   else 
%       f = fib(num - 1) + fib(num - 2)
%   end
% end
A = strcat('A','  ','B');
disp(A)