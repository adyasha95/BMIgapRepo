path_to_extraction='/volume/projects/AK_BMI/MedicationProcessing'
med_file=readtable(fullfile(path_to_extraction,"Medications_corrected_restructured.xlsx"));
med_fil_weighrisk=readtable(fullfile(path_to_extraction,"Updated_Medications_with_WeightGainRisk_3.xlsx"));
med_file.Weight_Gain_Risk=med_fil_weighrisk.Weight_Gain_Risk;
med_file.Reference_Link=med_fil_weighrisk.Reference_Link;
med_file.Notes=med_fil_weighrisk.Notes;


% Get unique visit types
visitTypes = unique(med_file.VisitType);

% Loop through each visit type and save a separate file
for i = 1:length(visitTypes)
    % Extract subset of data for the current visit type
    visitData = med_file(strcmp(med_file.VisitType, visitTypes{i}), :);

    % Create filename
    outputFileName = sprintf('Medications_%s.xlsx', visitTypes{i});

    % Save to new Excel file
    writetable(visitData, outputFileName);

    % Display confirmation
    fprintf('Saved: %s\n', outputFileName);
end


% Load the data
inputFile = 'Medications_Screening_PAT.xlsx';
sheetName = 'Sheet1'; % Update if necessary

% Read the table
data = readtable(inputFile, 'Sheet', sheetName);
data.PSN = cellfun(@(x) sprintf('%05.0f', x), num2cell(data.PSN), 'UniformOutput', false);
% Extract unique PSNs
uniquePSNs = unique(data.PSN);

% Initialize an output table
outputData = table();

% Loop through each PSN
for i = 1:length(uniquePSNs)
    % Extract all medications for the current PSN
    psnData = data(strcmp(data.PSN, uniquePSNs{i}), :);

    % Convert StartDate and EndDate to datetime
    psnData.StartDate = datetime(psnData.StartDate, 'InputFormat', 'yyyy-MM-dd');
    psnData.EndDate = datetime(psnData.EndDate, 'InputFormat', 'yyyy-MM-dd');

    % Compute duration in days, keeping NaT values as NaT
    validDurations = ~isnat(psnData.EndDate); % Only calculate where EndDate is present
    psnData.Duration = NaN(height(psnData), 1); % Initialize
    psnData.Duration(validDurations) = days(psnData.EndDate(validDurations) - psnData.StartDate(validDurations));

    % Define threshold for significant medication use
    minDuration = 30;  % 30 days threshold
    minDose = 30;       % Adjusted to match new criteria

    % Identify weight gain medications (High & Moderate risk)
    weightGainMeds = psnData((validDurations | (psnData.Duration >= minDuration) | (psnData.Dose >= minDose)) & ...
        (strcmp(psnData.Weight_Gain_Risk, 'High') | strcmp(psnData.Weight_Gain_Risk, 'Moderate')), :);

    % Identify non-weight gain medications (Minimal/None)
    nonWeightGainMeds = psnData((validDurations | (psnData.Duration >= minDuration) | (psnData.Dose >= minDose)) & ...
        strcmp(psnData.Weight_Gain_Risk, 'Minimal/None'), :);

    % Identify unknown medications
    unknownMeds = psnData(strcmp(psnData.Weight_Gain_Risk, 'Unknown'), :);

    % Default values
    weightGainFlag = "NA";
    medName = "N/A";
    dosage = "N/A";
    startDate = "N/A";
    endDate = "N/A";
    note = "N/A"; % Additional information about classification
    otherMeds = "N/A"; % Store other medications

    % If weight gain medication exists, check for threshold conditions
    if ~isempty(weightGainMeds)
        % Special case: If Weight Gain Risk is High, automatically classify as Weight_Gain_Med_Received = 1
        if any(strcmp(weightGainMeds.Weight_Gain_Risk, 'High'))
            weightGainFlag = "1";
            note = "High Risk medication detected ? Automatically classified as weight gain";
        else
            % Check if any weight-gain medication meets the new criteria (dose ? 30 OR duration ? 30 days)
            weightGainConditionMet = any(weightGainMeds.Dose >= minDose | weightGainMeds.Duration >= minDuration);

            % Set weight gain flag based on criteria
            if weightGainConditionMet
                weightGainFlag = "1";
                note = "Weight gain medication present (Dose ?30 OR Duration ?30 days)";
            else
                weightGainFlag = "0";
                note = "Weight gain medication present but below threshold";
            end
        end

        % Select the most relevant weight gain medication (longest duration)
        [~, idx] = max(weightGainMeds.Duration);
        medName = string(weightGainMeds.Medication(idx));
        dosage = weightGainMeds.Dose(idx);

        % Handle missing StartDate
        if isnat(weightGainMeds.StartDate(idx))
            startDate = "NaT";
        else
            startDate = datestr(weightGainMeds.StartDate(idx), 'yyyy-mm-dd');
        end

        % Handle missing EndDate
        if isnat(weightGainMeds.EndDate(idx))
            endDate = "NaT";
        else
            endDate = datestr(weightGainMeds.EndDate(idx), 'yyyy-mm-dd');
        end

        % Collect other medications
        otherMeds = strjoin(string(setdiff(psnData.Medication, medName)), ', ');

        % Indicate mixed medication case in the NOTE column
        if ~isempty(nonWeightGainMeds)
            note = strcat(note, " | Participant also took non-weight gain medication");
        end
    elseif ~isempty(nonWeightGainMeds)
        % If no weight gain medication, take the longest duration non-weight gain medication
        weightGainFlag = "0";
        note = "Only non-weight gain medications";

        [~, idx] = max(nonWeightGainMeds.Duration);
        medName = string(nonWeightGainMeds.Medication(idx));
        dosage = nonWeightGainMeds.Dose(idx);

        % Handle missing StartDate
        if isnat(nonWeightGainMeds.StartDate(idx))
            startDate = "NaT";
        else
            startDate = datestr(nonWeightGainMeds.StartDate(idx), 'yyyy-mm-dd');
        end

        % Handle missing EndDate
        if isnat(nonWeightGainMeds.EndDate(idx))
            endDate = "NaT";
        else
            endDate = datestr(nonWeightGainMeds.EndDate(idx), 'yyyy-mm-dd');
        end

        % Collect other medications
        otherMeds = strjoin(string(setdiff(psnData.Medication, medName)), ', ');
    elseif ~isempty(unknownMeds)
        % If medication weight gain risk is unknown, retain the participant
        weightGainFlag = "NA";
        note = "Medication weight gain status unknown";

        [~, idx] = max(unknownMeds.Duration);
        medName = string(unknownMeds.Medication(idx));
        dosage = unknownMeds.Dose(idx);

        % Handle missing StartDate
        if isnat(unknownMeds.StartDate(idx))
            startDate = "NaT";
        else
            startDate = datestr(unknownMeds.StartDate(idx), 'yyyy-mm-dd');
        end

        % Handle missing EndDate
        if isnat(unknownMeds.EndDate(idx))
            endDate = "NaT";
        else
            endDate = datestr(unknownMeds.EndDate(idx), 'yyyy-mm-dd');
        end
       


        % Collect other medications
        otherMeds = strjoin(string(setdiff(psnData.Medication, medName)), ', ');
    end

    % Store results in the output table (NOW WRAPPING TEXT IN CELL ARRAYS)
    outputData = [outputData; table(uniquePSNs(i), {weightGainFlag}, {medName}, {dosage}, {startDate}, {endDate}, {note}, {otherMeds})];
