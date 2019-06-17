function [totalPA, meanDist, unusedBand, connectedClients] = getCriterias(PA, fobj, clients)
    
    totalPA = fobj(:,1)';
    
    for i=1:length(fobj(:,1)),
        [PAC(:,i), dist(:,i)] = selectPACcalcDist(PA(:,:,i), clients);
        connectedClients(i) = length(PAC) - length(PAC(PAC(:,i) ~= 0,i));
        
        acessPoints = unique(PAC(:,i));
        acessPoints = acessPoints(2:end);
        
        meanDist(i) = 0;
        unusedBand(i) = 150*totalPA(i);
        for j = 1:length(acessPoints),
            clientsInAcessPoits = PAC(:,i) == acessPoints(j);
            numClients = length(PAC(clientsInAcessPoits,i));
            
            unusedBand(i) = unusedBand(i) - sum(clients(clientsInAcessPoits,3));
        end;
%         meanDist(i) = harmmean(dist(dist(:,i)~=0,i));
        meanDist(i) = mean(dist(dist(:,i)~=0,i));
    end;
    unusedBand = unusedBand./totalPA;


end