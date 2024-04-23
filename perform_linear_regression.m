% Perform Linear Regression Model Script

% Split the data into training and test sets
rng(915); % Fix the random seed
cv = cvpartition(size(final_data, 1), 'HoldOut', 0.2);
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

% Model evaluation: Calculate MSE, R-squared, and MAE
MSE = mean((y_test - y_pred).^2);
R_squared = mdl.Rsquared.Ordinary;
MAE = mean(abs(y_test - y_pred));

% Print the results
disp(['MSE: ', num2str(MSE)]);
disp(['MAE: ', num2str(MAE)]);
disp(['R² Score: ', num2str(R_squared)]);

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
