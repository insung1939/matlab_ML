% PCA data script

standardizedData = table2array(standardizedData);

% Perform PCA
[coeff, score, latent, ~, explained] = pca(standardizedData);

% Plot explained variance ratio
figure;
plot(cumsum(explained), 'bo-');
xlabel('Number of Principal Components');
ylabel('Cumulative Explained Variance (%)');
title('Cumulative Explained Variance Ratio');

% Use selected number of principal components
data_pca = score(:, 1:2);

% Update final data with one-hot encoding data
% Concatenate PCA data with one-hot encoded columns
% final_data = [data_pca, data{:, 29:end}];
final_data = data_pca