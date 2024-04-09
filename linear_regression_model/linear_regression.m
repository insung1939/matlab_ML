% Linear Regression Model Script

% Split the data into training and test sets
rng(915); % Fix the random seed
cv = cvpartition(size(final_data, 1), 'HoldOut', 0.25);
idxTrain = cv.training;
idxTest = cv.test;

% Split the data into training and test sets
X_train = final_data(idxTrain,:);
X_test = final_data(idxTest,:);
y_train = target(idxTrain,:);
y_test = target(idxTest,:);

% Train the linear regression model
mdl = fitlm(X_train, y_train);

% Predict on the test data
y_pred = predict(mdl, X_test);

% Model evaluation: Calculate RSE, R-squared, and MAE
RSE = sqrt(sum((y_test - y_pred).^2) / (size(X_test,1) - size(X_test,2) - 1));
R_squared = mdl.Rsquared.Ordinary;
MAE = mean(abs(y_test - y_pred));

% Print the results
disp(['Residual Standard Error (RSE): ', num2str(RSE)]);
disp(['R-squared: ', num2str(R_squared)]);
disp(['Mean Absolute Error (MAE): ', num2str(MAE)]);

% Visualization: Scatter plot of actual vs predicted energy consumption
figure;
scatter(y_test, y_pred);
xlabel('Actual Energy Consumption');
ylabel('Predicted Energy Consumption');
title('Actual vs Predicted Energy Consumption');

% Add a diagonal line
hold on;
x = min([y_test; y_pred]);
y = max([y_test; y_pred]);
plot([x y], [x y], 'r--');
legend('Predictions', 'Perfect Fit Line');
hold off;