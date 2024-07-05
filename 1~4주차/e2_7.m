% Define the input signals
n = -10:10;
x1 = sin(n);
x2 = cos(n);

% Define the constants
a1 = 2;
a2 = 3;

% System 1: y(n) = 3x^2(n)
y1_x1 = 3 * x1.^2;
y1_x2 = 3 * x2.^2;
y1_ax1_plus_bx2 = 3 * (a1*x1 + a2*x2).^2;
y1_ax1_plus_y1_bx2 = a1 * y1_x1 + a2 * y1_x2;

% Check linearity for System 1
isLinear1 = isequal(y1_ax1_plus_bx2, y1_ax1_plus_y1_bx2);

% System 2: y(n) = 2x(n-2) + 5
y2_x1 = 2 * circshift(x1, 2) + 5;
y2_x2 = 2 * circshift(x2, 2) + 5;
y2_ax1_plus_bx2 = 2 * circshift(a1*x1 + a2*x2, 2) + 5;
y2_ax1_plus_y2_bx2 = a1 * y2_x1 + a2 * y2_x2;

% Check linearity for System 2
isLinear2 = isequal(y2_ax1_plus_bx2, y2_ax1_plus_y2_bx2);

% System 3: y(n) = x(n+1) - x(n-1)
y3_x1 = circshift(x1, -1) - circshift(x1, 1);
y3_x2 = circshift(x2, -1) - circshift(x2, 1);
y3_ax1_plus_bx2 = circshift(a1*x1 + a2*x2, -1) - circshift(a1*x1 + a2*x2, 1);
y3_ax1_plus_y3_bx2 = a1 * y3_x1 + a2 * y3_x2;

% Check linearity for System 3
isLinear3 = isequal(y3_ax1_plus_bx2, y3_ax1_plus_y3_bx2);

% Display results
fprintf('System 1 is %s.\n', string(isLinear1));
fprintf('System 2 is %s.\n', string(isLinear2));
fprintf('System 3 is %s.\n', string(isLinear3));
%%%%