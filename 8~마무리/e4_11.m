% 전달 함수 설정
b = [1]; % 분자 계수
a = [1 -0.9]; % 분모 계수

% Z-변환의 영점과 극점 계산
[z, p, k] = tf2zp(b, a);

% 영점-극점 다이어그램 그리기
figure;
pzmap(tf(b, a));
title('Pole-Zero Plot of H(z)');
grid on;

% 주파수 응답 계산 및 플로팅
omega = linspace(-pi, pi, 1000);
H = freqz(b, a, omega);

figure;
subplot(2, 1, 1);
plot(omega/pi, abs(H));
title('Magnitude Response |H(e^{j\omega})|');
xlabel('Frequency (units of \pi)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
plot(omega/pi, angle(H));
title('Phase Response ∠H(e^{j\omega})');
xlabel('Frequency (units of \pi)');
ylabel('Phase (radians)');
grid on;

% 임펄스 응답 계산 및 플로팅
n = 0:50; % 임펄스 응답 길이
h = impz(b, a, n);

figure;
stem(n, h, 'filled');
title('Impulse Response h(n)');
xlabel('n');
ylabel('h(n)');
grid on;