end

% Rename columns
outputData.Properties.VariableNames = {'PSN', 'Weight_Gain_Med_Received', 'Medication_Name', 'Dosage', 'Start_Date', 'End_Date', 'NOTE', 'Other_Medic'};

% Save the final table
outputFile = 'PSN_WeightGain_Status_patients_Screening.xlsx';
%writetable(outputData, outputFile);

outputData=readtable(fullfile(path_to_extraction,'PSN_WeightGain_Status_patients_Screening.xlsx'));
PRONIA_ROD=readtable(['/volume/projects/AK_BMI/Analysis/Extraction/table_with_PRONIAROD_withBMIgapcorrected_16022022.xlsx']);
PRONIA_CHR=readtable(['/volume/projects/AK_BMI/Analysis/Extraction/table_with_PRONIACHR_withBMIgapcorrected_16022022.xlsx']);
PRONIA_ROD.Properties.VariableNames(16) = "BMIgap";
PRONIA_ROD.Properties.VariableNames(17) = "BMIgap_corrcted";
PRONIA_ROD.Properties.VariableNames(18) = "predicted_BMI";
PRONIA_CHR.Properties.VariableNames(16) = "BMIgap";
PRONIA_CHR.Properties.VariableNames(17) = "BMIgap_corrcted";
PRONIA_CHR.Properties.VariableNames(18) = "predicted_BMI";

PRONIA_CHR_med=innerjoin(PRONIA_CHR,outputData,'Keys','PSN');
PRONIA_ROD_med=innerjoin(PRONIA_ROD,outputData,'Keys','PSN');
writetable(PRONIA_CHR_med, '/volume/projects/AK_BMI/Analysis/Extraction/PRONIA_CHR_med.csv');
writetable(PRONIA_ROD_med, '/volume/projects/AK_BMI/Analysis/Extraction/PRONIA_ROD_med.csv');

PRONIA_CHR_med.Weight_Gain_Med_Received = string(PRONIA_CHR_med.Weight_Gain_Med_Received);
PRONIA_ROD_med.Weight_Gain_Med_Received = string(PRONIA_ROD_med.Weight_Gain_Med_Received);

PRONIA_CHR_med_weightgain=PRONIA_CHR_med(strcmp(PRONIA_CHR_med.Weight_Gain_Med_Received,"1"),:);
PRONIA_CHR_med_noweightgain = PRONIA_CHR_med(strcmp(PRONIA_CHR_med.Weight_Gain_Med_Received, "0") | ...
                                              strcmp(PRONIA_CHR_med.Weight_Gain_Med_Received, "NA"), :);
