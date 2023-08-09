
InputSettings
figure('Color',[1 1 1]);
col = jet(N_iter + 1);
Ne=N_ensemble;
xreal=x_true;
range=[lob',upb'];

legend_str = {'Prior samples','Iteration 1','Iteration 2','Iteration 3'...
  ,'Iteration 4','Iteration 5','True values'};
y_str = {'\itx\rm_s','\ity\rm_s','\itSP\rm_1','\itSP\rm_2','\itSP\rm_3','\itK\rm_1','\itK\rm_2','\itK\rm_3','\itα\rm_L'};
Npar=9;
xall=x_ensembles';

for j = 1:Npar
    subplot(5,2,j,'FontWeight','bold','FontSize',12)
   for i = 1:N_iter+1
        plot(i*Ne-Ne+1:i*Ne,xall(j,i*Ne-Ne+1:i*Ne),'MarkerSize',15,...
            'Marker','.','Linestyle','None','color',col(i,:));hold on;
    end
    plot(size(xall,2),xreal(j),'bx','Markersize',12,'linewidth',3);hold off
    if j == Npar
        legend(legend_str);
    end
    axis([0 size(xall,2) range(j,1) range(j,2)])
    xlabel('Number of model evaluations','FontSize',28,'FontName','Times New Roman','FontWeight','bold');
    ylabel(y_str{j},'FontAngle','italic','FontSize',28,'FontName','Times New Roman','FontWeight','bold');

    set(gca,'FontName','Times New Roman','FontSize',22,'FontWeight','bold'); 
end
set(legend,...
    'Position',[0.652170141287043 0.0938628158844765 0.166406246623956 0.148930676976848],...
    'NumColumns',2,...
    'FontSize',32,...
    'FontName','Times New Roman');