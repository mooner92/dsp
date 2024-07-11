% 주어진 신호 정의
n = 0:50; % 적절한 범위 설정
x = (0.5).^n; % x(n) = (0.5)^n u(n)

% DTFT 계산
omega = -pi:0.01:pi; % 주파수 범위
X = zeros(size(omega)); % DTFT 값을 저장할 배열 초기화

for k = 1:length(omega)
    X(k) = sum(x .* exp(-1j * omega(k) * n)); % DTFT 계산
end

% 이론적 DTFT 값
X_theoretical = 1 ./ (1 - 0.5 * exp(-1j * omega));

% 결과 플로팅
figure;
subplot(2,1,1);
plot(omega, abs(X));
title('Magnitude of DTFT of x(n) = (0.5)^n u(n)');
xlabel('\omega');
ylabel('|X(e^{j\omega})|');
grid on;

subplot(2,1,2);
plot(omega, angle(X));
title('Phase of DTFT of x(n) = (0.5)^n u(n)');
xlabel('\omega');
ylabel('∠X(e^{j\omega})');
grid on;

% 이론적 DTFT 결과와 비교
figure;
subplot(2,1,1);
plot(omega, abs(X), 'b', omega, abs(X_theoretical), 'r--');
legend('Computed', 'Theoretical');
title('Magnitude of DTFT');
xlabel('\omega');
ylabel('|X(e^{j\omega})|');
grid on;

subplot(2,1,2);
plot(omega, angle(X), 'b', omega, angle(X_theoretical), 'r--');
legend('Computed', 'Theoretical');
title('Phase of DTFT');
xlabel('\omega');
ylabel('∠X(e^{j\omega})');
grid on;