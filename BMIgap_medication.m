path_to_extraction='/volume/projects/AK_BMI/Analysis/Extraction'
load(fullfile(path_to_extraction,'PRONIA_ROP_weight_change.mat'))
load(fullfile(path_to_extraction,'PRONIA_ROD_weight_change.mat'))
load(fullfile(path_to_extraction,'PRONIA_CHR_weight_change.mat'))
load(fullfile(path_to_extraction,'PRONIA_HC_weight_change.mat'))

%%PSN list extraction for Nikos
med_T2=Tables(:,contains(Tables.Properties.VariableNames,{'PSN','ALL_QUEST_Examination_Date_T2'}));

PRONIA_CHR_medic_T1=med_T1(ismember(med_T1.PSN,PRONIA_CHR_T0_T1_all.PSN),:);
PRONIA_ROD_medic_T1=med_T1(ismember(med_T1.PSN,PRONIA_ROD_T0_T1_all.PSN),:);
PRONIA_ROP_medic_T1=med_T1(ismember(med_T1.PSN,PRONIA_ROP_T0_T1_all.PSN),:);
PRONIA_CHR_medic_T2=med_T2(ismember(med_T2.PSN,PRONIA_CHR_T0_T2_all.PSN),:);
PRONIA_ROD_medic_T2=med_T2(ismember(med_T2.PSN,PRONIA_ROD_T0_T2_all.PSN),:);
PRONIA_ROP_medic_T2=med_T2(ismember(med_T2.PSN,PRONIA_ROP_T0_T2_all.PSN),:);
PRONIA_PAT_all_T1=[PRONIA_CHR_medic_T1;PRONIA_ROD_medic_T1;PRONIA_ROP_medic_T1]
PSN_T1=PRONIA_PAT_all_T1(:,{'PSN'});
PRONIA_PAT_all_T2=[PRONIA_CHR_medic_T2;PRONIA_ROD_medic_T2;PRONIA_ROP_medic_T2]
PSN_T2=PRONIA_PAT_all_T2(:,{'PSN'});
unique_T2=PSN_T2(~ismember(PSN_T2.PSN,PSN_T1.PSN),:)
PSN_all=[PSN_T1;unique_T2]
med_T1=Tables(:,contains(Tables.Properties.VariableNames,{'PSN','ALL_QUEST_Examination_Date_T1','ALL_QUEST_Examination_Date_T2'}));
PRONIA_list_med=join(PSN_all,med_T1,"Keys","PSN")
save('PRONIA_list_NK','PRONIA_list_med')
writetable(PRONIA_list_med, fullfile(path_to_extraction, '/PRONIA_list_NK.xlsx'))
%%medication T1 & T2
%CHR
med_T1=Tables(:,contains(Tables.Properties.VariableNames,{'PSN','TREAT_MED_Clozapin_','TREAT_MED_Olanzapin_','TREAT_MED_SSRI_','TREAT_MED_Benzo_'}));
med_T1=med_T1(:,contains(med_T1.Properties.VariableNames,{'PSN','T1'}));
PRONIA_CHR_medic_T1=med_T1(ismember(med_T1.PSN,PRONIA_CHR_T0_T1_all.PSN),:);
PRONIA_CHR_medic_T1=innerjoin(PRONIA_CHR_T0_T1_all,PRONIA_CHR_medic_T1,"Keys","PSN");

med_T2=Tables(:,contains(Tables.Properties.VariableNames,{'PSN','TREAT_MED_Clozapin_','TREAT_MED_Olanzapin_','TREAT_MED_SSRI_','TREAT_MED_Benzo_'}));
med_T2=med_T2(:,contains(med_T2.Properties.VariableNames,{'PSN','T2'}));

PRONIA_CHR_medic_T2=med_T2(ismember(med_T2.PSN,PRONIA_CHR_T0_T2_all.PSN),:);
PRONIA_CHR_medic_T2=innerjoin(PRONIA_CHR_T0_T2_all,PRONIA_CHR_medic_T2,"Keys","PSN");

columnNames = {
    'TREAT_MED_Clozapin_01_Equivalent_T1',
    'TREAT_MED_Clozapin_02_Equivalent_T1',
    'TREAT_MED_Clozapin_03_Equivalent_T1',
    'TREAT_MED_Clozapin_04_Equivalent_T1',
    'TREAT_MED_Clozapin_05_Equivalent_T1',
    'TREAT_MED_Clozapin_06_Equivalent_T1',
    'TREAT_MED_Clozapin_07_Equivalent_T1',
    'TREAT_MED_Clozapin_08_Equivalent_T1',
    'TREAT_MED_Clozapin_09_Equivalent_T1',
    'TREAT_MED_Clozapin_10_Equivalent_T1',
    'TREAT_MED_Olanzapin_01_Equivalent_T1',
    'TREAT_MED_Olanzapin_02_Equivalent_T1',
    'TREAT_MED_Olanzapin_03_Equivalent_T1',
    'TREAT_MED_Olanzapin_04_Equivalent_T1',
    'TREAT_MED_Olanzapin_05_Equivalent_T1',
    'TREAT_MED_Olanzapin_06_Equivalent_T1',
    'TREAT_MED_Olanzapin_07_Equivalent_T1',
    'TREAT_MED_Olanzapin_08_Equivalent_T1',
    'TREAT_MED_Olanzapin_09_Equivalent_T1',
    'TREAT_MED_Olanzapin_10_Equivalent_T1',
    'TREAT_MED_SSRI_01_Equivalent_T1',
    'TREAT_MED_SSRI_02_Equivalent_T1',
    'TREAT_MED_SSRI_03_Equivalent_T1',
    'TREAT_MED_SSRI_04_Equivalent_T1',
    'TREAT_MED_SSRI_05_Equivalent_T1',
    'TREAT_MED_SSRI_06_Equivalent_T1',
    'TREAT_MED_SSRI_07_Equivalent_T1',
    'TREAT_MED_SSRI_08_Equivalent_T1',
    'TREAT_MED_SSRI_09_Equivalent_T1',
    'TREAT_MED_SSRI_10_Equivalent_T1',
    'TREAT_MED_Benzo_01_Equivalent_T1',
    'TREAT_MED_Benzo_02_Equivalent_T1',
    'TREAT_MED_Benzo_03_Equivalent_T1',
    'TREAT_MED_Benzo_04_Equivalent_T1',
    'TREAT_MED_Benzo_05_Equivalent_T1',
    'TREAT_MED_Benzo_06_Equivalent_T1',
    'TREAT_MED_Benzo_07_Equivalent_T1',
    'TREAT_MED_Benzo_08_Equivalent_T1',
    'TREAT_MED_Benzo_09_Equivalent_T1',
    'TREAT_MED_Benzo_10_Equivalent_T1'
};

% Initialize an array to store non-empty and non-NaN BMIgap values
meanBMIgaps = zeros(1, length(columnNames));
resultCell = cell(1, length(columnNames));
validCounts = zeros(1, length(columnNames));

% Loop through each column name
for i = 1:length(columnNames)
    colName = columnNames{i};
    
    % Check if the column exists in the data
    if ismember(colName, PRONIA_CHR_medic_T1.Properties.VariableNames)
        % Get the values from the column
        colValues = PRONIA_CHR_medic_T1.(colName);
        bmiGapValues = PRONIA_CHR_medic_T1.BMIgap_CHR_corrcted; % Get the values from the BMIgap column
        
        % Filter out NaN, empty, and zero values
        validIndices = ~isnan(colValues) & ~isempty(colValues) & colValues ~= 0;
        sum(validIndices)
        sum(~validIndices)

        % Add valid BMIgaps to the array
        meanBMIgaps(i) = mean(bmiGapValues(validIndices));
        validCounts(i) = sum(validIndices);

        resultCell{1, i} = meanBMIgaps(i);


    end
end
resultTable = cell2table(resultCell, 'VariableNames', columnNames);
bmiGapValues = PRONIA_CHR_medic_T1.BMIgap_CHR_corrcted; % Get the values from the BMIgap column

% Calculate the mean of valid BMIgaps


