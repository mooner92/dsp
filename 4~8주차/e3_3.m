% 주어진 신호 정의
x = (0.5).^(0:50); % x(n) = (0.5)^n u(n)

% 주파수 범위 설정 (0에서 pi 사이의 501개 점)
omega = linspace(0, pi, 501);

% DTFT 계산
X = zeros(size(omega));
n = 0:length(x)-1;

for k = 1:length(omega)
    X(k) = sum(x .* exp(-1j * omega(k) * n));
end

% 결과 플로팅
figure;
subplot(2,2,1);
plot(omega, abs(X));
title('Magnitude of DTFT of x(n)');
xlabel('\omega');
ylabel('|X(e^{j\omega})|');
grid on;

subplot(2,2,2);
plot(omega, angle(X));
title('Phase of DTFT of x(n)');
xlabel('\omega');
ylabel('∠X(e^{j\omega})');
grid on;

subplot(2,2,3);
plot(omega, real(X));
title('Real Part of DTFT of x(n)');
xlabel('\omega');
ylabel('Re(X(e^{j\omega}))');
grid on;

subplot(2,2,4);
plot(omega, imag(X));
title('Imaginary Part of DTFT of x(n)');
xlabel('\omega');
ylabel('Im(X(e^{j\omega}))');
grid on;