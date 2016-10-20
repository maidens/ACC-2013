clear all
close all

v=zeros(1,26);
r=10*(rand(1,26)-.5);
xinit=r(1:2:26);
yinit=r(2:2:26);
X=[xinit' yinit']
%plot(X(:,1),X(:,2),'black.')


idx=kmeans(X,4)
%plot(X(idx==1,1),X(idx==1,2),'r.',X(idx==2,1),X(idx==2,2),'b.',X(idx==3,1),X(idx==3,2),'g.',X(idx==4,1),X(idx==4,2),'y.');
  
%pause

for i=1:4
    thetaf(i) = 2*pi*rand(1);
end
for j=1:13
    theta(j) = 2*pi*rand(1);
end

for i=1:4
    count=0;
    for j=1:13
        if idx(j)==i
            count=count+1;
        end
    end
    n(i)=count;
end

global n

N=0;
for i=1:4
    if i~=1
        N=N+n(i-1);
    end
    count=1;
    j=1;
    while count<n(i)+1
        if idx(j)==i
            r(2*N+2*count-1)=X(j,1);
	    r(2*N+2*count)=X(j,2);
            count=count+1;
        end
        j=j+1;
    end
end     
r'
input=[v, r];
[T,Y] = ode23(@tjp,[0 10],input);
plot(T,Y);
sizeY=size(Y);

% get states for initial time 
% medtime=floor(sizeY(1)/7);
initstate=Y(1,:);
xinit=initstate(27:2:52);
yinit=initstate(28:2:52);

% get states for middle time 
medtime=floor(sizeY(1)/7);
medstate=Y(medtime,:);
xmed=medstate(27:2:52);
ymed=medstate(28:2:52);

% get states for final time 
finaltime=sizeY(1);
finalstate=Y(finaltime,:);
xfinal=finalstate(27:2:52);
yfinal=finalstate(28:2:52);

% theta
%plot(xinit(9:13),yinit(9:13),'y.',xinit(7:8),yinit(7:8),'g.',xinit(1:3),yinit(1:3),'b.',xinit(4:6),yinit(4:6),'r.');
%pause

