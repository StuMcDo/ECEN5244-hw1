%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%plot(x,y,'o')

%x=linspace(0,pi,101)';
a=[1,0.1]';
sigma=0.5;
y_fit = @(x) a1.*exp(a2.*x).*cos(a3.*x); %Change to anon function

%y=A*a+sigma*randn(size(x));
%SA cooling schedule
t=[1:1e6];
T=1./log(t+1);
%SA solution space constrain points need 3 for modeling function
aj1=linspace(2.9,3.1,2001);
aj2=linspace(-0.35,-0.25,2001);
aj3=linspace(1.9,2.1,2001);

%Randomly initialize fit values
ij_fit=floor(rand(3,1)*2001)+1;
a_fit=[aj1(ij_fit(1));aj2(ij_fit(2));aj3(ij_fit(3))];


%y_fit=A*a_fit;
a1 =a_fit(1,1)
a2 =a_fit(2,1)
a3 =a_fit(3,1)
chi2=sum((y_fit(x)-y).^2)./(sigma^2);
%Anneal over cooling schedule
for jj=t
    %Randomly select neighbor
    ij_fit_jp1=ij_fit+sign(2*rand(3,1)-1);
    if (ij_fit_jp1(1) >= 1) && (ij_fit_jp1(1) <= 2001)&& (ij_fit_jp1(2) >= 1) && (ij_fit_jp1(2) <= 2001) && (ij_fit_jp1(3) >= 1) && (ij_fit_jp1(3) <= 2001)
    a_fit_jp1=[aj1(ij_fit_jp1(1));
        aj2(ij_fit_jp1(2));
         aj3(ij_fit_jp1(3))];
     a1 = a_fit_jp1(1,1);
     a2 = a_fit_jp1(2,1);
     a3 = a_fit_jp1(1,1);
    y_fit_jp1=y_fit(x);
    chi2_jp1=sum((y_fit_jp1-y).^2)/(sigma^2);
    if rand<exp(-max([0,chi2_jp1-chi2])/T(jj))
        ij_fit=ij_fit_jp1;
        a_fit=a_fit_jp1;
        y_final=y_fit_jp1;
        chi2=chi2_jp1;
    end
    end
end

plot(x,y,'o',x,y_final)
title('Simulated annealing')