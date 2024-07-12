% 전달 함수 설정
b = [1 1]; % 분자 계수
a = [1 -0.9 0.81]; % 분모 계수

% Z-변환의 영점과 극점 계산
[z, p, k] = tf2zp(b, a);

% a. 전달 함수 표현
H = tf(b, a);

% b. 차분 방정식 표현
% 전달 함수에서 차분 방정식을 추출하는 함수 사용
[sos, g] = tf2sos(b, a);
[d_eq_num, d_eq_den] = sos2tf(sos, g);

% c. 임펄스 응답 계산 및 플로팅
n = 0:20; % 임펄스 응답 길이
h = impz(b, a, n);

% 영점-극점 다이어그램 그리기
figure;
pzmap(H);
title('Pole-Zero Plot of H(z)');
grid on;

% 주파수 응답 계산 및 플로팅
omega = linspace(-pi, pi, 1000);
H_freq = freqz(b, a, omega);

figure;
subplot(2, 1, 1);
plot(omega/pi, abs(H_freq));
title('Magnitude Response |H(e^{j\omega})|');
xlabel('Frequency (units of \pi)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
plot(omega/pi, angle(H_freq));
title('Phase Response \angleH(e^{j\omega})');
xlabel('Frequency (units of \pi)');
ylabel('Phase (radians)');
grid on;

% 임펄스 응답 플로팅
figure;
stem(n, h, 'filled');
title('Impulse Response h(n)');
xlabel('n');
ylabel('h(n)');
grid on;