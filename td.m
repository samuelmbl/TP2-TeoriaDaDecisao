% Tomada de Decisão

%  total de pontos usados
% distancia média ponderado
% banda excedente
% total de clientes conectados

Criteria = load('Criteria2.csv');
[Priority, IC, QC] = AHPPriorityAndInconsistency(Criteria);
SolutionsAndCriteriaPriority = load('SolutionAndCriteriaPriority.csv')
[Priority, IndexBestSolution]  = AHPRatingModelPriority(SolutionsAndCriteriaPriority,Priority);

fprintf('A melhor solução é a %iª', IndexBestSolution); 