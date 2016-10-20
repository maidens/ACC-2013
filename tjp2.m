function v = tjp2(t,xi)
%   xi = (x'_11,y'_11,x'_12,y'_12 , ... , x_11,y_11,x_12,y_12, ... )

global n



N=0;
% loop through clusters 
for i=1:4 
    if i~=1
        N = N+2*n(i-1);
    end            
    for j=1:n(i)
        iter1=0;
        iter2=0;
	damping=0;
	damping1=0;       % u(N+2*j-1) = -10*(iter1 - 0.1*damping1);
       % u(N+2*j)   = -10*(iter2 - 0.1*damping2);
	damping2=0;
        for k=1:n(i)
            if k ~= j               
               % iter1 gives 1st component of \del P
               % iter2 gives 2nd component of \del P
            squarenorm = (r(26+N+2*j-1)-r(26+N+2*k-1))^2 + (r(26+N+2*j)-r(26+N+2*k))^2 ;
            iter1 = iter1 + 2/squarenorm*(1-1/squarenorm)*(r(26+N+2*j-1)-r(26+N+2*k-1));
            iter2 = iter2 + 2/squarenorm*(1-1/squarenorm)*(r(26+N+2*j)-r(26+N+2*k)) ;
	    %damping = damping + (atan2(r(N+2*j),r(N+2*j-1))-atan2(r(N+2*k),r(N+2*k-1)))/squarenorm;
	    damping1 = damping1 + r(N+2*k-1)-r(N+2*j-1);
	    damping2 = damping2 + r(N+2*k)-r(N+2*j);
            end
        end
	x=cross([r(N+2*j-1) r(N+2*j) 0],[0 0 1]);

        % u(N+2*j-1) = -10*(iter1);
        % u(N+2*j)   = -10*(iter2);
      
       % u(N+2*j-1) = -10*(iter1 - 0.1*damping1);
       % u(N+2*j)   = -10*(iter2 - 0.1*damping2);

	if (j==1)
        % input for cluster leader agent
        u(N+2*j-1) = -10*(iter1 - 0.1*damping1) + (r(2*1-1) + r(2*(1+n(1))-1) + r(2*(1+n(1)+n(2))-1) + r(2*(1+n(1)+n(2)+n(3))-1)  - 4*r(N+2*j-1));
        u(N+2*j)   = -10*(iter2 - 0.1*damping2) + (r(2*1) + r(2*(1+n(1))) + r(2*(1+n(1)+n(2))) + r(2*(1+n(1)+n(2)+n(3)))  - 4*r(N+2*j));
    else
        % input for other agents in cluster 
	    u(N+2*j-1) = -10*(iter1 - 0.1*damping1);
        u(N+2*j)   = -10*(iter2 - 0.1*damping2);
	end
    end
end
for ind=1:26
    u(26+ind)=r(ind);
end
v=u';

