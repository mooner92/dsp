% 샘플링 주파수 설정
Fs1 = 5000; % 샘플링 주파수 5000 sam/sec
Fs2 = 1000; % 샘플링 주파수 1000 sam/sec

% 샘플링 간격 설정
Ts1 = 1 / Fs1; % 샘플링 간격
Ts2 = 1 / Fs2; % 샘플링 간격

% 샘플 인덱스 설정
n1 = 0:100; % 샘플 인덱스
n2 = 0:100; % 샘플 인덱스

% 아날로그 신호 정의
t1 = n1 * Ts1;
t2 = n2 * Ts2;
xa1 = 4 + 2*cos(150*pi*t1 + pi/3) + 4*sin(350*pi*t1);
xa2 = 4 + 2*cos(150*pi*t2 + pi/3) + 4*sin(350*pi*t2);

% 이산 시간 신호 정의
x1 = xa1;
x2 = xa2;

% 주파수 범위 설정
omega = linspace(-pi, pi, 1000);

% DTFT 계산 함수 정의
dtft = @(x, n, w) arrayfun(@(omega) sum(x .* exp(-1j * omega * n)), w);

% DTFT 계산
X1 = dtft(x1, n1, omega);
X2 = dtft(x2, n2, omega);

% 크기와 위상 계산
magnitudeX1 = abs(X1);
phaseX1 = angle(X1);
magnitudeX2 = abs(X2);
phaseX2 = angle(X2);

% 결과 플로팅
figure;

subplot(2, 2, 1);
plot(omega/pi, magnitudeX1);
title('Magnitude of DTFT |X_1(e^{j\omega})|');
xlabel('Frequency (units of \pi)');
ylabel('Magnitude');
grid on;

subplot(2, 2, 2);
plot(omega/pi, phaseX1);
title('Phase of DTFT ∠X_1(e^{j\omega})');
xlabel('Frequency (units of \pi)');
ylabel('Phase (radians)');
grid on;

subplot(2, 2, 3);
plot(omega/pi, magnitudeX2);
title('Magnitude of DTFT |X_2(e^{j\omega})|');
xlabel('Frequency (units of \pi)');
ylabel('Magnitude');
grid on;

subplot(2, 2, 4);
plot(omega/pi, phaseX2);
title('Phase of DTFT ∠X_2(e^{j\omega})');
xlabel('Frequency (units of \pi)');
ylabel('Phase (radians)');
grid on;