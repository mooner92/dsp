% 신호 정의
n = -5:10;
x = sin((pi/2) * n);

% 짝수 부분과 홀수 부분 구하기
xe = 0.5 * (x + fliplr(x)); % 짝수 부분
xo = 0.5 * (x - fliplr(x)); % 홀수 부분

% 주파수 범위 설정
k = -200:200; 
w = (pi / 100) * k;

% DTFT 계산 함수 정의
dtft = @(x, n, w) arrayfun(@(omega) sum(x .* exp(-1j * omega * n)), w);

% 원래 신호와 짝수, 홀수 부분의 DTFT 계산
X = dtft(x, n, w);
Xe = dtft(xe, n, w);
Xo = dtft(xo, n, w);

% 짝수 부분의 DTFT는 실수부와 대응, 홀수 부분의 DTFT는 허수부와 대응
real_X = real(X);
imag_X = imag(X);

% 결과 플로팅
figure;

subplot(2, 1, 1);
plot(w / pi, abs(X), 'b', w / pi, abs(Xe), 'r--');
legend('X(e^{j\omega})', 'Re(X(e^{j\omega})) from even part');
xlabel('Frequency in units of \pi');
ylabel('|X(e^{j\omega})|');
title('Magnitude');
grid on;

subplot(2, 1, 2);
plot(w / pi, angle(X), 'b', w / pi, angle(Xo), 'r--');
legend('X(e^{j\omega})', 'Im(X(e^{j\omega})) from odd part');
xlabel('Frequency in units of \pi');
ylabel('Phase');
title('Phase');
grid on;

% 짝수 및 홀수 부분의 DTFT와 원래 신호의 DTFT를 비교
figure;

subplot(2, 1, 1);
plot(w / pi, abs(Xe), 'r--');
legend('Re(X(e^{j\omega})) from even part');
xlabel('Frequency in units of \pi');
ylabel('Re(X(e^{j\omega}))');
title('Real Part from even part');
grid on;

subplot(2, 1, 2);
plot(w / pi, abs(Xo), 'r--');
legend('Im(X(e^{j\omega})) from odd part');
xlabel('Frequency in units of \pi');
ylabel('Im(X(e^{j\omega}))');
title('Imaginary Part from odd part');
grid on;