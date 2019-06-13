function [globalPriotities, indexBest] = PrometheeII(criterias, weightCriterias)
    weightCriterias = weightCriterias(:);
    
    nSol = length(criterias(1,:));
    n = length(weightCriterias);
    
    priorities = zeros(nSol, nSol, n);
    
    for k=1:n,
        criteria = criterias(k,:);
        q = 0;
        p = max(criteria) - min(criteria);
        
        for i=1:nSol,
            for j=1:nSol,
                if(i ~= j),
                    if(criteria(j) - criteria(i) >= p),
                        priorities(i,j,k) = 1;
                    elseif(criteria(j) - criteria(i) > q),
                        priorities(i,j,k) = (criteria(j)-criteria(i)-q)/abs(p-q);
                    else,
                        priorities(i,j,k) = 0;
                    end;
                end;
            end;
        end; %makePriorityMatrix
        
        posFlux(k,:) = (sum(priorities(:,:,k),2))'/(nSol-1);
        negFlux(k,:) = sum(priorities(:,:,k),1)/(nSol-1);
    end;
    flux = posFlux - negFlux;
    
    globalPriotities = weightCriterias'*flux;
    indexBest = find(globalPriotities == max(globalPriotities));
    
end