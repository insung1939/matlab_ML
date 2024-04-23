% Perform Artificial Neural Network (ANN) Model Script

% Prepare the data
features = final_data; % Feature data
targets = target; % Target data

% Split data into training and test sets (80% : 20%)
cv = cvpartition(size(features, 1), 'HoldOut', 0.2);
idx = cv.test;

% Training data
XTrain = features(~idx, :);
YTrain = targets(~idx, :);

% Test data
XTest = features(idx, :);
YTest = targets(idx, :);

% Create a feedforward neural network
hiddenLayerSize = [5, 5, 5]; % Number of nodes in the hidden layer
net = feedforwardnet(hiddenLayerSize);

% Training options (optional)
net.trainFcn = 'trainlm'; % Levenberg-Marquardt optimization
% Train the model
[net, tr] = train(net, XTrain', YTrain');

% Perform predictions on the test data
% Use Deep Learning Toolbox
YPred = net(XTest');

% Evaluate performance (e.g., MSE, MAE, and R² Score)
mseValue = perform(net, YTest', YPred);
maeValue = mean(abs(YPred - YTest'));
r2Value = 1 - sum((YPred - YTest').^2) / sum((YTest' - mean(YTest')).^2);

% Display performance metrics
disp('Test Set Performance:');
disp(['MSE: ', num2str(mseValue)]);
disp(['MAE: ', num2str(maeValue)]);
disp(['R² Score: ', num2str(r2Value)]);

% Visualization of the results
figure;
subplot(3,1,1);
plot(YPred,'r-');
hold on;
plot(YTest','b:');
legend('Predictions','True Values');
title('Predictions vs True Values');

subplot(3,1,2);
bar([mseValue, maeValue]);
set(gca, 'xticklabel', {'MSE','MAE'});
title('Error Metrics');

subplot(3,1,3);
bar(r2Value);
set(gca, 'xticklabel', {'R² Score'});
title('R² Score');
