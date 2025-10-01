figure_1=gcf
NM.featnames{1}= {'ROD','CHR','Tobaco','BMIgap score','Age','Female','Male','Excercise','Mindfullness','Somatic history'};
NM.analysis{1}.params.datadescriptor{1}.input_settings.featnames={'ROD','CHR','Tobaco','BMIgap score','Age','Female','Male','Excercise','Mindfullness','Somatic history'};
NM.analysis{1, 1}.GDdims{1, 1}.datadescriptor.input_settings.featnames  ={'ROD','CHR','Tobaco','BMIgap score','Age','Female','Male','Excercise','Mindfullness','Somatic history'};
NM.analysis{1, 1}.visdata{1, 1}.params.features ={'ROD','CHR','Tobaco','BMIgap score','Age','Female','Male','Excercise','Mindfullness','Somatic history'};
figure(gcf);

% Remove the box around the plot
box off;

% Set x and y limits
xlim([-150 250]); % Adjust x-axis limits

set(gca, 'FontSize', 20, 'FontWeight', 'normal', 'XColor', 'k', 'YColor', 'k','FontName','Times');

% Set labels
xlabel('Grand mean of CVR', 'FontSize', 24, 'FontWeight', 'bold', 'Color', 'k');
ylabel('');

% Customize ticks
set(gca, 'XTick', -150:50:250);
title('');% Remove title


saveas(gcf, 'featureimpt_bmigap.eps', 'epsc');
saveas(gcf, 'featureimpt_bmigap.png');


