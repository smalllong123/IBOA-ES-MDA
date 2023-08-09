
function [fmin,best_pos,Convergence_curve,Convergence_curve_mean,Convergence_curve_point]=IBOA(par,ParRange,ModelName,obs)

% n is the population size
% N_iter represnets total number of iterations
n=par.N_butterfly;
N_iter=par.Max_iteration;
Lb=ParRange.lob;
Ub=ParRange.upb;
dim=par.dim;
p_max=par.p_max;                       % probabibility switch
p_min=par.p_min;
power_exponent=par.power_exponent;%a
sensory_modality=par.sensory_modality;%c

fobj=@(x)Func(x,ModelName,obs);


%Initialize the positions of search agents
Sol=initialization(n,dim,Ub,Lb);

for i=1:n,
    Fitness(i)=fobj(Sol(i,:));
    i
end

% Find the current best_pos
[fmin,I]=min(Fitness);
best_pos=Sol(I,:);
S=Sol; 
Convergence_curve_mean(1,1)=mean(Fitness);
Convergence_curve(1,1)=fmin;
Convergence_curve_point(1,:)=Fitness;

% Start the iterations -- Butterfly Optimization Algorithm 
for t=2:N_iter,
            
        for i=1:n, % Loop over all butterflies/solutions
         t
         i
          %Calculate fragrance of each butterfly which is correlated with objective function
          %Fnew=fobj(Sol(i,:));
          fmax=max(Fitness);
          p=p_min+(p_max-p_min)*((2-exp(t/N_iter*log(2)))/2+(Fitness(i)-fmin)/(fmax-fmin)/2);
          p
          FP=(sensory_modality*(Fitness(i)^power_exponent));   
    
          %Global or local search
          if rand<p,    
            dis = rand * rand * best_pos - Sol(i,:);        %Eq. (2) in paper
            S(i,:)=Sol(i,:)+dis*FP;
           else
              % Find random butterflies in the neighbourhood
              epsilon=rand;
              JK=randperm(n);
              dis=epsilon*epsilon*Sol(JK(1),:)-Sol(JK(2),:);
              S(i,:)=Sol(i,:)+dis*FP;                         %Eq. (3) in paper
          end
           
            % Check if the simple limits/bounds are OK
            S(i,:)=simplebounds(S(i,:),Lb,Ub);
          
            % Evaluate new solutions
            Fnew=fobj(S(i,:));  %Fnew represents new fitness values
            
            % If fitness improves (better solutions found), update then
            if (Fnew<=Fitness(i)),
                Sol(i,:)=S(i,:);
                Fitness(i)=Fnew;
            end
           
           % Update the current global best_pos
           if Fnew<=fmin,
                best_pos=S(i,:);
                fmin=Fnew;
           end
         end
        Convergence_curve_mean(t,1)=mean(Fitness);
         Convergence_curve(t,1)=fmin;
         Convergence_curve_point(t,:)=Fitness;
         t
         %Update sensory_modality
%           sensory_modality=sensory_modality_NEW(sensory_modality, N_iter);
end

% Boundary constraints
function x=simplebounds(x,lob,upb)
  % Apply the lower bound
    %lob=lob';upb=upb';
    flag=(x>lob).*(x<upb);
    x_o=x.*flag;
    flag=~((x>lob).*(x<upb));
    x_r=unifrnd(lob,upb).*flag;
    %x_r=lob.*(x<lob)+upb.*(x>upb);
    x=x_o+x_r;
end
  
   
% function y=sensory_modality_NEW(x,Ngen)
%     y=x+(0.025/(x*Ngen));
% end

function o = Func(x,ModelName,obs)
    evalstr = [ModelName,'(x);']; 
    y = eval(evalstr);
    o=sum((y-obs).^2);
end
end
