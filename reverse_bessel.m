clc;
clear;
close all;
i=1;% iterator for tfArray
n1=2;
n2=8;
for n=n1:n2 % generate the Bessel's filters of order 2 to 8
    odds=tf(1,[1,1]);% just init 
    evens=1;% same
    if mod(n,2) % if not even
        stop=(n+1)/2; 
        for k=2:stop %calculate product of k tfs
            ak(k)=2*cos(((k-1)/n)*pi); % cooficients
            bk(k)=1;
            H=tf(1,[bk(k),ak(k),1]);
            odds=odds*H;
        end 
        bode(odds);
        hold on
        tfArray(i)=odds;
        i=i+1;
    else % if even
        stop=n/2;
        for k=1:stop 
           ak(k)=2*cos((2*k-1)/(2*n)*pi);
           bk(k)=1;
           H=tf(1,[bk(k),ak(k),1]);
           evens=evens*H;
        end
        bode(evens);
        tfArray(i)=evens;
        i=i+1;
        
    end
end
figure(2);
stop=(n2-n1+1);
for i=1:stop % display poles of all orders on one plot
    pzmap(tfArray(i))
    hold on
end
legend('2','3','4','5','6','7','8')% hardcoded, being too lazy :{

    
    
 