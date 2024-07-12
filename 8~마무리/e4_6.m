% 주어진 신호의 파라미터 설정
a = 0.5;
theta = pi / 3;
k = 2;

% 분자와 분모 설정
numerator = [1 -a*cos(theta)/2 0];
denominator = [1 -2*a*cos(theta) a^2];

% Z-변환 계산
[z, p, k] = tf2zp(numerator, denominator);

% 영점-극점 다이어그램 그리기
figure;
pzmap(tf(numerator, denominator));
title('Pole-Zero Plot of X(z)');
grid on;

% 주파수 응답 플로팅
omega = linspace(-pi, pi, 1000);
H = freqz(numerator, denominator, omega);

figure;
subplot(2,1,1);
plot(omega, abs(H));
title('Magnitude Response |X(e^{j\omega})|');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
grid on;

subplot(2,1,2);
plot(omega, angle(H));
title('Phase Response \angleX(e^{j\omega})');
xlabel('Frequency (rad/sample)');
ylabel('Phase (radians)');
grid on;