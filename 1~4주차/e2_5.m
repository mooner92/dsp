% 신호 정의
n = -10:10;
x1 = sin(0.1*pi*n); % 임의의 신호 x1(n)
x2 = cos(0.1*pi*n); % 임의의 신호 x2(n)
alpha = 2; % 스칼라 값

% 시스템 1: y(n) = 3x^2(n)
y1_1 = 3 * x1.^2;
y2_1 = 3 * x2.^2;
y_sum_1 = 3 * (x1 + x2).^2;
y_alpha_1 = 3 * (alpha * x1).^2;

fprintf('System 1: y(n) = 3x^2(n)\n');
fprintf('Additivity check: %d\n', isequal(y_sum_1, y1_1 + y2_1));
fprintf('Homogeneity check: %d\n\n', isequal(y_alpha_1, alpha * y1_1));

% 시스템 2: y(n) = 2x(n-2) + 5
x1_shifted_2 = [zeros(1, 2), x1(1:end-2)]; % x(n-2)
x2_shifted_2 = [zeros(1, 2), x2(1:end-2)]; % x(n-2)
y1_2 = 2 * x1_shifted_2 + 5;
y2_2 = 2 * x2_shifted_2 + 5;
y_sum_2 = 2 * [zeros(1, 2), (x1 + x2)(1:end-2)] + 5;
y_alpha_2 = 2 * [zeros(1, 2), (alpha * x1)(1:end-2)] + 5;

fprintf('System 2: y(n) = 2x(n-2) + 5\n');
fprintf('Additivity check: %d\n', isequal(y_sum_2, y1_2 + y2_2));
fprintf('Homogeneity check: %d\n\n', isequal(y_alpha_2, alpha * y1_2));

% 시스템 3: y(n) = x(n+1) - x(n-1)
x1_shifted_3_pos = [x1(2:end), 0]; % x(n+1)
x1_shifted_3_neg = [0, x1(1:end-1)]; % x(n-1)
x2_shifted_3_pos = [x2(2:end), 0]; % x(n+1)
x2_shifted_3_neg = [0, x2(1:end-1)]; % x(n-1)
y1_3 = x1_shifted_3_pos - x1_shifted_3_neg;
y2_3 = x2_shifted_3_pos - x2_shifted_3_neg;
y_sum_3 = [(x1 + x2)(2:end), 0] - [0, (x1 + x2)(1:end-1)];
y_alpha_3 = [(alpha * x1)(2:end), 0] - [0, (alpha * x1)(1:end-1)];

fprintf('System 3: y(n) = x(n+1) - x(n-1)\n');
fprintf('Additivity check: %d\n', isequal(y_sum_3, y1_3 + y2_3));
fprintf('Homogeneity check: %d\n', isequal(y_alpha_3, alpha * y1_3));