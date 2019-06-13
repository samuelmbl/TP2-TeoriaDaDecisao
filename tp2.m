clc;
clear all;
close all;

pareto = load('pareto.mat');
clients = load('clientes.csv');

fobjPareto = pareto.fObjPareto;
PAPareto = pareto.PAPareto;

[totalPA, meanDist, unusedBand, connectedClients] = getCriterias(PAPareto, fobjPareto, clients);

criterias = [totalPA; meanDist; unusedBand; connectedClients];
weightCriterias = [0.4 0.3 0.2 0.1];

[globalPriotities, indexBest] = PrometheeII(criterias, weightCriterias)
globalPriotitiesIdealized = globalPriotities/max(globalPriotities)