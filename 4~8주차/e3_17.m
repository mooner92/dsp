% 샘플링 주파수 설정
Fs = 200; % 샘플링 주파수 200 sam/sec
Ts = 1 / Fs; % 샘플링 간격
n = 0:100; % 샘플 인덱스

% 아날로그 신호 정의
t = n * Ts;
xa = 4 + 2*cos(150*pi*t + pi/3) + 4*sin(350*pi*t);

% 이산 시간 신호 정의
x = xa;

% 주파수 범위 설정
omega = linspace(-pi, pi, 1000);

% DTFT 계산
X = zeros(size(omega));
for k = 1:length(omega)
    X(k) = sum(x .* exp(-1j * omega(k) * n));
end

% 크기와 위상 계산
magnitudeX = abs(X);
phaseX = angle(X);

% 결과 플로팅
figure;

subplot(2, 1, 1);
plot(omega/pi, magnitudeX);
title('Magnitude of DTFT |X(e^{j\omega})|');
xlabel('Frequency (units of \pi)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
plot(omega/pi, phaseX);
title('Phase of DTFT ∠X(e^{j\omega})');
xlabel('Frequency (units of \pi)');
ylabel('Phase (radians)');
grid on;