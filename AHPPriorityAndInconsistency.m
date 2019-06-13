% AHP
function [Priority, IC, QC] = AHPPriorityAndInconsistency(criteriaTable)
ICA =[0 0 0.52 0.89 1.11 1.25 1.35 1.40 1.45 1.49];
s = sum(criteriaTable,1);
N = [];
n = size(criteriaTable,1);
for i = 1 : n;
    N(:, i) = criteriaTable(:, i)/s(i);
 end;
Priority = mean(N, 2);
lambda_max = s*Priority;
IC = (lambda_max - n)/(n -1);
QC = IC/ICA(n);

end