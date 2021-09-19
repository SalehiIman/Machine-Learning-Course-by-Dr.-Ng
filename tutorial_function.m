%%
% ---------------------------function : we needs to define it first as a functionname.m file like:
function y=functionname(x)
  y=f(x);
  
% add folder path
addpath('F:\Machine learning\octave files\functions');
% remove folder path
rmpath(...)
% now we can use our function
mysquare(2)
%%
%.......................... function with multiple output
%{
function [y1,y2]=functionname(x)
  y1=f(x);
  y2=f2(x);
%}
[a,b]=mysquareandqube(2)
%%
%------------------------------ function handle:
%{ 
* You can see if a variable, h, is a function handle using isa(h,'function_handle').
* A function handle is a MATLAB® data type that stores an association to a function. Indirectly calling a function
enables you to invoke the function regardless of where you call it from. 
%}
%______________________________Types of function _________________________
% 1- Local and Nested Functions in a File
% Program files can contain multiple functions. Local and nested functions are useful for:
% - dividing programs into smaller tasks
% - making it easier to read and maintain your code.

% Local functions are subroutines that are available within the same file. Local functions are 
%the most common way to break up programmatic tasks. In a function file, which contains only function definitions,
%local functions can appear in the file in any order after the main function in the file.
% In a script file, which contains commands and function definitions, local function must be at the end of the file. (Functions in scripts are supported in R2016b or later.)
%You can call the main function from the command line or another program file, although the local functions are only available to myfunction:
%2- Private Functions in a Subfolder
%3-Anonymous Functions Without a File
%* Anonymous functions allow you to define a function without creating a program file, as long as the function
%consists of a single statement. A common application of anonymous functions is to define a mathematical 
%expression, and then evaluate that expression over a range of values using a MATLAB® function function, i.e.,
%a function that accepts a function handle as an input.
%%
s = @(x) sin(1./x);
s(3)
q = integral(@(x) x.^2,0,1);    %use elementwise operator
%%
%* you can pass the function handle to a function that evaluates over a range of values, such as fplot:
range = [0.01,0.1];
fplot(s,range)
%%
%* variable in the expression
a = 1.3;
b = .2;
c = 30;
parabola = @(x) a*x.^2 + b*x + c;
%%
% you can save and load this anonymous function 
%save(or load) 'F:\Machine learning\matlab code\function\myfile.mat' parabola
%Multiple Anonymous Functions
%The expression in an anonymous function can include another anonymous function.
%This is useful for passing different parameters to a function that you are evaluating over a range of values. For example, you can solve the equation:
g = @(c) (integral(@(x) (x.^2 + c*x + 1),0,1));
%%
%Functions with No Inputs
t = @() datestr(now);
d = t()
%%
%Functions with Multiple Inputs or Outputs
myfunction = @(x,y) (x^2 + y^2 + x*y);
x = 1;
y = 10;
z = myfunction(x,y)
%%
c = 10;
mygrid = @(x,y) ndgrid((-x:x/c:x),(-y:y/c:y));
[x,y] = mygrid(pi,2*pi);
z = sin(x) + cos(y);
mesh(x,y,z)
%%
%Arrays of Anonymous Functions
f = {@(x)x.^2;
     @(y)y+10;
     @(x,y)x.^2+y+10};
x = 1;
y = 10;

f{1}(x)
f{2}(y)
f{3}(x,y)

%%%%%%%%%%%%%%% sophisticated example square error function
X=[1,1;1,2;1,3]
y=[1;2;3]
theta=[0;1];
mycostfunction(X,y,theta)

%################################3 to consider:
%%%%%%%% different format of function 
function A = warmUpExercise()
A = [];
A=eye(5);
end
%...
%%
% ___________________new : element-by-element binary operation
mu = mean(X);
X_norm = bsxfun(@minus, X, mu);

sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma); ____________
mu = mean(X);
X_norm = bsxfun(@minus, X, mu);

sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);
%_________
rr=ones(4);e=1:4;size(e)
bsxfun(@minus,rr,e)
bsxfun(@minus,rr,e')
%%
% week 7 code
% SVM Parameters
C = 1; sigma = 0.1;

% We set the tolerance and max_passes lower here so that the code will run faster. However, in practice, 
% you will want to run the training to convergence.
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
visualizeBoundary(X, y, model);






















