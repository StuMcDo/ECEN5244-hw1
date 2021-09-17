%Stuart McDonald Problem 2 ECEN 5244

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Correlation and standard deviation from problem                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigma1 = 1
sigma2 = 2
sigma3 = 3
rho12 = 0.5
rho23 = -0.5'
rho13 = 0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Create covariance matrix                                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rxx = [sigma1^2 rho12*sigma1*sigma2 0;
    rho12*sigma1*sigma2 sigma2^2 rho23*sigma2*sigma3;
    0 rho23*sigma2*sigma3 sigma3^2]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Find Eigen vectors and values                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[E, Delta] = eig(Rxx)
%verify
E*Delta*transpose(E)
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            gaussian pseudorandom numbers sigma_n = 1 <x> = 0            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
K = 500


X = normrnd(0,1,3,500); % hardest part of the probelm figureing out what 
%rnd to use =( 




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Find Random vectors                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Delta.^0.5
X = E*(Delta.^(1/2))*X;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Scatter plot                                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% 
ax1 = nexttile;

details(ax1)

scatter(ax1,X(1,:),X(2,:))
xlabel('x1')
ylabel('x2')


% 
ax2 = nexttile;
scatter(ax2,X(2,:),X(3,:),'filled','d')
xlabel('x2')
ylabel('x3')
%plot3

ax3 = nexttile;
scatter(ax3,X(1,:),X(3,:))
xlabel('x1')
ylabel('x3')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Estimated covariance matrix               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Rxx_est =X*X'./(K-1)

%code ends here
