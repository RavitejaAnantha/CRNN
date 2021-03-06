function instanceData = getValidInds(instanceData, fileInstName)
% This is to ensure that every image contains the *crop, *maskcrop, and
% *depthcrop PNG images. 

deleteInds = [];
for instDataInd = 1:length(instanceData)
    startInd = max(strfind(instanceData(instDataInd).name,'_'));
    newName = [instanceData(instDataInd).name(1:startInd) 'maskcrop.png'];
    if ~exist([fileInstName '/' newName],'file')
        deleteInds = [deleteInds instDataInd];
    end
end

instanceData(deleteInds) = [];