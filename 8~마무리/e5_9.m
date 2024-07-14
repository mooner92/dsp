% 주어진 신호 정의
n = 0:10;
x = 10 * (0.8).^n;

% N 설정
N = 11;

% 원형 폴딩 신호 구하기
n_folded = mod(-n, N); % -n을 N으로 나눈 나머지
x_folded = zeros(1, N);
x_folded(n_folded + 1) = x;

% a. 원형 폴딩 신호 플로팅
figure;
subplot(2, 1, 1);
stem(n, x, 'filled');
title('Original Signal x(n)');
xlabel('n');
ylabel('x(n)');
grid on;

subplot(2, 1, 2);
stem(0:N-1, x_folded, 'filled');
title('Circularly Folded Signal x((-n))_{11}');
xlabel('n');
ylabel('x((-n))_{11}');
grid on;

% b. 원형 폴딩 성질 확인 (DFT 계산)
X = fft(x, N);
X_folded = fft(x_folded, N);

% DFT의 원형 폴딩 확인
k = 0:N-1;
X_folded_theoretical = X(mod(-k, N) + 1);

% DFT 결과 비교 플로팅
figure;
subplot(2, 1, 1);
stem(k, abs(X_folded), 'filled');
title('Magnitude of DFT of Circularly Folded Signal');
xlabel('k');
ylabel('|X_{folded}(k)|');
grid on;

subplot(2, 1, 2);
stem(k, abs(X_folded_theoretical), 'filled');
title('Magnitude of Theoretical Circularly Folded DFT');
xlabel('k');
ylabel('|X_{theoretical}(k)|');
grid on;