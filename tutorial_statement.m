% Created by Octave 6.2.0, Thu Jul 01 08:54:39 2021 GMT <unknown@Iman>
%Broadcasting
x = [1 2 3;
     4 5 6;
     7 8 9];
y = [10 20 30];
x+y;
% Ending a command with a SEMICOLON tells Octave not to print the result of the command

%Block Comments 
%{
this way we can add a block of comment 
%}


%{
singleton:
That's a dimension that has a length of 1. For example, if you had a 3D image that
 is 400 rows by 1 column by 200 slices, the second dimension (columns) would be a
 singleton since it's one. You'd have only one image plane running in the y-z direction
 (rows-slices). You can get back to a 2D image by using 
 squeeze()
 to remove the singleton dimension.
%}

% https://octave.org/doc/v6.2.0/Broadcasting.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

data = [ 1, 2; 3, 4 ];
idx = (data <= 2);
data(idx)
%###############
 %Short-circuit Boolean Operators
 %{
expr1 && expr2
expr1 || expr2
expr1 && expr2 represents a logical AND operation that employs short-circuiting behavior. That is, expr2 is not evaluated if expr1 is logical 0 (false). Each expression must evaluate to a scalar logical result.
 %}
[1,2,0] || [2,3,4]   % it use all ()
[1,2,0] && [2,3,4]  
%{
Using the short-circuit OR operator with X and Y returns an error. The short-circuit operators operate only with scalar logical conditions.

Use the any and all functions to reduce each vector to a single logical condition.
any():any    True if any element of a vector is a nonzero number or is
    logical 1 (TRUE).  any ignores entries that are NaN (Not a Number).
any(matrix, dimention)
%}
% Element-by-element Boolean Operators
1 & eye(4)-1
~ (eye(4)-1)
xor ( 1,[1,0])
and ( 1,[1,0])
or ( 1,[1,0])
or ( 1,[1,0],[0,0,0]) % error
or ( 1,[1,0],[0,0])
pi
% formatted output
disp(sprintf('the number pi is: \n % 0.2f',pi))
disp(sprintf('this is \n my story %.5f, %.2f', pi,pi))
%#########################moving data around#########################
%matrix
%{
To get the data type, or class, of a variable, use the ???class??? function.
To determine if a variable has a specified data type, use the ???isa??? function.
For a list of functions that determine if variables have specific attributes, see ???is*???.
%}
w=1:2:10
length(w)
oness=ones(2,5)
zerosss=zeros(3,2)
(linspace(100,0,5))
(linspace(0,100,5))
hist(rand(1,100000)) % normal distributed in the interval of [0,1]
var(randn(1,10000000)) %guassian distribution, mean=0, var=1
%randi ([imin imax], ???)
e=randi([2 4],2,4)
s=randn(1,1000);
hist(s)
e=randi([2,5],4,7)
size(e)
size(e,1)
length(e) %return the maximum of size
%cd ('E:\....'), pwd, ls
ss=linspace(1,10,10);
reshape(ss,[2 5])
dd([1,4],:)
dd
dd=reshape(ss,[10 10]);
ss=linspace(1,100,100);
dd(1,:)=linspace(21,30,10)
dd=[dd;linspace(31,40,10)]
dd=[dd,linspace(31,40,11)']
b=[5,6,7;8,9,10];
a=[1,2;3,4];
c=[a b]
%########################computing#########################
A=[1,2,3;4,5,6];
B=[2,3;3,3;4,4];
A*B
A(:,[1 2]).*B([1 2],:)
%%%%
A .^2
-A
max(A) %columnwise
size(A(:))
[val,ind]=max(A(:))
[val,ind]=max(A)
A(2,2)=10
[val,ind]=max(A(:))
find(A>4) 
A>4 %elementwise comparison
%{
 To obtain a single index for each matrix element, Octave pretends that the columns 
of a matrix form one long vector (like Fortran arrays are stored). For example: 
%}
A=magic(3)
[r,c]=find(A>5)
find(A>5)
A(1,:)=A(1,:)+1
sum(A)
prod(A)
a=rand(3)
floor(a)
ceil(a)
a=rand(3);b=rand(3)
max(a,b)
sum(A,2)
sum(A,1)
max(A,[],2)
max(A,[],1)
%%%%diagonal sum
c=magic(3)
ss=c.*eye(length(c))
sum(sum(ss))
%%%%%%%%%%%%
flipud([1,2,3;4,5,6;7,8,9])
%______________________________________control statements: if, while, function____________
v=zeros(1,10)
v=v'
for i=1:10,
   v(i)=i+1;
end;
v
indices=1:10;for i=indices,
disp(i);
end;
%%%%%%%%%while
v=zeros(10,1);for i=1:10,v(i)=i^2;end;v
i=1; while i<=5, v(i)=100;i=i+1;end;v
%%%%%%%%%%    break
v=[1:10];
i=1;
while true,
     v(i)=100;
     i=i+1;
     if i>=6,
       break;
     end;
   end;
v
%%%%%%%%%%else, elseif
if v(1)==1,
     disp('the value is equal to 1');
   elseif v(1)==2,
     disp('the value is equal to 2');
   else
     disp('the value is not equal to 1 or 2');
   end;

%%%%%%%%%%%%%%%
s=zeros([3 5])
size(s,1)

%%%%%%%% scatter plot

%%%%%%%% plot:
%%plot(x, y, 'rx', 'MarkerSize', 10);

%%
%find
%_____________________________ Random__________________________
randperm(n,k)
randi(IMAX,M,N)
%_____________________________matrix___________________________
reshape(1:15,5,3)/10
%_____________________________construct a matrix_______________
eee=1 
ww=[1 eee]
%_____________________________formatted print__________________
ff=magic(4);[a,b]=size(ff);dd=ff(:);[c,d]=size(dd);fprintf('size a is [%d,%d] ; size a(:) is [%d,%d]',a,b,c,d)
%_____________________________matrix___________________________
A = 1:4;
B = repmat(A,4,1)
%_____________________________matrix, slicing__________________
% link : https://www.mathworks.com/company/newsletters/articles/matrix-indexing-in-matlab.html

%_____________________________matrix, mask_____________________
ss=randi([1 3],10,1),aa=(1:3)',aa(ss,:) % week 8 line 42
