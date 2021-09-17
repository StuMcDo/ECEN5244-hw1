
%%%steepest gradient method 
%%%Stuart McDonald 
%%%%4b



Xi = transpose(xi);
Yi = transpose(yi);
s = 0.5;
%remember to multiply by 2 

%%%find hessian matrix with symbolic matlab and gradient 

 %initialize a vector 


ffit = @(x,a1,a2,a3) a1.*exp(a2.*x).*cos(a3.*x) ;

a1 =0;
a2 = 0;
a3 = 0;

 
dfa1 = matlabFunction(Grad(1,1));
%sum(dfa1(a1,a2,a3,s,Xi,Yi))
dfa1a1 = matlabFunction(H(1,1));
%sum(dfa1a1(a2,a3,s,Xi))
dfa1a2 = matlabFunction(H(1,2));
%sum(dfa1a2(a1,a2,a3,s,Xi,Yi))
dfa1a3 = matlabFunction(H(1,3));
%sum(dfa1a3(a1,a2,a3,s,Xi,Yi))
 dfa2 = matlabFunction(Grad(2,1));
 %sum(dfa2(a1,a2,a3,s,Xi,Yi))
  dfa2a1 = matlabFunction(H(2,1));
  %sum(dfa2a1(a1,a2,a3,s,Xi,Yi))
dfa2a2 = matlabFunction(H(2,2));
%sum(dfa2a2(a1,a2,a3,s,Xi,Yi))
dfa2a3 = matlabFunction(H(2,3));
%sum(dfa2a3(a1,a2,a3,s,Xi,Yi))
dfa3 = matlabFunction(Grad(3,1));
%sum(dfa3(a1,a2,a3,s,Xi,Yi))

dfa3a1 = matlabFunction(H(3,1));
%sum(dfa3a1(a1,a2,a3,s,Xi,Yi))
 dfa3a2 = matlabFunction(H(3,2));
% sum(dfa3a2(a1,a2,a3,s,Xi,Yi))
 dfa3a3 = matlabFunction(H(3,3));
 %sum(dfa3a3(a1,a2,a3,s,Xi,Yi))

 a = [2;-0.001;2] %%%%Good starting point [2;-0.001;2]

  %%% plug in and find necessary gradient vector and hessian matrix knowing to
 % %%% sum across all values of xi apply algorithm 100 times
     for i = 1:100
         a1 = a(1,1);
         a2 = a(2,1);
         a3 = a(3,1);
         h = [sum(dfa1a1(a2,a3,s,Xi)) sum(dfa1a2(a1,a2,a3,s,Xi,Yi)) sum(dfa1a3(a1,a2,a3,s,Xi,Yi));...
             sum(dfa2a1(a1,a2,a3,s,Xi,Yi)) sum(dfa2a2(a1,a2,a3,s,Xi,Yi)) sum(dfa2a3(a1,a2,a3,s,Xi,Yi));...
            sum(dfa3a1(a1,a2,a3,s,Xi,Yi)) sum(dfa3a2(a1,a2,a3,s,Xi,Yi)) sum(dfa3a3(a1,a2,a3,s,Xi,Yi))]      
      inv(h)
        G = [sum(dfa1(a1,a2,a3,s,Xi,Yi));sum(dfa2(a1,a2,a3,s,Xi,Yi));sum(dfa3(a1,a2,a3,s,Xi,Yi))]
     a = a - inv(h)*G
        
     end
    a1 = a(1,1)
    a2 = a(2,1)
    a3 = a(3,1)
    plot(Xi,Yi,'o',Xi,ffit(Xi,a1,a2,a3))
    ylim([-4 4])
    
    kaiSquared = @(ydata,yfit) (ydata-yfit).^2./0.5^2
    ks = sum(kaiSquared(Yi,ffit(Xi,a1,a2,a3)))
% %   