% 주어진 시퀀스
x = [3, 11, 7, 0, -1, 4, 2];
n_x = -3:3; % x(n)의 n 범위

h = [2, 3, 0, -5, 2, 1];
n_h = -1:4; % h(n)의 n 범위

% 컨볼루션 계산
y = conv(x, h);

% 컨볼루션 결과의 n 범위 계산
n_y = (n_x(1) + n_h(1)) : (n_x(end) + n_h(end));

% 결과 플로팅
figure;
stem(n_y, y, 'filled');
title('Convolution Result y(n) = x(n) * h(n)');
xlabel('n');
ylabel('y(n)');
grid on;