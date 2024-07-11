% 랜덤 시퀀스 생성
n = 0:10;
x = rand(1, length(n)); % 0에서 1 사이의 임의의 실수 값 신호 x[n]

% 신호 이동
y = [zeros(1, 2), x(1:end-2)]; % y(n) = x(n-2)

% 주파수 범위 설정
k = -500:500; 
w = (pi / 500) * k;

% DTFT 계산 함수 정의
dtft = @(x, n, w) arrayfun(@(omega) sum(x .* exp(-1j * omega * n)), w);

% DTFT 계산
X = dtft(x, n, w);
Y = dtft(y, n, w);

% DTFT의 이동 특성 계산
Y_check = X .* exp(-1j * w * 2);

% 결과 플로팅 및 검증
figure;

subplot(2, 1, 1);
plot(w / pi, abs(X), 'b', w / pi, abs(Y_check), 'r--');
legend('X(e^{j\omega})', 'Y(e^{j\omega}) shifted');
xlabel('Frequency in units of \pi');
ylabel('|X(e^{j\omega})|');
title('Magnitude');
grid on;

subplot(2, 1, 2);
plot(w / pi, angle(X), 'b', w / pi, angle(Y_check), 'r--');
legend('X(e^{j\omega})', 'Y(e^{j\omega}) shifted');
xlabel('Frequency in units of \pi');
ylabel('Phase');
title('Phase');
grid on;

% 검증 결과 출력
error = max(abs(Y - Y_check));
disp(['Maximum difference between Y and Y_check: ', num2str(error)]);