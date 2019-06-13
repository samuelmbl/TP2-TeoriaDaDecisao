function [Priority, IndexBestSolution] = AHPRatingModelPriority(Solutions, Priority)
total = Solutions*Priority; % Soma ponderada dos valores de cada solu��o pelo prioridade dos crit�rios
s = sum(total,1);
N = [];
n = size(total,1);

Priority = total(:)/s;
IndexBestSolution = find(Priority == max(Priority))
end