clozapinColumns = PRONIA_CHR_medic_T1(:, contains(PRONIA_CHR_medic_T1.Properties.VariableNames, 'Clozapin'));

sumResults = zeros(size(clozapinColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(clozapinColumns, 1)
    if all(isnan(clozapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(clozapinColumns{i, :});
    end
end
PRONIA_CHR_medic_T1.clozapinsum=sumResults;

OlanzapinColumns = PRONIA_CHR_medic_T1(:, contains(PRONIA_CHR_medic_T1.Properties.VariableNames, 'Olanzapin'));
OlanzapinColumns = OlanzapinColumns(:,contains(OlanzapinColumns.Properties.VariableNames, 'T1'));

sumResults = zeros(size(OlanzapinColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(OlanzapinColumns, 1)
    if all(isnan(OlanzapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(OlanzapinColumns{i, :});
    end
end
PRONIA_CHR_medic_T1.Olanzapin=sumResults;

SSRIColumns = PRONIA_CHR_medic_T1(:, contains(PRONIA_CHR_medic_T1.Properties.VariableNames, 'SSRI'));
SSRIColumns = SSRIColumns(:,contains(SSRIColumns.Properties.VariableNames, 'T1'));

sumResults = zeros(size(SSRIColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(SSRIColumns, 1)
    if all(isnan(SSRIColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(SSRIColumns{i, :});
    end
end
PRONIA_CHR_medic_T1.SSRI=sumResults;

BenzoColumns = PRONIA_CHR_medic_T1(:, contains(PRONIA_CHR_medic_T1.Properties.VariableNames, 'Benzo'));
BenzoColumns = BenzoColumns(:,contains(BenzoColumns.Properties.VariableNames, 'T1'));

sumResults = zeros(size(BenzoColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(BenzoColumns, 1)
    if all(isnan(BenzoColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(BenzoColumns{i, :});
    end
end
PRONIA_CHR_medic_T1.Benzo=sumResults;

%
[h,p]=ttest2(PRONIA_CHR_medic_T1.BMI_T0,PRONIA_CHR_medic_T1.BMI_T1)
[h,p]=ttest2(PRONIA_CHR_medic_T1.SOMAT_02_Weight_corr_Screening,PRONIA_CHR_medic_T1.SOMAT_02_Weight_corr_T1)
[h,p]=ttest2(PRONIA_CHR_medic_T1.BMI_T0,PRONIA_CHR_medic_T1.BMI_T2)
[h,p]=ttest2(PRONIA_CHR_medic_T1.SOMAT_02_Weight_corr_Screening,PRONIA_CHR_medic_T1.SOMAT_02_Weight_corr_T2)

%medication and BMIgap
noMedicationIndices = all(isnan(PRONIA_CHR_medic_T1{:, columnNames}) | PRONIA_CHR_medic_T1{:, columnNames} == 0 | isempty(PRONIA_CHR_medic_T1{:, columnNames}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_CHR_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_CHR_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_CHR_medic_T1.BMIdelta_T1(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_CHR_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_CHR_medic_exist=PRONIA_CHR_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.weightdelta_T1) 

%%Clozapin
% Get the list of all column names
columnNames = PRONIA_CHR_medic_exist.Properties.VariableNames;

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Clozapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_CHR_medic_T1{:, medColumns}) | PRONIA_CHR_medic_T1{:, medColumns} == 0 | isempty(PRONIA_CHR_medic_T1{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_CHR_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_CHR_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_CHR_medic_T1.BMIdelta_T1(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_CHR_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)


PRONIA_CHR_medic_exist=PRONIA_CHR_medic_T1(~noMedicationIndices,:);

[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.weightdelta_T1) 


%%Olanzapin
% Get the list of all column names
columnNames = PRONIA_CHR_medic_exist.Properties.VariableNames;

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Olanzapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_CHR_medic_T1{:, medColumns}) | PRONIA_CHR_medic_T1{:, medColumns} == 0 | isempty(PRONIA_CHR_medic_T1{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_CHR_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_CHR_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_CHR_medic_T1.BMIdelta_T1(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_CHR_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_CHR_medic_exist=PRONIA_CHR_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.weightdelta_T1) 



%%SSRI

% Find the columns that contain 'SSRI'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'SSRI'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_CHR_medic_T1{:, medColumns}) | PRONIA_CHR_medic_T1{:, medColumns} == 0 | isempty(PRONIA_CHR_medic_T1{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_CHR_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_CHR_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)


BMIdeltaNoMedication = PRONIA_CHR_medic_T1.BMIdelta_T1(noMedicationIndices); %no difference between medication and no medication
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_CHR_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_CHR_medic_exist=PRONIA_CHR_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.weightdelta_T1) 



% %%benzo
% clear medColumns noMedicationIndices bmiGapNoMedication
% medColumns = contains(columnNames, {'Benzo'});
% 
% 
% % Select only those columns
% noMedicationIndices = all(isnan(PRONIA_CHR_medic_T1{:, medColumns}) | PRONIA_CHR_medic_T1{:, medColumns} == 0 | isempty(PRONIA_CHR_medic_T1{:, medColumns}), 2);
% bmiGapNoMedication = bmiGapValues(noMedicationIndices);
% meanbmigapnomedication=mean(bmiGapNoMedication)
% bmiGapMedication = bmiGapValues(~noMedicationIndices);
% meanbmigapmedication=mean(bmiGapMedication)
% [h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_CHR_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_CHR_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_CHR_medic_T1.BMIdelta_T1(noMedicationIndices); %no difference between medication and no medication
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_CHR_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_CHR_medic_exist=PRONIA_CHR_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.weightdelta_T1) 


%%% T2
columnNames = {
    'TREAT_MED_Clozapin_01_Equivalent_T2',
    'TREAT_MED_Clozapin_02_Equivalent_T2',
    'TREAT_MED_Clozapin_03_Equivalent_T2',
    'TREAT_MED_Clozapin_04_Equivalent_T2',
    'TREAT_MED_Clozapin_05_Equivalent_T2',
    'TREAT_MED_Clozapin_06_Equivalent_T2',
    'TREAT_MED_Clozapin_07_Equivalent_T2',
    'TREAT_MED_Clozapin_08_Equivalent_T2',
    'TREAT_MED_Clozapin_09_Equivalent_T2',
    'TREAT_MED_Olanzapin_01_Equivalent_T2',
    'TREAT_MED_Olanzapin_02_Equivalent_T2',
    'TREAT_MED_Olanzapin_03_Equivalent_T2',
    'TREAT_MED_Olanzapin_04_Equivalent_T2',
    'TREAT_MED_Olanzapin_05_Equivalent_T2',
    'TREAT_MED_Olanzapin_06_Equivalent_T2',
    'TREAT_MED_Olanzapin_07_Equivalent_T2',
    'TREAT_MED_Olanzapin_08_Equivalent_T2',
    'TREAT_MED_Olanzapin_09_Equivalent_T2',
    'TREAT_MED_SSRI_01_Equivalent_T2',
    'TREAT_MED_SSRI_02_Equivalent_T2',
    'TREAT_MED_SSRI_03_Equivalent_T2',
    'TREAT_MED_SSRI_04_Equivalent_T2',
    'TREAT_MED_SSRI_05_Equivalent_T2',
    'TREAT_MED_SSRI_06_Equivalent_T2',
    'TREAT_MED_SSRI_07_Equivalent_T2',
    'TREAT_MED_SSRI_08_Equivalent_T2',
    'TREAT_MED_SSRI_09_Equivalent_T2',
    'TREAT_MED_Benzo_01_Equivalent_T2',
    'TREAT_MED_Benzo_02_Equivalent_T2',
    'TREAT_MED_Benzo_03_Equivalent_T2',
    'TREAT_MED_Benzo_04_Equivalent_T2',
    'TREAT_MED_Benzo_05_Equivalent_T2',
    'TREAT_MED_Benzo_06_Equivalent_T2',
    'TREAT_MED_Benzo_07_Equivalent_T2',
    'TREAT_MED_Benzo_08_Equivalent_T2',
    'TREAT_MED_Benzo_09_Equivalent_T2'
};
% Initialize an array to store non-empty and non-NaN BMIgap values
meanBMIgaps = zeros(1, length(columnNames));
resultCell = cell(1, length(columnNames));
validCounts = zeros(1, length(columnNames));

% Loop through each column name
for i = 1:length(columnNames)
    colName = columnNames{i};
    
    % Check if the column exists in the data
    if ismember(colName, PRONIA_CHR_medic_T2.Properties.VariableNames)
        % Get the values from the column
        colValues = PRONIA_CHR_medic_T2.(colName);
        bmiGapValues = PRONIA_CHR_medic_T2.BMIgap_CHR_corrcted; % Get the values from the BMIgap column
        
        % Filter out NaN, empty, and zero values
        validIndices = ~isnan(colValues) & ~isempty(colValues) & colValues ~= 0;
        sum(validIndices)
        sum(~validIndices)

        % Add valid BMIgaps to the array
        meanBMIgaps(i) = mean(bmiGapValues(validIndices));
        validCounts(i) = sum(validIndices);

        resultCell{1, i} = meanBMIgaps(i);


    end
end
resultTable = cell2table(resultCell, 'VariableNames', columnNames);
bmiGapValues = PRONIA_CHR_medic_T2.BMIgap_CHR_corrcted; % Get the values from the BMIgap column

% Calculate the mean of valid BMIgaps


clozapinColumns = PRONIA_CHR_medic_T2(:, contains(PRONIA_CHR_medic_T2.Properties.VariableNames, 'Clozapin'));
sumResults = zeros(size(clozapinColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(clozapinColumns, 1)
    if all(isnan(clozapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(clozapinColumns{i, :});
    end
end
PRONIA_CHR_medic_T2.clozapinsum=sumResults;

OlanzapinColumns = PRONIA_CHR_medic_T2(:, contains(PRONIA_CHR_medic_T2.Properties.VariableNames, 'Olanzapin'));
sumResults = zeros(size(OlanzapinColumns, 1), 1); % Preallocate a vector to store the results
for i = 1:size(OlanzapinColumns, 1)
    if all(isnan(OlanzapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(OlanzapinColumns{i, :});
    end
end
PRONIA_CHR_medic_T2.Olanzapin=sumResults;

SSRIColumns = PRONIA_CHR_medic_T2(:, contains(PRONIA_CHR_medic_T2.Properties.VariableNames, 'SSRI'));
sumResults = zeros(size(SSRIColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(SSRIColumns, 1)
    if all(isnan(SSRIColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(SSRIColumns{i, :});
    end
end
PRONIA_CHR_medic_T2.SSRI=sumResults;

BenzoColumns = PRONIA_CHR_medic_T2(:, contains(PRONIA_CHR_medic_T2.Properties.VariableNames, 'Benzo'));
sumResults = zeros(size(BenzoColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(BenzoColumns, 1)
    if all(isnan(BenzoColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(BenzoColumns{i, :});
    end
end
PRONIA_CHR_medic_T2.Benzo=sumResults;


%medication and BMIgap
bmiGapValues = PRONIA_CHR_medic_T2.BMIgap_CHR_corrcted; % Get the values from the BMIgap column
clear noMedicationIndices
noMedicationIndices = all(isnan(PRONIA_CHR_medic_T2{:, columnNames}) | PRONIA_CHR_medic_T2{:, columnNames} == 0 | isempty(PRONIA_CHR_medic_T2{:, columnNames}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
%%weight change %%not significant
weightdeltaNoMedication = PRONIA_CHR_medic_T2.weightdelta_T2(noMedicationIndices);%weight change is not significant
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_CHR_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_CHR_medic_T2.BMIdelta_T2(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_CHR_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_CHR_medic_exist=PRONIA_CHR_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.weightdelta_T2) 

%%Clozapin
% Get the list of all column names
columnNames = PRONIA_CHR_medic_T2.Properties.VariableNames;

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Clozapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_CHR_medic_T2{:, medColumns}) | PRONIA_CHR_medic_T2{:, medColumns} == 0 | isempty(PRONIA_CHR_medic_T2{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
%%weight change 
weightdeltaNoMedication = PRONIA_CHR_medic_T2.weightdelta_T2(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_CHR_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_CHR_medic_T2.BMIdelta_T2(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_CHR_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_CHR_medic_exist=PRONIA_CHR_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.weightdelta_T2) 


%%Olanzapin
% Get the list of all column names

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Olanzapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_CHR_medic_T2{:, medColumns}) | PRONIA_CHR_medic_T2{:, medColumns} == 0 | isempty(PRONIA_CHR_medic_T2{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
%%weight change 
weightdeltaNoMedication = PRONIA_CHR_medic_T2.weightdelta_T2(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_CHR_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_CHR_medic_T2.BMIdelta_T2(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_CHR_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_CHR_medic_exist=PRONIA_CHR_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.weightdelta_T2) 



%%SSRI

% Find the columns that contain 'SSRI'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'SSRI'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_CHR_medic_T2{:, medColumns}) | PRONIA_CHR_medic_T2{:, medColumns} == 0 | isempty(PRONIA_CHR_medic_T2{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change %weight change not significant
weightdeltaNoMedication = PRONIA_CHR_medic_T2.weightdelta_T2(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_CHR_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_CHR_medic_T2.BMIdelta_T2(noMedicationIndices); %no difference between medication and no medication
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_CHR_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_CHR_medic_exist=PRONIA_CHR_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.weightdelta_T2) 



% %%benzo
% clear medColumns noMedicationIndices bmiGapNoMedication
% medColumns = contains(columnNames, {'Benzo'});
% 
% 
% % Select only those columns
% noMedicationIndices = all(isnan(PRONIA_CHR_medic_T2{:, medColumns}) | PRONIA_CHR_medic_T2{:, medColumns} == 0 | isempty(PRONIA_CHR_medic_T2{:, medColumns}), 2);
% bmiGapNoMedication = bmiGapValues(noMedicationIndices);
% meanbmigapnomedication=mean(bmiGapNoMedication)
% bmiGapMedication = bmiGapValues(~noMedicationIndices);
% meanbmigapmedication=mean(bmiGapMedication)
% [h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
% %%weight change 
% weightdeltaNoMedication = PRONIA_CHR_medic_T2.weightdelta_T2(noMedicationIndices);
% meanweightdeltanomedication=mean(weightdeltaNoMedication)
% weightdeltaMedication = PRONIA_CHR_medic_T2.weightdelta_T2(~noMedicationIndices);
% meanweightdeltamedication=mean(weightdeltaMedication)
% [h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)
% 
% BMIdeltaNoMedication = PRONIA_CHR_medic_T2.BMIdelta_T2(noMedicationIndices); %no difference between medication and no medication
% meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
% BMIdeltaMedication = PRONIA_CHR_medic_T2.BMIdelta_T2(~noMedicationIndices);
% meanBMIdeltamedication=mean(BMIdeltaMedication)
% [h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)
% 
% PRONIA_CHR_medic_exist=PRONIA_CHR_medic_T2(~noMedicationIndices,:)
% 
% [r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.BMIdelta_T2) 
% [r,p]=corr(PRONIA_CHR_medic_exist.BMIgap_CHR_corrcted,PRONIA_CHR_medic_exist.weightdelta_T2) 

%%ROD


PRONIA_ROD_medic_T1=med_T1(ismember(med_T1.PSN,PRONIA_ROD_T0_T1_all.PSN),:);
PRONIA_ROD_medic_T1=innerjoin(PRONIA_ROD_T0_T1_all,PRONIA_ROD_medic_T1,"Keys","PSN");
PRONIA_ROD_medic_T2=med_T2(ismember(med_T2.PSN,PRONIA_ROD_T0_T2_all.PSN),:);
PRONIA_ROD_medic_T2=innerjoin(PRONIA_ROD_T0_T2_all,PRONIA_ROD_medic_T2,"Keys","PSN");
clear noMedicationIndices bmiGapNoMedication

columnNames = {
    'TREAT_MED_Clozapin_01_Equivalent_T1',
    'TREAT_MED_Clozapin_02_Equivalent_T1',
    'TREAT_MED_Clozapin_03_Equivalent_T1',
    'TREAT_MED_Clozapin_04_Equivalent_T1',
    'TREAT_MED_Clozapin_05_Equivalent_T1',
    'TREAT_MED_Clozapin_06_Equivalent_T1',
    'TREAT_MED_Clozapin_07_Equivalent_T1',
    'TREAT_MED_Clozapin_08_Equivalent_T1',
    'TREAT_MED_Clozapin_09_Equivalent_T1',
    'TREAT_MED_Clozapin_10_Equivalent_T1',
    'TREAT_MED_Olanzapin_01_Equivalent_T1',
    'TREAT_MED_Olanzapin_02_Equivalent_T1',
    'TREAT_MED_Olanzapin_03_Equivalent_T1',
    'TREAT_MED_Olanzapin_04_Equivalent_T1',
    'TREAT_MED_Olanzapin_05_Equivalent_T1',
    'TREAT_MED_Olanzapin_06_Equivalent_T1',
    'TREAT_MED_Olanzapin_07_Equivalent_T1',
    'TREAT_MED_Olanzapin_08_Equivalent_T1',
    'TREAT_MED_Olanzapin_09_Equivalent_T1',
    'TREAT_MED_Olanzapin_10_Equivalent_T1',
    'TREAT_MED_SSRI_01_Equivalent_T1',
    'TREAT_MED_SSRI_02_Equivalent_T1',
    'TREAT_MED_SSRI_03_Equivalent_T1',
    'TREAT_MED_SSRI_04_Equivalent_T1',
    'TREAT_MED_SSRI_05_Equivalent_T1',
    'TREAT_MED_SSRI_06_Equivalent_T1',
    'TREAT_MED_SSRI_07_Equivalent_T1',
    'TREAT_MED_SSRI_08_Equivalent_T1',
    'TREAT_MED_SSRI_09_Equivalent_T1',
    'TREAT_MED_SSRI_10_Equivalent_T1',
    'TREAT_MED_Benzo_01_Equivalent_T1',
    'TREAT_MED_Benzo_02_Equivalent_T1',
    'TREAT_MED_Benzo_03_Equivalent_T1',
    'TREAT_MED_Benzo_04_Equivalent_T1',
    'TREAT_MED_Benzo_05_Equivalent_T1',
    'TREAT_MED_Benzo_06_Equivalent_T1',
    'TREAT_MED_Benzo_07_Equivalent_T1',
    'TREAT_MED_Benzo_08_Equivalent_T1',
    'TREAT_MED_Benzo_09_Equivalent_T1',
    'TREAT_MED_Benzo_10_Equivalent_T1'
};

% Initialize an array to store non-empty and non-NaN BMIgap values
meanBMIgaps = zeros(1, length(columnNames));
resultCell = cell(1, length(columnNames));
validCounts = zeros(1, length(columnNames));

% Loop through each column name
for i = 1:length(columnNames)
    colName = columnNames{i};
    
    % Check if the column exists in the data
    if ismember(colName, PRONIA_ROD_medic_T1.Properties.VariableNames)
        % Get the values from the column
        colValues = PRONIA_ROD_medic_T1.(colName);
        bmiGapValues = PRONIA_ROD_medic_T1.BMIgap_ROD_corrcted; % Get the values from the BMIgap column
        
        % Filter out NaN, empty, and zero values
        validIndices = ~isnan(colValues) & ~isempty(colValues) & colValues ~= 0;
        sum(validIndices)
        sum(~validIndices)

        % Add valid BMIgaps to the array
        meanBMIgaps(i) = mean(bmiGapValues(validIndices));
        validCounts(i) = sum(validIndices);

        resultCell{1, i} = meanBMIgaps(i);


    end
end
resultTable = cell2table(resultCell, 'VariableNames', columnNames);
bmiGapValues = PRONIA_ROD_medic_T1.BMIgap_ROD_corrcted; % Get the values from the BMIgap column

% Calculate the mean of valid BMIgaps


clozapinColumns = PRONIA_ROD_medic_T1(:, contains(PRONIA_ROD_medic_T1.Properties.VariableNames, 'Clozapin'));
sumResults = zeros(size(clozapinColumns, 1), 1); % Preallocate a vector to store the results


for i = 1:size(clozapinColumns, 1)
    if all(isnan(clozapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(clozapinColumns{i, :});
    end
end
PRONIA_ROD_medic_T1.clozapinsum=sumResults;

OlanzapinColumns = PRONIA_ROD_medic_T1(:, contains(PRONIA_ROD_medic_T1.Properties.VariableNames, 'Olanzapin'));
sumResults = zeros(size(OlanzapinColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(OlanzapinColumns, 1)
    if all(isnan(OlanzapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(OlanzapinColumns{i, :});
    end
end
PRONIA_ROD_medic_T1.Olanzapin=sumResults;

SSRIColumns = PRONIA_ROD_medic_T1(:, contains(PRONIA_ROD_medic_T1.Properties.VariableNames, 'SSRI'));
sumResults = zeros(size(SSRIColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(SSRIColumns, 1)
    if all(isnan(SSRIColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(SSRIColumns{i, :});
    end
end
PRONIA_ROD_medic_T1.SSRI=sumResults;

BenzoColumns = PRONIA_ROD_medic_T1(:, contains(PRONIA_ROD_medic_T1.Properties.VariableNames, 'Benzo'));
sumResults = zeros(size(BenzoColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(BenzoColumns, 1)
    if all(isnan(BenzoColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(BenzoColumns{i, :});
    end
end
PRONIA_ROD_medic_T1.Benzo=sumResults;


%medication and BMIgap
noMedicationIndices = all(isnan(PRONIA_ROD_medic_T1{:, columnNames}) | PRONIA_ROD_medic_T1{:, columnNames} == 0 | isempty(PRONIA_ROD_medic_T1{:, columnNames}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);%N=51
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);%N=101
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_ROD_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROD_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROD_medic_T1.BMIdelta_T1(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROD_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROD_medic_exist=PRONIA_ROD_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.BMIdelta_T1) %sig
[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.weightdelta_T1) %sig

%%Clozapin
% Get the list of all column names
columnNames = PRONIA_ROD_medic_exist.Properties.VariableNames;

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Clozapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROD_medic_T1{:, medColumns}) | PRONIA_ROD_medic_T1{:, medColumns} == 0 | isempty(PRONIA_ROD_medic_T1{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_ROD_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROD_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROD_medic_T1.BMIdelta_T1(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROD_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)


PRONIA_ROD_medic_exist=PRONIA_ROD_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.weightdelta_T1) 


%%Olanzapin
% Get the list of all column names
columnNames = PRONIA_ROD_medic_exist.Properties.VariableNames;

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Olanzapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROD_medic_T1{:, medColumns}) | PRONIA_ROD_medic_T1{:, medColumns} == 0 | isempty(PRONIA_ROD_medic_T1{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_ROD_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROD_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROD_medic_T1.BMIdelta_T1(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROD_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROD_medic_exist=PRONIA_ROD_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.BMIdelta_T1) %sig
[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.weightdelta_T1) %sig



%%SSRI

% Find the columns that contain 'SSRI'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'SSRI'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROD_medic_T1{:, medColumns}) | PRONIA_ROD_medic_T1{:, medColumns} == 0 | isempty(PRONIA_ROD_medic_T1{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_ROD_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROD_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)


BMIdeltaNoMedication = PRONIA_ROD_medic_T1.BMIdelta_T1(noMedicationIndices); %no difference between medication and no medication
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROD_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROD_medic_exist=PRONIA_ROD_medic_T1(~noMedicationIndices,:);

[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.BMIdelta_T1) %sig
[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.weightdelta_T1) %sig



%%benzo
% clear medColumns noMedicationIndices bmiGapNoMedication
% medColumns = contains(columnNames, {'Benzo'});
% 
% 
% % Select only those columns
% noMedicationIndices = all(isnan(PRONIA_ROD_medic_T1{:, medColumns}) | PRONIA_ROD_medic_T1{:, medColumns} == 0 | isempty(PRONIA_ROD_medic_T1{:, medColumns}), 2);
% bmiGapNoMedication = bmiGapValues(noMedicationIndices);
% meanbmigapnomedication=mean(bmiGapNoMedication)
% bmiGapMedication = bmiGapValues(~noMedicationIndices);
% meanbmigapmedication=mean(bmiGapMedication)
% [h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
% 
% %%weight change 
% weightdeltaNoMedication = PRONIA_ROD_medic_T1.weightdelta_T1(noMedicationIndices);
% meanweightdeltanomedication=mean(weightdeltaNoMedication)
% weightdeltaMedication = PRONIA_ROD_medic_T1.weightdelta_T1(~noMedicationIndices);
% meanweightdeltamedication=mean(weightdeltaMedication)
% [h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)
% 
% BMIdeltaNoMedication = PRONIA_ROD_medic_T1.BMIdelta_T1(noMedicationIndices); %no difference between medication and no medication
% meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
% BMIdeltaMedication = PRONIA_ROD_medic_T1.BMIdelta_T1(~noMedicationIndices);
% meanBMIdeltamedication=mean(BMIdeltaMedication)
% [h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)
% 
% PRONIA_ROD_medic_exist=PRONIA_ROD_medic_T1(~noMedicationIndices,:)
% 
% [r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.BMIdelta_T1) 
% [r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.weightdelta_T1) 


%%% T2
columnNames = {
    'TREAT_MED_Clozapin_01_Equivalent_T2',
    'TREAT_MED_Clozapin_02_Equivalent_T2',
    'TREAT_MED_Clozapin_03_Equivalent_T2',
    'TREAT_MED_Clozapin_04_Equivalent_T2',
    'TREAT_MED_Clozapin_05_Equivalent_T2',
    'TREAT_MED_Clozapin_06_Equivalent_T2',
    'TREAT_MED_Clozapin_07_Equivalent_T2',
    'TREAT_MED_Clozapin_08_Equivalent_T2',
    'TREAT_MED_Clozapin_09_Equivalent_T2',
    'TREAT_MED_Olanzapin_01_Equivalent_T2',
    'TREAT_MED_Olanzapin_02_Equivalent_T2',
    'TREAT_MED_Olanzapin_03_Equivalent_T2',
    'TREAT_MED_Olanzapin_04_Equivalent_T2',
    'TREAT_MED_Olanzapin_05_Equivalent_T2',
    'TREAT_MED_Olanzapin_06_Equivalent_T2',
    'TREAT_MED_Olanzapin_07_Equivalent_T2',
    'TREAT_MED_Olanzapin_08_Equivalent_T2',
    'TREAT_MED_Olanzapin_09_Equivalent_T2',
    'TREAT_MED_SSRI_01_Equivalent_T2',
    'TREAT_MED_SSRI_02_Equivalent_T2',
    'TREAT_MED_SSRI_03_Equivalent_T2',
    'TREAT_MED_SSRI_04_Equivalent_T2',
    'TREAT_MED_SSRI_05_Equivalent_T2',
    'TREAT_MED_SSRI_06_Equivalent_T2',
    'TREAT_MED_SSRI_07_Equivalent_T2',
    'TREAT_MED_SSRI_08_Equivalent_T2',
    'TREAT_MED_SSRI_09_Equivalent_T2',
    'TREAT_MED_Benzo_01_Equivalent_T2',
    'TREAT_MED_Benzo_02_Equivalent_T2',
    'TREAT_MED_Benzo_03_Equivalent_T2',
    'TREAT_MED_Benzo_04_Equivalent_T2',
    'TREAT_MED_Benzo_05_Equivalent_T2',
    'TREAT_MED_Benzo_06_Equivalent_T2',
    'TREAT_MED_Benzo_07_Equivalent_T2',
    'TREAT_MED_Benzo_08_Equivalent_T2',
    'TREAT_MED_Benzo_09_Equivalent_T2'
};

% Initialize an array to store non-empty and non-NaN BMIgap values
meanBMIgaps = zeros(1, length(columnNames));
resultCell = cell(1, length(columnNames));
validCounts = zeros(1, length(columnNames));

% Loop through each column name
for i = 1:length(columnNames)
    colName = columnNames{i};
    
    % Check if the column exists in the data
    if ismember(colName, PRONIA_ROD_medic_T2.Properties.VariableNames)
        % Get the values from the column
        colValues = PRONIA_ROD_medic_T2.(colName);
        bmiGapValues = PRONIA_ROD_medic_T2.BMIgap_ROD_corrcted; % Get the values from the BMIgap column
        
        % Filter out NaN, empty, and zero values
        validIndices = ~isnan(colValues) & ~isempty(colValues) & colValues ~= 0;
        sum(validIndices)
        sum(~validIndices)

        % Add valid BMIgaps to the array
        meanBMIgaps(i) = mean(bmiGapValues(validIndices));
        validCounts(i) = sum(validIndices);

        resultCell{1, i} = meanBMIgaps(i);


    end
end
resultTable = cell2table(resultCell, 'VariableNames', columnNames);
bmiGapValues = PRONIA_ROD_medic_T2.BMIgap_ROD_corrcted; % Get the values from the BMIgap column

% Calculate the mean of valid BMIgaps


clozapinColumns = PRONIA_ROD_medic_T2(:, contains(PRONIA_ROD_medic_T2.Properties.VariableNames, 'Clozapin'));
sumResults = zeros(size(clozapinColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(clozapinColumns, 1)
    if all(isnan(clozapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(clozapinColumns{i, :});
    end
end

PRONIA_ROD_medic_T2.clozapinsum = sumResults;

OlanzapinColumns = PRONIA_ROD_medic_T2(:, contains(PRONIA_ROD_medic_T2.Properties.VariableNames, 'Olanzapin'));
sumResults = zeros(size(OlanzapinColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(OlanzapinColumns, 1)
    if all(isnan(OlanzapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(OlanzapinColumns{i, :});
    end
end
PRONIA_ROD_medic_T2.Olanzapin=sumResults;

SSRIColumns = PRONIA_ROD_medic_T2(:, contains(PRONIA_ROD_medic_T2.Properties.VariableNames, 'SSRI'));
sumResults = zeros(size(SSRIColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(SSRIColumns, 1)
    if all(isnan(SSRIColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(SSRIColumns{i, :});
    end
end
PRONIA_ROD_medic_T2.SSRI=sumResults;

BenzoColumns = PRONIA_ROD_medic_T2(:, contains(PRONIA_ROD_medic_T2.Properties.VariableNames, 'Benzo'));
sumResults = zeros(size(BenzoColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(BenzoColumns, 1)
    if all(isnan(BenzoColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(BenzoColumns{i, :});
    end
end
PRONIA_ROD_medic_T2.Benzo=sumResults;

%medication and BMIgap
bmiGapValues = PRONIA_ROD_medic_T2.BMIgap_ROD_corrcted; % Get the values from the BMIgap column
clear noMedicationIndices
noMedicationIndices = all(isnan(PRONIA_ROD_medic_T2{:, columnNames}) | PRONIA_ROD_medic_T2{:, columnNames} == 0 | isempty(PRONIA_ROD_medic_T2{:, columnNames}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
%%weight change %%not significant
weightdeltaNoMedication = PRONIA_ROD_medic_T2.weightdelta_T2(noMedicationIndices);%weight change is not significant
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROD_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROD_medic_T2.BMIdelta_T2(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROD_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROD_medic_exist=PRONIA_ROD_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.weightdelta_T2) 

%%Clozapin
% Get the list of all column names
columnNames = PRONIA_ROD_medic_T2.Properties.VariableNames;

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Clozapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROD_medic_T2{:, medColumns}) | PRONIA_ROD_medic_T2{:, medColumns} == 0 | isempty(PRONIA_ROD_medic_T2{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
%%weight change 
weightdeltaNoMedication = PRONIA_ROD_medic_T2.weightdelta_T2(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROD_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROD_medic_T2.BMIdelta_T2(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROD_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROD_medic_exist=PRONIA_ROD_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.weightdelta_T2) 


%%Olanzapin
% Get the list of all column names

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Olanzapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROD_medic_T2{:, medColumns}) | PRONIA_ROD_medic_T2{:, medColumns} == 0 | isempty(PRONIA_ROD_medic_T2{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
%%weight change 
weightdeltaNoMedication = PRONIA_ROD_medic_T2.weightdelta_T2(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROD_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROD_medic_T2.BMIdelta_T2(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROD_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROD_medic_exist=PRONIA_ROD_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.weightdelta_T2) 



%%SSRI

% Find the columns that contain 'SSRI'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'SSRI'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROD_medic_T2{:, medColumns}) | PRONIA_ROD_medic_T2{:, medColumns} == 0 | isempty(PRONIA_ROD_medic_T2{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change %weight change not significant
weightdeltaNoMedication = PRONIA_ROD_medic_T2.weightdelta_T2(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROD_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROD_medic_T2.BMIdelta_T2(noMedicationIndices); %no difference between medication and no medication
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROD_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROD_medic_exist=PRONIA_ROD_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.BMIdelta_T2) %sig
[r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.weightdelta_T2) %sig



%%benzo
% clear medColumns noMedicationIndices bmiGapNoMedication
% medColumns = contains(columnNames, {'Benzo'});
% 
% 
% % Select only those columns
% noMedicationIndices = all(isnan(PRONIA_ROD_medic_T2{:, medColumns}) | PRONIA_ROD_medic_T2{:, medColumns} == 0 | isempty(PRONIA_ROD_medic_T2{:, medColumns}), 2);
% bmiGapNoMedication = bmiGapValues(noMedicationIndices);
% meanbmigapnomedication=mean(bmiGapNoMedication)
% bmiGapMedication = bmiGapValues(~noMedicationIndices);
% meanbmigapmedication=mean(bmiGapMedication)
% [h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
% %%weight change 
% weightdeltaNoMedication = PRONIA_ROD_medic_T2.weightdelta_T2(noMedicationIndices);
% meanweightdeltanomedication=mean(weightdeltaNoMedication)
% weightdeltaMedication = PRONIA_ROD_medic_T2.weightdelta_T2(~noMedicationIndices);
% meanweightdeltamedication=mean(weightdeltaMedication)
% [h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)
% 
% BMIdeltaNoMedication = PRONIA_ROD_medic_T2.BMIdelta_T2(noMedicationIndices); %no difference between medication and no medication
% meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
% BMIdeltaMedication = PRONIA_ROD_medic_T2.BMIdelta_T2(~noMedicationIndices);
% meanBMIdeltamedication=mean(BMIdeltaMedication)
% [h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)
% 
% PRONIA_ROD_medic_exist=PRONIA_ROD_medic_T2(~noMedicationIndices,:)
% 
% [r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.BMIdelta_T2) 
% [r,p]=corr(PRONIA_ROD_medic_exist.BMIgap_ROD_corrcted,PRONIA_ROD_medic_exist.weightdelta_T2) 
med_T1=Tables(:,contains(Tables.Properties.VariableNames,{'PSN','TREAT_MED_Clozapin_','TREAT_MED_Olanzapin_','TREAT_MED_SSRI_','TREAT_MED_Benzo_'}));
med_T1=med_T1(:,contains(med_T1.Properties.VariableNames,{'PSN','T1'}));
PRONIA_ROP_medic_T1=med_T1(ismember(med_T1.PSN,PRONIA_ROP_T0_T1_all.PSN),:);
PRONIA_ROP_medic_T1=innerjoin(PRONIA_ROP_T0_T1_all,PRONIA_ROP_medic_T1,"Keys","PSN");

med_T2=Tables(:,contains(Tables.Properties.VariableNames,{'PSN','TREAT_MED_Clozapin_','TREAT_MED_Olanzapin_','TREAT_MED_SSRI_','TREAT_MED_Benzo_'}));
med_T2=med_T2(:,contains(med_T2.Properties.VariableNames,{'PSN','T2'}));

PRONIA_ROP_medic_T2=med_T2(ismember(med_T2.PSN,PRONIA_ROP_T0_T2_all.PSN),:);
PRONIA_ROP_medic_T2=innerjoin(PRONIA_ROP_T0_T2_all,PRONIA_ROP_medic_T2,"Keys","PSN");

columnNames = {
    'TREAT_MED_Clozapin_01_Equivalent_T1',
    'TREAT_MED_Clozapin_02_Equivalent_T1',
    'TREAT_MED_Clozapin_03_Equivalent_T1',
    'TREAT_MED_Clozapin_04_Equivalent_T1',
    'TREAT_MED_Clozapin_05_Equivalent_T1',
    'TREAT_MED_Clozapin_06_Equivalent_T1',
    'TREAT_MED_Clozapin_07_Equivalent_T1',
    'TREAT_MED_Clozapin_08_Equivalent_T1',
    'TREAT_MED_Clozapin_09_Equivalent_T1',
    'TREAT_MED_Clozapin_10_Equivalent_T1',
    'TREAT_MED_Olanzapin_01_Equivalent_T1',
    'TREAT_MED_Olanzapin_02_Equivalent_T1',
    'TREAT_MED_Olanzapin_03_Equivalent_T1',
    'TREAT_MED_Olanzapin_04_Equivalent_T1',
    'TREAT_MED_Olanzapin_05_Equivalent_T1',
    'TREAT_MED_Olanzapin_06_Equivalent_T1',
    'TREAT_MED_Olanzapin_07_Equivalent_T1',
    'TREAT_MED_Olanzapin_08_Equivalent_T1',
    'TREAT_MED_Olanzapin_09_Equivalent_T1',
    'TREAT_MED_Olanzapin_10_Equivalent_T1',
    'TREAT_MED_SSRI_01_Equivalent_T1',
    'TREAT_MED_SSRI_02_Equivalent_T1',
    'TREAT_MED_SSRI_03_Equivalent_T1',
    'TREAT_MED_SSRI_04_Equivalent_T1',
    'TREAT_MED_SSRI_05_Equivalent_T1',
    'TREAT_MED_SSRI_06_Equivalent_T1',
    'TREAT_MED_SSRI_07_Equivalent_T1',
    'TREAT_MED_SSRI_08_Equivalent_T1',
    'TREAT_MED_SSRI_09_Equivalent_T1',
    'TREAT_MED_SSRI_10_Equivalent_T1',
    'TREAT_MED_Benzo_01_Equivalent_T1',
    'TREAT_MED_Benzo_02_Equivalent_T1',
    'TREAT_MED_Benzo_03_Equivalent_T1',
    'TREAT_MED_Benzo_04_Equivalent_T1',
    'TREAT_MED_Benzo_05_Equivalent_T1',
    'TREAT_MED_Benzo_06_Equivalent_T1',
    'TREAT_MED_Benzo_07_Equivalent_T1',
    'TREAT_MED_Benzo_08_Equivalent_T1',
    'TREAT_MED_Benzo_09_Equivalent_T1',
    'TREAT_MED_Benzo_10_Equivalent_T1'
};

% Initialize an array to store non-empty and non-NaN BMIgap values
meanBMIgaps = zeros(1, length(columnNames));
resultCell = cell(1, length(columnNames));
validCounts = zeros(1, length(columnNames));

% Loop through each column name
for i = 1:length(columnNames)
    colName = columnNames{i};
    
    % Check if the column exists in the data
    if ismember(colName, PRONIA_ROP_medic_T1.Properties.VariableNames)
        % Get the values from the column
        colValues = PRONIA_ROP_medic_T1.(colName);
        bmiGapValues = PRONIA_ROP_medic_T1.BMIgap_ROP_corrcted; % Get the values from the BMIgap column
        
        % Filter out NaN, empty, and zero values
        validIndices = ~isnan(colValues) & ~isempty(colValues) & colValues ~= 0;
        sum(validIndices)
        sum(~validIndices)

        % Add valid BMIgaps to the array
        meanBMIgaps(i) = mean(bmiGapValues(validIndices));
        validCounts(i) = sum(validIndices);

        resultCell{1, i} = meanBMIgaps(i);


    end
end
resultTable = cell2table(resultCell, 'VariableNames', columnNames);
bmiGapValues = PRONIA_ROP_medic_T1.BMIgap_ROP_corrcted; % Get the values from the BMIgap column

% Calculate the mean of valid BMIgaps


clozapinColumns = PRONIA_ROP_medic_T1(:, contains(PRONIA_ROP_medic_T1.Properties.VariableNames, 'Clozapin'));

sumResults = zeros(size(clozapinColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(clozapinColumns, 1)
    if all(isnan(clozapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(clozapinColumns{i, :});
    end
end
PRONIA_ROP_medic_T1.clozapinsum=sumResults;

OlanzapinColumns = PRONIA_ROP_medic_T1(:, contains(PRONIA_ROP_medic_T1.Properties.VariableNames, 'Olanzapin'));
OlanzapinColumns = OlanzapinColumns(:,contains(OlanzapinColumns.Properties.VariableNames, 'T1'));

sumResults = zeros(size(OlanzapinColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(OlanzapinColumns, 1)
    if all(isnan(OlanzapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(OlanzapinColumns{i, :});
    end
end
PRONIA_ROP_medic_T1.Olanzapin=sumResults;

SSRIColumns = PRONIA_ROP_medic_T1(:, contains(PRONIA_ROP_medic_T1.Properties.VariableNames, 'SSRI'));
SSRIColumns = SSRIColumns(:,contains(SSRIColumns.Properties.VariableNames, 'T1'));

sumResults = zeros(size(SSRIColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(SSRIColumns, 1)
    if all(isnan(SSRIColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(SSRIColumns{i, :});
    end
end
PRONIA_ROP_medic_T1.SSRI=sumResults;

BenzoColumns = PRONIA_ROP_medic_T1(:, contains(PRONIA_ROP_medic_T1.Properties.VariableNames, 'Benzo'));
BenzoColumns = BenzoColumns(:,contains(BenzoColumns.Properties.VariableNames, 'T1'));

sumResults = zeros(size(BenzoColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(BenzoColumns, 1)
    if all(isnan(BenzoColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(BenzoColumns{i, :});
    end
end
PRONIA_ROP_medic_T1.Benzo=sumResults;

%
[h,p]=ttest2(PRONIA_ROP_medic_T1.BMI_T0,PRONIA_ROP_medic_T1.BMI_T1)
[h,p]=ttest2(PRONIA_ROP_medic_T1.SOMAT_02_Weight_corr_Screening,PRONIA_ROP_medic_T1.SOMAT_02_Weight_corr_T1)
[h,p]=ttest2(PRONIA_ROP_medic_T1.BMI_T0,PRONIA_ROP_medic_T1.BMI_T2)
[h,p]=ttest2(PRONIA_ROP_medic_T1.SOMAT_02_Weight_corr_Screening,PRONIA_ROP_medic_T1.SOMAT_02_Weight_corr_T2)

%medication and BMIgap
noMedicationIndices = all(isnan(PRONIA_ROP_medic_T1{:, columnNames}) | PRONIA_ROP_medic_T1{:, columnNames} == 0 | isempty(PRONIA_ROP_medic_T1{:, columnNames}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_ROP_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROP_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROP_medic_T1.BMIdelta_T1(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROP_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROP_medic_exist=PRONIA_ROP_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.weightdelta_T1) 

%%Clozapin
% Get the list of all column names
columnNames = PRONIA_ROP_medic_exist.Properties.VariableNames;

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Clozapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROP_medic_T1{:, medColumns}) | PRONIA_ROP_medic_T1{:, medColumns} == 0 | isempty(PRONIA_ROP_medic_T1{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_ROP_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROP_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROP_medic_T1.BMIdelta_T1(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROP_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)


PRONIA_ROP_medic_exist=PRONIA_ROP_medic_T1(~noMedicationIndices,:);

[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.weightdelta_T1) 


%%Olanzapin
% Get the list of all column names
columnNames = PRONIA_ROP_medic_exist.Properties.VariableNames;

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Olanzapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROP_medic_T1{:, medColumns}) | PRONIA_ROP_medic_T1{:, medColumns} == 0 | isempty(PRONIA_ROP_medic_T1{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_ROP_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROP_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROP_medic_T1.BMIdelta_T1(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROP_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROP_medic_exist=PRONIA_ROP_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.weightdelta_T1) 



%%SSRI

% Find the columns that contain 'SSRI'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'SSRI'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROP_medic_T1{:, medColumns}) | PRONIA_ROP_medic_T1{:, medColumns} == 0 | isempty(PRONIA_ROP_medic_T1{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_ROP_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROP_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)


BMIdeltaNoMedication = PRONIA_ROP_medic_T1.BMIdelta_T1(noMedicationIndices); %no difference between medication and no medication
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROP_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROP_medic_exist=PRONIA_ROP_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.weightdelta_T1) 



% %%benzo
% clear medColumns noMedicationIndices bmiGapNoMedication
% medColumns = contains(columnNames, {'Benzo'});
% 
% 
% % Select only those columns
% noMedicationIndices = all(isnan(PRONIA_ROP_medic_T1{:, medColumns}) | PRONIA_ROP_medic_T1{:, medColumns} == 0 | isempty(PRONIA_ROP_medic_T1{:, medColumns}), 2);
% bmiGapNoMedication = bmiGapValues(noMedicationIndices);
% meanbmigapnomedication=mean(bmiGapNoMedication)
% bmiGapMedication = bmiGapValues(~noMedicationIndices);
% meanbmigapmedication=mean(bmiGapMedication)
% [h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change 
weightdeltaNoMedication = PRONIA_ROP_medic_T1.weightdelta_T1(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROP_medic_T1.weightdelta_T1(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROP_medic_T1.BMIdelta_T1(noMedicationIndices); %no difference between medication and no medication
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROP_medic_T1.BMIdelta_T1(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROP_medic_exist=PRONIA_ROP_medic_T1(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.BMIdelta_T1) 
[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.weightdelta_T1) 


%%% T2
columnNames = {
    'TREAT_MED_Clozapin_01_Equivalent_T2',
    'TREAT_MED_Clozapin_02_Equivalent_T2',
    'TREAT_MED_Clozapin_03_Equivalent_T2',
    'TREAT_MED_Clozapin_04_Equivalent_T2',
    'TREAT_MED_Clozapin_05_Equivalent_T2',
    'TREAT_MED_Clozapin_06_Equivalent_T2',
    'TREAT_MED_Clozapin_07_Equivalent_T2',
    'TREAT_MED_Clozapin_08_Equivalent_T2',
    'TREAT_MED_Clozapin_09_Equivalent_T2',
    'TREAT_MED_Olanzapin_01_Equivalent_T2',
    'TREAT_MED_Olanzapin_02_Equivalent_T2',
    'TREAT_MED_Olanzapin_03_Equivalent_T2',
    'TREAT_MED_Olanzapin_04_Equivalent_T2',
    'TREAT_MED_Olanzapin_05_Equivalent_T2',
    'TREAT_MED_Olanzapin_06_Equivalent_T2',
    'TREAT_MED_Olanzapin_07_Equivalent_T2',
    'TREAT_MED_Olanzapin_08_Equivalent_T2',
    'TREAT_MED_Olanzapin_09_Equivalent_T2',
    'TREAT_MED_SSRI_01_Equivalent_T2',
    'TREAT_MED_SSRI_02_Equivalent_T2',
    'TREAT_MED_SSRI_03_Equivalent_T2',
    'TREAT_MED_SSRI_04_Equivalent_T2',
    'TREAT_MED_SSRI_05_Equivalent_T2',
    'TREAT_MED_SSRI_06_Equivalent_T2',
    'TREAT_MED_SSRI_07_Equivalent_T2',
    'TREAT_MED_SSRI_08_Equivalent_T2',
    'TREAT_MED_SSRI_09_Equivalent_T2',
    'TREAT_MED_Benzo_01_Equivalent_T2',
    'TREAT_MED_Benzo_02_Equivalent_T2',
    'TREAT_MED_Benzo_03_Equivalent_T2',
    'TREAT_MED_Benzo_04_Equivalent_T2',
    'TREAT_MED_Benzo_05_Equivalent_T2',
    'TREAT_MED_Benzo_06_Equivalent_T2',
    'TREAT_MED_Benzo_07_Equivalent_T2',
    'TREAT_MED_Benzo_08_Equivalent_T2',
    'TREAT_MED_Benzo_09_Equivalent_T2'
};
% Initialize an array to store non-empty and non-NaN BMIgap values
meanBMIgaps = zeros(1, length(columnNames));
resultCell = cell(1, length(columnNames));
validCounts = zeros(1, length(columnNames));

% Loop through each column name
for i = 1:length(columnNames)
    colName = columnNames{i};
    
    % Check if the column exists in the data
    if ismember(colName, PRONIA_ROP_medic_T2.Properties.VariableNames)
        % Get the values from the column
        colValues = PRONIA_ROP_medic_T2.(colName);
        bmiGapValues = PRONIA_ROP_medic_T2.BMIgap_ROP_corrcted; % Get the values from the BMIgap column
        
        % Filter out NaN, empty, and zero values
        validIndices = ~isnan(colValues) & ~isempty(colValues) & colValues ~= 0;
        sum(validIndices)
        sum(~validIndices)

        % Add valid BMIgaps to the array
        meanBMIgaps(i) = mean(bmiGapValues(validIndices));
        validCounts(i) = sum(validIndices);

        resultCell{1, i} = meanBMIgaps(i);


    end
end
resultTable = cell2table(resultCell, 'VariableNames', columnNames);
bmiGapValues = PRONIA_ROP_medic_T2.BMIgap_ROP_corrcted; % Get the values from the BMIgap column

% Calculate the mean of valid BMIgaps


clozapinColumns = PRONIA_ROP_medic_T2(:, contains(PRONIA_ROP_medic_T2.Properties.VariableNames, 'Clozapin'));
sumResults = zeros(size(clozapinColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(clozapinColumns, 1)
    if all(isnan(clozapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(clozapinColumns{i, :});
    end
end
PRONIA_ROP_medic_T2.clozapinsum=sumResults;

OlanzapinColumns = PRONIA_ROP_medic_T2(:, contains(PRONIA_ROP_medic_T2.Properties.VariableNames, 'Olanzapin'));
sumResults = zeros(size(OlanzapinColumns, 1), 1); % Preallocate a vector to store the results
for i = 1:size(OlanzapinColumns, 1)
    if all(isnan(OlanzapinColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(OlanzapinColumns{i, :});
    end
end
PRONIA_ROP_medic_T2.Olanzapin=sumResults;

SSRIColumns = PRONIA_ROP_medic_T2(:, contains(PRONIA_ROP_medic_T2.Properties.VariableNames, 'SSRI'));
sumResults = zeros(size(SSRIColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(SSRIColumns, 1)
    if all(isnan(SSRIColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(SSRIColumns{i, :});
    end
end
PRONIA_ROP_medic_T2.SSRI=sumResults;

BenzoColumns = PRONIA_ROP_medic_T2(:, contains(PRONIA_ROP_medic_T2.Properties.VariableNames, 'Benzo'));
sumResults = zeros(size(BenzoColumns, 1), 1); % Preallocate a vector to store the results

for i = 1:size(BenzoColumns, 1)
    if all(isnan(BenzoColumns{i, :}))
        sumResults(i) = NaN;
    else
        sumResults(i) = nansum(BenzoColumns{i, :});
    end
end
PRONIA_ROP_medic_T2.Benzo=sumResults;


%medication and BMIgap
bmiGapValues = PRONIA_ROP_medic_T2.BMIgap_ROP_corrcted; % Get the values from the BMIgap column
clear noMedicationIndices
noMedicationIndices = all(isnan(PRONIA_ROP_medic_T2{:, columnNames}) | PRONIA_ROP_medic_T2{:, columnNames} == 0 | isempty(PRONIA_ROP_medic_T2{:, columnNames}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
%%weight change %%not significant
weightdeltaNoMedication = PRONIA_ROP_medic_T2.weightdelta_T2(noMedicationIndices);%weight change is not significant
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROP_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROP_medic_T2.BMIdelta_T2(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROP_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROP_medic_exist=PRONIA_ROP_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.weightdelta_T2) 

%%Clozapin
% Get the list of all column names
columnNames = PRONIA_ROP_medic_T2.Properties.VariableNames;

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Clozapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROP_medic_T2{:, medColumns}) | PRONIA_ROP_medic_T2{:, medColumns} == 0 | isempty(PRONIA_ROP_medic_T2{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
%%weight change 
weightdeltaNoMedication = PRONIA_ROP_medic_T2.weightdelta_T2(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROP_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROP_medic_T2.BMIdelta_T2(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROP_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROP_medic_exist=PRONIA_ROP_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.weightdelta_T2) 


%%Olanzapin
% Get the list of all column names

% Find the columns that contain 'Clozapin'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'Olanzapin'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROP_medic_T2{:, medColumns}) | PRONIA_ROP_medic_T2{:, medColumns} == 0 | isempty(PRONIA_ROP_medic_T2{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)
%%weight change 
weightdeltaNoMedication = PRONIA_ROP_medic_T2.weightdelta_T2(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROP_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROP_medic_T2.BMIdelta_T2(noMedicationIndices);
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROP_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROP_medic_exist=PRONIA_ROP_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.weightdelta_T2) 



%%SSRI

% Find the columns that contain 'SSRI'
clear medColumns noMedicationIndices bmiGapNoMedication
medColumns = contains(columnNames, {'SSRI'});


% Select only those columns
noMedicationIndices = all(isnan(PRONIA_ROP_medic_T2{:, medColumns}) | PRONIA_ROP_medic_T2{:, medColumns} == 0 | isempty(PRONIA_ROP_medic_T2{:, medColumns}), 2);
bmiGapNoMedication = bmiGapValues(noMedicationIndices);
meanbmigapnomedication=mean(bmiGapNoMedication)
bmiGapMedication = bmiGapValues(~noMedicationIndices);
meanbmigapmedication=mean(bmiGapMedication)
[h,p]=ttest2(bmiGapNoMedication,bmiGapMedication)

%%weight change %weight change not significant
weightdeltaNoMedication = PRONIA_ROP_medic_T2.weightdelta_T2(noMedicationIndices);
meanweightdeltanomedication=mean(weightdeltaNoMedication)
weightdeltaMedication = PRONIA_ROP_medic_T2.weightdelta_T2(~noMedicationIndices);
meanweightdeltamedication=mean(weightdeltaMedication)
[h,p]=ttest2(weightdeltaNoMedication,weightdeltaMedication)

BMIdeltaNoMedication = PRONIA_ROP_medic_T2.BMIdelta_T2(noMedicationIndices); %no difference between medication and no medication
meanBMIdeltanomedication=mean(BMIdeltaNoMedication)
BMIdeltaMedication = PRONIA_ROP_medic_T2.BMIdelta_T2(~noMedicationIndices);
meanBMIdeltamedication=mean(BMIdeltaMedication)
[h,p]=ttest2(BMIdeltaNoMedication,BMIdeltaMedication)

PRONIA_ROP_medic_exist=PRONIA_ROP_medic_T2(~noMedicationIndices,:)

[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.BMIdelta_T2) 
[r,p]=corr(PRONIA_ROP_medic_exist.BMIgap_ROP_corrcted,PRONIA_ROP_medic_exist.weightdelta_T2) 



save(fullfile('/volume/projects/AK_BMI/Analysis/Extraction/PRONIA_ROP_medic_T1.mat'),'PRONIA_ROP_medic_T1')
save(fullfile('/volume/projects/AK_BMI/Analysis/Extraction/PRONIA_ROP_medic_T2.mat'),'PRONIA_ROP_medic_T2')
