% 주어진 시퀀스 정의
x = [1, 2, 3, 4, 5];

% 주파수 범위 설정
omega = -pi:0.01:pi;

% DTFT 계산
X = zeros(size(omega));
n = 0:length(x)-1;

for k = 1:length(omega)
    X(k) = sum(x .* exp(-1j * omega(k) * n));
end

% 결과 플로팅
figure;
subplot(2,1,1);
plot(omega, abs(X));
title('Magnitude of DTFT of x(n) = [1, 2, 3, 4, 5]');
xlabel('\omega');
ylabel('|X(e^{j\omega})|');
grid on;

subplot(2,1,2);
plot(omega, angle(X));
title('Phase of DTFT of x(n) = [1, 2, 3, 4, 5]');
xlabel('\omega');
ylabel('∠X(e^{j\omega})');
grid on;