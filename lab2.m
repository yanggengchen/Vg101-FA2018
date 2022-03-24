fid = fopen('input4.txt', 'r');
A = fscanf(fid,'A=[%d %d %d %d %d %d %d %d %d');
A = A';
Temp1 = A(4:6);
Temp2 = A(7:9);
A = [A(1:3);Temp1;Temp2];
fclose(fid);
fid = fopen('output.txt', 'w');
%logic start
Row = [-4 -7 -10];
for x = 1:3
    for y = 1:3
        if A(x,y)>=0
            ReMax(x,y) = A(x,y)*3 + 3 + Row(x);
        else
            ReMax(x,y) = Row(x) + 3;
        end
    end
end
Max = max(max(ReMax));
for x = 1:3
    for y = 1:3
        ReMax(x,y) = Max - ReMax(x,y) + 1;
    end
end
for x = 1:3
    for y = 1:3
        if A(x,y)<=0
            ReMin(x,y) = (-A(x,y))*3 + ReMax(x,y) + 3;
        else
            ReMin(x,y) = ReMax(x,y) + A(x,y)*3 + 3;
        end
    end
end
Min = max(max(ReMin));
Matrix(1:Min,1:35) = 0;
Matrix(1:Min,35) = 5;
Lin = [10,18,26;7,15,23;4,12,20];
for x = 1:3
    for y = 1:3
        if A(x,y)>0
            tem = ReMax(x,y) + 3*(A(x,y)-1);
            for z = 1:A(x,y)
%+
                Matrix(tem,[Lin(x,y),Lin(x,y)+8]) = 1;
                Matrix(tem+3,Lin(x,y)+8) = 1;
                Matrix([tem+3,tem+6],[Lin(x,y)-3,Lin(x,y)+5]) = 1;
%-
                Matrix(tem,(Lin(x,y)+1:Lin(x,y)+7)) = 2;
                Matrix([tem+3,tem+6],(Lin(x,y)-2:Lin(x,y)+4)) = 2;
%|
                Matrix([tem+4,tem+5],[Lin(x,y)-3,Lin(x,y)+5]) = 3;
                Matrix([tem+1,tem+2],Lin(x,y)+8) = 3;
%/
                Matrix(tem+1,[Lin(x,y)-1,Lin(x,y)+7]) = 4;
                Matrix(tem+2,[Lin(x,y)-2,Lin(x,y)+6]) = 4;
                Matrix(tem+4,Lin(x,y)+7) = 4;
                Matrix(tem+5,Lin(x,y)+6) = 4;
%''
                Matrix(tem+1,(Lin(x,y):Lin(x,y)+6)) = 0;
                Matrix(tem+2,[Lin(x,y)-1:Lin(x,y)+5,Lin(x,y)+7]) = 0;
                Matrix(tem+3,(Lin(x,y)+6:Lin(x,y)+7)) = 0;
                Matrix(tem+4,[Lin(x,y)-2:Lin(x,y)+4,Lin(x,y)+6]) = 0;
                Matrix(tem+5,(Lin(x,y)-2:Lin(x,y)+4)) = 0;
                tem = tem-3;
            end
        elseif A(x,y)<0
            tem = ReMin(x,y) - 6;
            for z = 1:-A(x,y)
%+
                Matrix(tem,[Lin(x,y),Lin(x,y)+8]) = 1;
                Matrix(tem+3,Lin(x,y)+8) = 1;
                Matrix([tem+3,tem+6],[Lin(x,y)-3,Lin(x,y)+5]) = 1;
%-
                Matrix(tem,(Lin(x,y)+1:Lin(x,y)+7)) = 2;
                Matrix([tem+3,tem+6],(Lin(x,y)-2:Lin(x,y)+4)) = 2;
%|
                Matrix([tem+4,tem+5],[Lin(x,y)-3,Lin(x,y)+5]) = 3;
                Matrix([tem+1,tem+2],Lin(x,y)+8) = 3;
%/
                Matrix(tem+1,[Lin(x,y)-1,Lin(x,y)+7]) = 4;
                Matrix(tem+2,[Lin(x,y)-2,Lin(x,y)+6]) = 4;
                Matrix(tem+4,Lin(x,y)+7) = 4;
                Matrix(tem+5,Lin(x,y)+6) = 4;
%''
                Matrix(tem+1,(Lin(x,y):Lin(x,y)+6)) = 0;
                Matrix(tem+2,[Lin(x,y)-1:Lin(x,y)+5,Lin(x,y)+7]) = 0;
                Matrix(tem+3,(Lin(x,y)+6:Lin(x,y)+7)) = 0;
                Matrix(tem+4,[Lin(x,y)-2:Lin(x,y)+4,Lin(x,y)+6]) = 0;
                Matrix(tem+5,(Lin(x,y)-2:Lin(x,y)+4)) = 0;
                tem = tem-3;
            end
        end
    end
end
for x = 1:Min
    for y = 1:35
        switch Matrix(x,y)
            case 0 
                fwrite(fid,' ','char');
            case 1
                fwrite(fid,'+','char');
            case 2
                fwrite(fid,'-','char');
            case 3
                fwrite(fid,'|','char');
            case 4
                fwrite(fid,'/','char');
            case 5
                fprintf(fid,'\r\n');
        end
    end
end
fclose(fid);