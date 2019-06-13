clc;
clear all;
close all;

pareto = load('pareto.mat');
clients = load('clientes.csv');

fobjPareto = pareto.fObjPareto;
PAPareto = pareto.PAPareto;


[totalPA, meanDist, unusedBand, connectedClients] = getCriterias(PAPareto, fobjPareto, clients)
