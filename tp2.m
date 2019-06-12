clc;
clear all;
close all;

pareto = load('pareto.mat');
clients = load('clientes.csv');

fobjPareto = pareto.fObjPareto;
PAPareto = pareto.PAPareto;


[totalPA, meanDist, unusedBand, connectedClients] = getCriterias(PAPareto, fobjPareto, clients)

% for i=1:length(fobjPareto(:,1)),
%     [PAC(:,i), dist(:,i)] = selectPACcalcDist(PAPareto(:,:,i), clients);
%     connectedClients(i) = length(PAC);
% end;

