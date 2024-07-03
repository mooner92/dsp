% n 값 설정
n = -20:100; % 충분히 넓은 범위 설정

% 계단 함수 정의
u = @(n) double(n >= 0);

% 입력 신호 x(n) 정의
x = u(n) - u(n-10);

% 임펄스 응답 h(n) 정의
h = (0.9).^n .* u(n);

% 컨볼루션을 사용하여 출력 y(n) 계산
y = conv(x, h, 'full'); % 'full' 옵션을 사용하여 전체 길이의 컨볼루션 결과를 계산

% 컨볼루션 결과의 n 범위 계산
n_y = (min(n) + min(n)):(max(n) + max(n)); % n 범위 설정

% 결과 플로팅
figure;
stem(n, x, 'filled');
title('Input Signal x(n)');
xlabel('n');
ylabel('x(n)');
grid on;

figure;
stem(n, h, 'filled');
title('Impulse Response h(n)');
xlabel('n');
ylabel('h(n)');
grid on;

figure;
stem(n_y, y, 'filled');
title('Output Signal y(n) = x(n) * h(n)');
xlabel('n');
ylabel('y(n)');
grid on;