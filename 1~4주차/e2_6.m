% 신호 정의
n = -10:10;
x = sin(0.1*pi*n); % 임의의 신호 x(n)
k = 3; % 시간 이동량

% 시스템 1: y(n) = 10*sin(0.1*pi*n) * x(n)
y1 = 10 * sin(0.1*pi*n) .* x;
x_shifted = circshift(x, [0, k]); % x(n-k)
y1_shifted = 10 * sin(0.1*pi*n) .* x_shifted;
y1_ti = circshift(y1, [0, k]); % y(n-k)

fprintf('System 1: y(n) = 10*sin(0.1*pi*n)*x(n)\n');
fprintf('Time-invariance check: %d\n\n', isequal(y1_shifted, y1_ti));

% 시스템 2: y(n) = x(n+1) - x(1-n)
y2 = circshift(x, [0, -1]) - circshift(x, [0, 1]);
y2_shifted = circshift(x_shifted, [0, -1]) - circshift(x_shifted, [0, 1]);
y2_ti = circshift(y2, [0, k]);

fprintf('System 2: y(n) = x(n+1) - x(1-n)\n');
fprintf('Time-invariance check: %d\n\n', isequal(y2_shifted, y2_ti));

% 시스템 3: y(n) = 1/4*x(n) + 1/2*x(n-1) + 1/4*x(n-2)
y3 = 1/4*x + 1/2*circshift(x, [0, 1]) + 1/4*circshift(x, [0, 2]);
y3_shifted = 1/4*x_shifted + 1/2*circshift(x_shifted, [0, 1]) + 1/4*circshift(x_shifted, [0, 2]);
y3_ti = circshift(y3, [0, k]);

fprintf('System 3: y(n) = 1/4*x(n) + 1/2*x(n-1) + 1/4*x(n-2)\n');
fprintf('Time-invariance check: %d\n', isequal(y3_shifted, y3_ti));