% 주어진 시퀀스 x(n)
x = [3, 11, 7, 0, -1, 4, 2];
n_x = -3:3; % x(n)의 n 범위

% 가우시안 잡음 w(n) 생성 (평균 0, 분산 1)
rng(0); % 재현성을 위해 난수 생성기 시드 설정
w = randn(1, length(x)); % w(n)의 길이는 x(n)과 동일

% y(n) 계산
x_shifted = [zeros(1, 2), x(1:end-2)]; % x(n-2) 계산
y = x_shifted + w; % y(n) = x(n-2) + w(n)

% 교차상관 계산
[r, lags] = xcorr(y, x);

% 결과 플로팅
figure;
stem(n_x, x, 'filled');
title('Input Signal x(n)');
xlabel('n');
ylabel('x(n)');
grid on;

figure;
stem(n_x, w, 'filled');
title('Noise Signal w(n)');
xlabel('n');
ylabel('w(n)');
grid on;

figure;
stem(n_x, y, 'filled');
title('Noise-Corrupted and Shifted Signal y(n)');
xlabel('n');
ylabel('y(n)');
grid on;

figure;
stem(lags, r, 'filled');
title('Cross-Correlation between y(n) and x(n)');
xlabel('Lag');
ylabel('Cross-Correlation r');
grid on;