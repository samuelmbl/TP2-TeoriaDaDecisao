clc;
clear all;
close all;

pareto = load('pareto.mat');
clients = load('clientes.csv');

fobjPareto = pareto.fObjPareto;
PAPareto = pareto.PAPareto;

[totalPA, meanDist, unusedBand, disconnectedClients] = getCriterias(PAPareto, fobjPareto, clients);

criterias = [totalPA; meanDist; unusedBand; disconnectedClients];
% weightCriterias = [0.33 0.23 0.37 0.07];
% weightCriterias = [0.55 0.27 0.12 0.06];
weightCriterias = [0.2 0.6 0.2 0];
% weightCriterias = [0.2 0.2 0.6 0];

[globalPriotities, indexBest] = PrometheeII(criterias, weightCriterias)
globalPriotitiesIdealized = globalPriotities/max(globalPriotities)

CriteriaJudge = load('Criteria 1.csv');
[Priority, IC, QC] = AHPPriorityAndInconsistency(CriteriaJudge);
SolutionsAndCriteriaPriority = load('SolutionAndCriteriaPriority.csv');
[SolutionPriority, IndexBestSolution]  = AHPRatingModelPriority(SolutionsAndCriteriaPriority,Priority);

fprintf('A melhor solu��o para o Crit�rio 1 � a %i�\n', IndexBestSolution); 
fprintf('Prioridade');
SolutionPriority

CriteriaJudge = load('Criteria 2.csv');
[Priority, IC, QC] = AHPPriorityAndInconsistency(CriteriaJudge);
[SolutionPriority, IndexBestSolution]  = AHPRatingModelPriority(SolutionsAndCriteriaPriority,Priority);

fprintf('A melhor solu��o para o Crit�rio 1 � a %i�\n', IndexBestSolution); 
fprintf('Prioridade');
SolutionPriority