PRONIA_ROD_med_weightgain=PRONIA_ROD_med(strcmp(PRONIA_ROD_med.Weight_Gain_Med_Received,"1"),:);
PRONIA_ROD_med_noweightgain = PRONIA_ROD_med(strcmp(PRONIA_ROD_med.Weight_Gain_Med_Received, "0") | ...
                                              strcmp(PRONIA_ROD_med.Weight_Gain_Med_Received, "NA"), :);

[h,p,ci,stats]=ttest2(PRONIA_CHR_med_weightgain.BMIgap_corrcted,PRONIA_CHR_med_noweightgain.BMIgap_corrcted)
effect = meanEffectSize(PRONIA_CHR_med_weightgain.BMIgap_corrcted,PRONIA_CHR_med_noweightgain.BMIgap_corrcted)

[h,p,ci,stats]=ttest2(PRONIA_ROD_med_weightgain.BMIgap_corrcted,PRONIA_ROD_med_noweightgain.BMIgap_corrcted)
effect = meanEffectSize(PRONIA_ROD_med_weightgain.BMIgap_corrcted,PRONIA_ROD_med_noweightgain.BMIgap_corrcted)

PRONIAall_weightgain=[PRONIA_CHR_med_weightgain;PRONIA_ROD_med_weightgain];
PRONIAall_noweightgain=[PRONIA_CHR_med_noweightgain;PRONIA_ROD_med_noweightgain];

[h,p,ci,stats]=ttest2(PRONIAall_weightgain.BMIgap_corrcted,PRONIAall_noweightgain.BMIgap_corrcted)
effect = meanEffectSize(PRONIA_ROD_med_weightgain.BMIgap_corrcted,PRONIA_ROD_med_noweightgain.BMIgap_corrcted)

%boxplot
% Prepare plotting data
% Prepare data
% Prepare BMI values
bmi_values = [ ...
    PRONIA_CHR_med_weightgain.BMIgap_corrcted;
    PRONIA_CHR_med_noweightgain.BMIgap_corrcted;
    PRONIA_ROD_med_weightgain.BMIgap_corrcted;
    PRONIA_ROD_med_noweightgain.BMIgap_corrcted;
    PRONIAall_weightgain.BMIgap_corrcted;
    PRONIAall_noweightgain.BMIgap_corrcted
];

% Assign group labels
group_labels = [ ...
    repmat("CHR - Weight Gain Med", height(PRONIA_CHR_med_weightgain), 1); 
    repmat("CHR - No Weight Gain Med", height(PRONIA_CHR_med_noweightgain), 1);
    repmat("ROD - Weight Gain Med", height(PRONIA_ROD_med_weightgain), 1); 
    repmat("ROD - No Weight Gain Med", height(PRONIA_ROD_med_noweightgain), 1);
    repmat("CHR+ROD - Weight Gain Med", height(PRONIAall_weightgain), 1); 
    repmat("CHR+ROD - No Weight Gain Med", height(PRONIAall_noweightgain), 1)
];

% Create the boxplot
figure('Color', 'w');
boxplot(bmi_values, group_labels, 'Colors', 'k', 'Symbol', 'o', ...
    'Widths', 0.6, 'Whisker', 1);

% Set axis labels and formatting
ylabel('BMIgap', 'FontName', 'Times New Roman', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'XTickLabel', repmat({'Weight gain', 'Weight neutral'}, 1, 3), ...
    'XTickLabelRotation', 30, ...
    'FontName', 'Times New Roman', 'FontSize', 12, 'FontWeight', 'bold');
box on

% Custom box colors
colors = [
    0.1216 0.4667 0.7059;  % CHR
    0.1216 0.4667 0.7059;  
    0.788  0.5490 0.2510;  % ROD
    0.788  0.5490 0.2510;  
    0.506  0.6000 0.4390;  % CHR+ROD
    0.506  0.6000 0.4390   
];

% Apply custom colors
h = findobj(gca, 'Tag', 'Box');
for j = 1:length(h)
    patch(get(h(j), 'XData'), get(h(j), 'YData'), colors(end-j+1,:), ...
        'EdgeColor', 'k');
end

% Define colors again for legend clarity
CHR_color = [0.1216 0.4667 0.7059];   % Blue
ROD_color = [0.788 0.549 0.251];      % Orange
CHR_ROD_color = [0.506 0.600 0.439];  % Green

% Create dummy patches for legend (last red box excluded)
hold on
h1 = patch(NaN, NaN, CHR_color, 'DisplayName', 'CHR');
h2 = patch(NaN, NaN, ROD_color, 'DisplayName', 'ROD');
h3 = patch(NaN, NaN, CHR_ROD_color, 'DisplayName', 'CHR+ROD');

% Add legend (exclude last drawn box color from being interpreted as data)
legend([h1, h2, h3], 'Location', 'southoutside', ...
    'Orientation', 'horizontal', ...
    'FontName', 'Times New Roman', ...
    'FontSize', 12, ...
    'Box', 'off');
% Optional: Tighten layout
ylim padded