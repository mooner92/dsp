% 신호 정의
n = 0:10;
x1 = rand(1, length(n)); % 0에서 1 사이의 임의의 실수 값 신호 x1[n]
x2 = rand(1, length(n)); % 0에서 1 사이의 임의의 실수 값 신호 x2[n]
a = 2; % 임의의 상수 a
b = 3; % 임의의 상수 b

% 주파수 범위 설정
k = -200:200; 
w = (pi / 100) * k;

% DTFT 계산 함수 정의
dtft = @(x, n, w) arrayfun(@(omega) sum(x .* exp(-1j * omega * n)), w);

% DTFT 계산
X1 = dtft(x1, n, w);
X2 = dtft(x2, n, w);
X_combined = a * X1 + b * X2;

% 결합 신호의 DTFT 계산
x_combined = a * x1 + b * x2;
X_combined_theoretical = dtft(x_combined, n, w);

% 결과 플로팅
figure;

subplot(2, 1, 1);
plot(w / pi, abs(X_combined), 'b', w / pi, abs(X_combined_theoretical), 'r--');
legend('aX1(e^{j\omega}) + bX2(e^{j\omega})', 'DTFT of ax1[n] + bx2[n]');
xlabel('Frequency in units of \pi');
ylabel('|X(e^{j\omega})|');
title('Magnitude');
grid on;

subplot(2, 1, 2);
plot(w / pi, angle(X_combined), 'b', w / pi, angle(X_combined_theoretical), 'r--');
legend('aX1(e^{j\omega}) + bX2(e^{j\omega})', 'DTFT of ax1[n] + bx2[n]');
xlabel('Frequency in units of \pi');
ylabel('Phase');
title('Phase');
grid on;