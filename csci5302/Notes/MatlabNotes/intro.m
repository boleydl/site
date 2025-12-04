echo on
%% Basic Matrix Operations
% Welcome to MATLAB.  This is a demonstration of MATLAB's fourth generation
% language.
%
% Copyright 1984-2002 The MathWorks, Inc.
% $Revision: 5.27 $ $Date: 2002/03/28 16:44:30 $
% A few changes by Boley in 2009.
%

fprintf('\n\n=== We will pause several times through this demo.\n=== To go to next step, type the command "return" (followed by the return key).\n\n');
keyboard;

%%
% Before getting started, let's just show some of the power of MATLAB.  These
% commands produce a picture you may recognize.
%

surf(40*membrane(1,25)); 
shading interp; 
daspect([1 1 0.9])
camlight
axis off tight; 
title('MATLAB.  The Language of Technical Computing.');

keyboard;
%%
% First, let's create a simple vector with 9 elements called 'a'.
%

a = [1 2 3 4 6 4 3 4 5]

keyboard;
%%
% Now let's add 2 to each element of our vector, 'a', and store the result in a
% new vector.
% 
% Notice how MATLAB requires no special handling of vector or matrix math.
%

b = a + 2

keyboard;
%%
% Creating graphs in MATLAB is as easy as one command.  Let's plot the result of
% our vector addition with grid lines.
%

plot(b)
grid on

keyboard;
%%
% MATLAB can make other graph types as well, with axis labels.
%

bar(b)
xlabel('Sample #')
ylabel('Pounds')

keyboard;
%%
% MATLAB can use symbols in plots as well.  Here is an example using *'s to mark
% the points.  MATLAB offers a variety of other symbols and line types.
%

plot(b,'*')
axis([0 10 0 10])

keyboard;
%%
% Here's an example of a user-written function.  Each separate function must
% go into its own file whose name matches the name of the function.
% Here is the directory listing for this function in the file system:
%
!ls -l sample_function.m

%
% Note also that Matlab must be able to find this file.  If it is not in the
% current working directory:
pwd
% then you must tell Matlab where to look for it with the "addpath" command,
% or change current working directory with the "cd" command.
which intro

keyboard

%%
% Next we type out the source code for the function:
%

type sample_function

keyboard;
%%
% and try executing it:
%

y=sample_function(1)

keyboard;
%%
% Here's a code fragment to try to find points where this function changes sign
% in the range [-10,10];  The function name is put into a string so we could
% embed this code in another user-written function accepting "fcn" as an
% argument.  We could also use a function handle for this.
%
% We also plot the fcn.  Note the use of the ";" to suppress printing.
%

xrange=-10:.1:10;
npoints=length(xrange);
fcn = 'sample_function';
for i=1:npoints, yvalues(i)=feval(fcn,xrange(i)); end;
plot(xrange,yvalues);grid
% Next: Let's add marks for the points where the sign changes.
%

keyboard;
%%
% Lets add the points where the sign changes to the plot.
% Note how we try to vectorize computations when suitable.
%

sign_changes=find(sign(yvalues(1:npoints-1)) ~= sign(yvalues(2:npoints)));
sign_changes
xrange(sign_changes)
hold on
plot(xrange(sign_changes),yvalues(sign_changes),'o');
hold off


keyboard;
%%
% One area in which MATLAB excels is matrix computation.
% 
% Creating a matrix is as easy as making a vector, using semicolons (;) to
% separate the rows of a matrix.
%

A = [1 2 0; 2 5 -1; 4 10 -1]

keyboard;
%%
% We can easily find the transpose of the matrix 'A'.
%

B = A'

keyboard;
%%
% Now let's multiply these two matrices together.
% 
% Note again that MATLAB doesn't require you to deal with matrices as a
% collection of numbers.  MATLAB knows when you are dealing with matrices and
% adjusts your calculations accordingly.
%

C = A * B

keyboard;
%%
% Instead of doing a matrix multiply, we can multiply the corresponding elements
% of two matrices or vectors using the .* operator.
%

C = A .* B

keyboard;
%%
% Let's find the inverse of a matrix ...
%

X = inv(A)

keyboard;
%%
% ... and then illustrate the fact that a matrix times its inverse is the
% identity matrix.
%

I = inv(A) * A

keyboard;
%%
% MATLAB has functions for nearly every type of common matrix calculation.
% 
% There are functions to obtain eigenvalues ...
%

eig(A)

keyboard;
%%
% ... as well as the singular value decomposition.
%

svd(A)

keyboard;
%%
% The "poly" function generates a vector containing the coefficients of the
% characteristic polynomial.
% 
% The characteristic polynomial of a matrix A is
% 
% det(lambda*I - A)
%

p = round(poly(A))

keyboard;
%%
% We can easily find the roots of a polynomial using the "roots" function.
% 
% These are actually the eigenvalues of the original matrix.
% [In fact, to find the eigenvalues of a matrix, it is much better to avoid
%  this characteristic polynomial entirely.]
%

roots(p)

keyboard;
%%
% MATLAB has many applications beyond just matrix computation.
% 
% To convolve two vectors ...
%

q = conv(p,p)

keyboard;
%%
% ... or convolve again and plot the result.
%

r = conv(p,q)
plot(r);

keyboard;
%%
% At any time, we can get a listing of the variables we have stored in memory
% using the "who" or "whos" command.
%

whos

keyboard;
%%
% You can get the value of a particular variable by typing its name.
%

A

keyboard;
%%
% You can have more than one statement on a single line by separating each
% statement with commas or semicolons.  A semicolon also means to do the
% command quietly (don't print the result)
% 
% If you don't assign a variable to store the result of an operation, the result
% is stored in a temporary variable called "ans".
%

sqrt(-1), log(0)

keyboard;
%%
% In this case, since we separated the statements with commas, the result of
% each operation was echoed to the screen.  A semicolon would have made it quiet.
% 
% As you can see, MATLAB easily deals with complex and infinite numbers in
% calculations.
%

sqrt(-1), log(0)

keyboard;
%%
% MATLAB has functions which make it ideal as a signal processing tool.
% 
% For more details, see the demos of the Signal Processing Toolbox
%

A = zeros(32); 
A(14:16,14:16) = ones(3);
y = fft2(A);
mesh(abs(y));
title('Magnitude of Two-Dimensional FFT of a Matrix')

keyboard;
%%
% MATLAB also allows you to create and analyze functions easily.  For examples,
% see the demo "Functions of functions" under MATLAB Numerics.
%

cla
view(2)
hold on
fplot('humps',[0,2]), %% <- notice the way to pass "handle" of a function.
patch([0.5 0.5:0.01:1 1 0.5],[0 humps(0.5:0.01:1) 0 0],'r');
hold off
title('A region under an interesting function.')

keyboard;
%%
% Here's an example of a user-written function.  Each separate function must
% go into its own file whose name matches the name of the function.
% Here is the directory listing for this function in the file system:
%

!ls -l temporary_function.m

% First we type out the function:
%

type temporary_function

keyboard;
%%
% and try executing it:
%

[x1,x2]=temporary_function(A,2,3);

keyboard;
%%
% Thank you for viewing this introduction to MATLAB.
%

membrane(5,15,9,4)
axis([-1 1 -1 1 -1 .5])
colormap(hot)
