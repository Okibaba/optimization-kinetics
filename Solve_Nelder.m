% To use this optimization technique, just make sure the objective function
% is typed accurately in the function, f line, the run. Note that for the
% program to run, it needs the presence of the two functions Nelder and
% opt_Nelder to be in the workspace directory of the MATLAB 

% enter options settings for algorithm
options = optimset('LargeScale', 'off', 'TolX', 1e-15, 'TolFun', 1e-15, 'MaxFunEvals', 2000000, 'MaxIter', 200000, 'Display', 'final');

% enter initial values/guesses
%entering guesses based on heuristics
trial = [100 100 1220  2030 3030  333 3322 2321 1123 2233 22211 1222 122 122 3344];

[r c]= size(trial)
n=c;
p(1:n)=trial(1:n);

%implement optimization using various algorithms
[rateconst1,fos1] =opt_Nelder('myfun',trial,TolX,TolFun,MaxIter);
[rateconst2,fos2] = fminunc(@(k) myfun(k),trial, options);
[rateconst3,fos3] = fminsearch(@(k) myfun(k),trial, options);

%calculate values of objective functions
objfn1=feval('myfun',rateconst1)
objfn2=feval('myfun',rateconst2)
objfn3=feval('myfun',rateconst3)

% display rate constants calculated using various optimization routines
rateconst1'
rateconst2'
rateconst3'
 