%plot(X(:,1),X(:,2),'black.')
 % title('Initial Position')
 % axis([-5 5 -5 5])
  
  % pause
  %quiver(x,y,xa,ya,0.4,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',20,'LineWidth',3,'Color','k')

 % plot(X(idx==1,1),X(idx==1,2),'r.',X(idx==2,1),X(idx==2,2),'b.',X(idx==3,1),X(idx==3,2),'g.',X(idx==4,1),X(idx==4,2),'y.');
 % title('Clustering')
 % axis([-5 5 -5 5])
 
  figure 
  quiver(xinit(1:n(1)), yinit(1:n(1)), cos(theta(1:n(1))), sin(theta(1:n(1))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',20,'LineWidth',3,'Color','k')
  hold on 
  quiver(xinit(n(1)+1:n(1)+n(2)), yinit(n(1)+1:n(1)+n(2)), cos(theta(n(1)+1:n(1)+n(2))), sin(theta(n(1)+1:n(1)+n(2))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',20,'LineWidth',3,'Color','k')
  quiver(xinit(n(1)+n(2)+1:n(1)+n(2)+n(3)), yinit(n(1)+n(2)+1:n(1)+n(2)+n(3)), cos(theta(n(1)+n(2)+1:n(1)+n(2)+n(3))), sin(theta(n(1)+n(2)+1:n(1)+n(2)+n(3))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',20,'LineWidth',3,'Color','k')
  quiver(xinit(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)), yinit(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)), cos(theta(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4))), sin(theta(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',20,'LineWidth',3,'Color','k')
  % plot(xfinal(1:n(1)),yfinal(1:n(1)),'r.',xfinal(n(1)+1:n(1)+n(2)),yfinal(n(1)+1:n(1)+n(2)),'b.',xfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)),yfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)),'g.',xfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)),yfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)),'y.');
  title('Initial positions')
  axis([-7 7 -7 7])
 
  figure 
  quiver(xinit(1:n(1)), yinit(1:n(1)), cos(theta(1:n(1))), sin(theta(1:n(1))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',20,'LineWidth',3,'Color','k')
  hold on 
  quiver(xinit(n(1)+1:n(1)+n(2)), yinit(n(1)+1:n(1)+n(2)), cos(theta(n(1)+1:n(1)+n(2))), sin(theta(n(1)+1:n(1)+n(2))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',20,'LineWidth',3,'Color','k')
  quiver(xinit(n(1)+n(2)+1:n(1)+n(2)+n(3)), yinit(n(1)+n(2)+1:n(1)+n(2)+n(3)), cos(theta(n(1)+n(2)+1:n(1)+n(2)+n(3))), sin(theta(n(1)+n(2)+1:n(1)+n(2)+n(3))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',20,'LineWidth',3,'Color','k')
  quiver(xinit(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)), yinit(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)), cos(theta(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4))), sin(theta(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',20,'LineWidth',3,'Color','k')
  % plot(xfinal(1:n(1)),yfinal(1:n(1)),'r.',xfinal(n(1)+1:n(1)+n(2)),yfinal(n(1)+1:n(1)+n(2)),'b.',xfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)),yfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)),'g.',xfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)),yfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)),'y.');
  title('Initial clustering')
  axis([-7 7 -7 7])
 
  
  figure 
  quiver(xmed(1:n(1)), ymed(1:n(1)), cos(thetaf(1))*ones(size(xfinal(1:n(1)))), sin(thetaf(1))*ones(size(xfinal(1:n(1)))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',20,'LineWidth',3,'Color','k')
  hold on 
  quiver(xmed(n(1)+1:n(1)+n(2)), ymed(n(1)+1:n(1)+n(2)), cos(thetaf(1))*ones(size(xfinal(n(1)+1:n(1)+n(2)))), sin(thetaf(1))*ones(size(xfinal(n(1)+1:n(1)+n(2)))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',20,'LineWidth',3,'Color','k')
  quiver(xmed(n(1)+n(2)+1:n(1)+n(2)+n(3)), ymed(n(1)+n(2)+1:n(1)+n(2)+n(3)), cos(thetaf(1))*ones(size(xfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)))), sin(thetaf(1))*ones(size(xfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',20,'LineWidth',3,'Color','k')
  quiver(xmed(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)), ymed(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)), cos(thetaf(1))*ones(size(xfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)))), sin(thetaf(1))*ones(size(xfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',20,'LineWidth',3,'Color','k')
  % plot(xfinal(1:n(1)),yfinal(1:n(1)),'r.',xfinal(n(1)+1:n(1)+n(2)),yfinal(n(1)+1:n(1)+n(2)),'b.',xfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)),yfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)),'g.',xfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)),yfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)),'y.');
  title('Position at t=1')
  axis([-7 7 -7 7])
 
 
  % pause
  figure 
  quiver(xfinal(1:n(1)), yfinal(1:n(1)), cos(thetaf(1))*ones(size(xfinal(1:n(1)))), sin(thetaf(1))*ones(size(xfinal(1:n(1)))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',20,'LineWidth',3,'Color','k')
  hold on 
  quiver(xfinal(n(1)+1:n(1)+n(2)), yfinal(n(1)+1:n(1)+n(2)), cos(thetaf(1))*ones(size(xfinal(n(1)+1:n(1)+n(2)))), sin(thetaf(1))*ones(size(xfinal(n(1)+1:n(1)+n(2)))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',20,'LineWidth',3,'Color','k')
  quiver(xfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)), yfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)), cos(thetaf(1))*ones(size(xfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)))), sin(thetaf(1))*ones(size(xfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',20,'LineWidth',3,'Color','k')
  quiver(xfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)), yfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)), cos(thetaf(1))*ones(size(xfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)))), sin(thetaf(1))*ones(size(xfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)))),0.7,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',20,'LineWidth',3,'Color','k')
  % plot(xfinal(1:n(1)),yfinal(1:n(1)),'r.',xfinal(n(1)+1:n(1)+n(2)),yfinal(n(1)+1:n(1)+n(2)),'b.',xfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)),yfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)),'g.',xfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)),yfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)),'y.');
  title('Final Position')
  axis([-7 7 -7 7])
 % pause
  
%subplot(1,3,1);
 % plot(X(:,1),X(:,2),'black.')
  %title('Initial Position')
  %axis([-5 5 -5 5])
%subplot(1,3,2); 
 % plot(X(idx==1,1),X(idx==1,2),'r.',X(idx==2,1),X(idx==2,2),'b.',X(idx==3,1),X(idx==3,2),'g.',X(idx==4,1),X(idx==4,2),'y.');
  %title('Clustering')
  %axis([-5 5 -5 5])
%subplot(1,3,3); 
 % plot(xfinal(1:n(1)),yfinal(1:n(1)),'r.',xfinal(n(1)+1:n(1)+n(2)),yfinal(n(1)+1:n(1)+n(2)),'b.',xfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)),yfinal(n(1)+n(2)+1:n(1)+n(2)+n(3)),'g.',xfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)),yfinal(n(1)+n(2)+n(3)+1:n(1)+n(2)+n(3)+n(4)),'y.');
  %title('Final Position')
  %axis([-5 5 -5 5])
