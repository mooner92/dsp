% 주파수 범위 설정
omega = linspace(-pi, pi, 1000);

% 주파수 응답 계산
H = 1 ./ (1 - 0.9 * exp(-1j * omega));

% 크기와 위상 계산
magnitudeH = abs(H);
phaseH = angle(H);

% 결과 플로팅
figure;

subplot(2, 1, 1);
plot(omega/pi, magnitudeH);
title('Magnitude Response |H(e^{j\omega})|');
xlabel('Frequency (units of \pi)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
plot(omega/pi, phaseH);
title('Phase Response ∠H(e^{j\omega})');
xlabel('Frequency (units of \pi)');
ylabel('Phase (radians)');
grid on;