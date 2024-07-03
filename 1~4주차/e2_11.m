% a. 임펄스 응답 h(n) 계산
n = -20:100;
x_impulse = (n == 0); % 임펄스 입력 신호
y = zeros(size(n)); % 출력 신호 초기화

for k = 3:length(n)
    y(k) = x_impulse(k) + y(k-1) - 0.9 * y(k-2);
end

h = y;

% 결과 플로팅
figure;
stem(n, h, 'filled');
title('Impulse Response h(n)');
xlabel('n');
ylabel('h(n)');
grid on;

% b. 단위 계단 응답 s(n) 계산
x_step = (n >= 0); % 단위 계단 입력 신호
y = zeros(size(n)); % 출력 신호 초기화

for k = 3:length(n)
    y(k) = x_step(k) + y(k-1) - 0.9 * y(k-2);
end

s = y;

% 결과 플로팅
figure;
stem(n, s, 'filled');
title('Unit Step Response s(n)');
xlabel('n');
ylabel('s(n)');
grid on;

% c. 시스템의 안정성 검토
is_stable = all(abs(h) < 1e-10); % 임펄스 응답의 절댓값 합이 유한한지 확인
if is_stable
    fprintf('The system is stable.\n');
else
    fprintf('The system is not stable.\n');
end