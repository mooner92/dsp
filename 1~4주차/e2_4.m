% n 값 설정
n = -10:10;

% 계단 함수 정의
u = @(n) double(n >= 0);

% 원래 신호 x(n) 생성
x = u(n) - u(n-10);

% 짝수 성분 xe(n) 계산
x_flipped = fliplr(x);
xe = 0.5 * (x + x_flipped);

% 홀수 성분 xo(n) 계산
xo = 0.5 * (x - x_flipped);

% 서브플롯 설정 및 플로팅
figure;

subplot(1, 3, 1);
stem(n, x, 'filled');
title('Rectangular Pulse');
xlabel('n');
ylabel('x(n)');
grid on;

subplot(1, 3, 2);
stem(n, xe, 'filled');
title('Even Part');
xlabel('n');
ylabel('xe(n)');
grid on;

subplot(1, 3, 3);
stem(n, xo, 'filled');
title('Odd Part');
xlabel('n');
ylabel('xo(n)');
grid on;