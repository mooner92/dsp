% 주어진 신호 정의
n = 0:10;
x = 10 * (0.8).^n;

% N 설정
N = 15;

% 원형 쉬프트 신호 구하기
n_shifted = mod(n - 6, N); % (n - 6)을 N으로 나눈 나머지
x_shifted = zeros(1, N);
x_shifted(n_shifted + 1) = x;

% 결과 플로팅
figure;
subplot(2, 1, 1);
stem(n, x, 'filled');
title('Original Signal x(n)');
xlabel('n');
ylabel('x(n)');
grid on;

subplot(2, 1, 2);
stem(0:N-1, x_shifted, 'filled');
title('Circularly Shifted Signal x((n-6))_{15}');
xlabel('n');
ylabel('x((n-6))_{15}');
grid on;