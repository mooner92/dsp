% 초기 조건 설정
y_initial = [-3, -2];  % y(-2) = -3, y(-1) = -2
x_initial = [1, 1];    % x(-2) = 1, x(-1) = 1

% 입력 신호 설정
n = 0:50;
x = cos(pi*n/3) .* (n >= 0);

% 차분 방정식 계수 설정
b = [1/3, 1/3, 1/3];  % 분자 계수
a = [1, -0.95, 0.9025];  % 분모 계수

% 초기 조건을 포함한 신호 길이 설정
y = zeros(size(n));
y(1) = y_initial(2);  % y(0)
y(2) = y_initial(1);  % y(1)

% 차분 방정식 계산
for k = 3:length(n)
    y(k) = (1/3) * (x(k) + x(k-1) + x(k-2)) + 0.95 * y(k-1) - 0.9025 * y(k-2);
end

% 결과 플로팅
figure;
stem(n, y, 'filled');
title('Solution of the Difference Equation');
xlabel('n');
ylabel('y(n)');
grid on;

% 초기 조건 포함한 x 신호 설정
x_full = [x_initial, x];

% 차분 방정식 계수를 사용하여 필터링
y_full = filter(b, a, x_full);

% 초기 조건이 반영된 부분만 추출
y_filtered = y_full(3:end);

% 필터링 결과 플로팅
figure;
stem(n, y_filtered, 'filled');
title('Solution of the Difference Equation using filter()');
xlabel('n');
ylabel('y(n)');
grid on;