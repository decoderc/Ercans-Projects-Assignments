clear;

data1=[1 2 5 5 2 11 1
4 2 6 9 4 11 1
1 1 7 0 4 17 1
2 0 2 24 1 24 0
2 0 7 0 3 9 1
3 2 5 7 1 21 0
4 0 7 1 4 1 1
1 0 1 13 1 21 0
3 0 4 0 3 2 1
2 0 2 20 2 20 0
1 0 1 3 2 3 1
2 0 2 23 4 23 0
1 0 1 8 3 8 1
2 1 4 21 2 21 0
2 0 2 20 2 20 0
2 0 2 30 3 33 1
2 0 2 18 3 18 0
2 2 5 0 4 6 1
2 2 5 3 3 3 1
1 1 3 0 4 5 1
2 2 5 17 4 21 0
2 0 2 10 3 23 0
2 0 2 26 1 26 0
2 0 2 26 2 26 0
1 2 5 0 4 18 1
2 1 4 17 3 17 0
2 0 4 9 2 33 0
2 0 2 17 2 17 1
2 0 4 42 3 42 0
2 0 4 5 4 16 1
1 1 3 0 4 1 1
2 0 2 15 4 17 1
2 2 5 0 4 9 1
2 2 5 0 3 4 1
2 0 2 1 4 2 0
2 0 2 1 1 5 0
2 2 5 6 2 6 0
1 0 1 1 0 1 0
1 0 1 1 2 1 0
1 0 1 3 3 3 0
1 0 1 1 3 1 0
1 0 1 1 1 1 0
2 0 4 1 0 1 0
1 0 1 1 4 1 0
2 0 2 2 4 2 0
2 0 2 1 1 1 0
2 0 2 1 1 1 0
1 0 1 0 3 12 0
1 2 5 4 3 6 0
2 0 2 1 2 1 0
2 0 2 3 4 3 0
3 0 4 4 4 10 0
3 1 5 6 4 6 1
2 0 2 0 2 1 0
4 1 6 0 3 2 0
2 0 2 1 2 1 0
2 0 2 1 3 1 0
2 0 2 4 4 5 0
1 2 5 1 4 1 0
1 0 1 1 2 1 0
1 0 1 7 4 7 0
2 0 2 2 2 2 0
2 1 2 1 2 1 0
2 2 5 4 4 11 0
1 0 1 3 4 10 0
1 0 1 1 4 1 0];

[a,b]=size(data1);
p=data1(1:a,1:b-1)';
t=data1(1:a,b)';
number=5;
pr=[min(p');max(p')]';
s=[number 3 1]; %two layer network
funct={'logsig','logsig','logsig'};
net=newff(pr,s,funct,'traingda','learngdm','mse');
net.trainParam.epochs=1000;
net.trainparam.goal=0.01;
net=train(net,p,t); %train the NN
y=round(sim(net,p));
disp('Error for trainging samples: By Neural Network');
error1=sum(abs(y-t))/66 % Neural Network Error for training data

n=1000
p1=round(NORMRND(1.833,0.789,1,n));
p2=round(NORMRND(0.581,0.808,1,n));
p3=round(NORMRND(3.35,1.78,1,n));
p4=round(NORMRND(10.05,9.023,1,n));
p5=round(NORMRND(2.75,1.157,1,n));
p6=round(NORMRND(14.125,9.878,1,n));
for i=1:n
if p1(i)>4
p1(i)=4;
end
if p1(i)<1
p1(i)=1;
end
if p2(i)>2
p2(i)=2;
end
if p2(i)<0
p2(i)=0;
end
if p3(i)>7
p3(i)=7;
end
if p3(i)<1
p3(i)=1;
end
if p5(i)>4
p5(i)=4;
end
if p5(i)<0
p5(i)=0;
end
if p6(i)<1
p6(i)=1;
end
if p4(i)>=p6(i)
p4(i)=p6(i);
end
if p4(i)<0
p4(i)=0;
end
end
%p1=ceil(4*rand(1,n)); %1-4
%p2=floor(3*rand(1,n)); %0-2
%p3=ceil(7*rand(1,n)); %1-7
%p5=floor(5*rand(1,n)); %0-4
%p6=ceil(33*rand(1,n)); %1-42
%p4=round(rand(1)*p6);
pp=[p1; p2; p3; p4; p5; p6];
tt=round(sim(net,pp));
disp('total nodule number is');
n
disp('the total lung nodule detection number is:');
nodule=sum(tt)
data2=[pp;tt]';
save data2.dat data2;
save data3.dat data2 -ASCII;
