% Tomada de Decis�o

%  total de pontos usados
% distancia m�dia ponderado
% banda excedente
% total de clientes conectados

Criteria = load('Criteria2.csv');
[Priority, IC, QC] = AHPPriorityAndInconsistency(Criteria);
SolutionsAndCriteriaPriority = load('SolutionAndCriteriaPriority.csv')
[Priority, IndexBestSolution]  = AHPRatingModelPriority(SolutionsAndCriteriaPriority,Priority);

fprintf('A melhor solu��o � a %i�', IndexBestSolution); 