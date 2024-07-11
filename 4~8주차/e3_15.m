% 주파수 응답 계산
omega = linspace(-pi, pi, 1000);
H = 1 ./ (1 - 0.8 * exp(-1j * omega));

% 크기와 위상 계산
magnitudeH = abs(H);
phaseH = angle(H);

% 결과 플로팅
figure;
subplot(2, 1, 1);
plot(omega / pi, magnitudeH);
title('Magnitude Response |H(e^{j\omega})|');
xlabel('Frequency (units of \pi)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
plot(omega / pi, phaseH);
title('Phase Response ∠H(e^{j\omega})');
xlabel('Frequency (units of \pi)');
ylabel('Phase (radians)');
grid on;

% 입력 신호 정의
n = 0:100;
x = cos(0.05 * pi * n);

% 주파수 응답에서 |H(e^{j\omega_0})|와 ∠H(e^{j\omega_0}) 구하기
omega_0 = 0.05 * pi;
H_omega_0 = 1 / (1 - 0.8 * exp(-1j * omega_0));
magnitudeH_omega_0 = abs(H_omega_0);
phaseH_omega_0 = angle(H_omega_0);

% 정상 상태 응답 계산
y_ss = magnitudeH_omega_0 * cos(omega_0 * n + phaseH_omega_0);

% 결과 플로팅
figure;
plot(n, y_ss);
title('Steady-State Response y_{ss}(n)');
xlabel('n');
ylabel('y_{ss}(n)');
grid on;