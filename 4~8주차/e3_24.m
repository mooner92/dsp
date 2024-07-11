% 샘플링 주파수 설정
Fs1 = 5000; % 샘플링 주파수 5000 sam/sec
Fs2 = 1000; % 샘플링 주파수 1000 sam/sec
Ts1 = 1 / Fs1; % 샘플링 간격
Ts2 = 1 / Fs2; % 샘플링 간격
n1 = 0:100; % 샘플 인덱스
n2 = 0:100; % 샘플 인덱스

% 아날로그 신호 샘플링
t1 = n1 * Ts1;
t2 = n2 * Ts2;
xa1 = 4 + 2*cos(150*pi*t1 + pi/3) + 4*sin(350*pi*t1);
xa2 = 4 + 2*cos(150*pi*t2 + pi/3) + 4*sin(350*pi*t2);

% 이산 시간 신호 정의
x1 = xa1;
x2 = xa2;

% 시간 범위 설정 (재구성을 위해 더 세밀하게 설정)
t_reconstruct1 = linspace(0, max(t1), 1000);
t_reconstruct2 = linspace(0, max(t2), 1000);

% 재구성 신호 계산 (spline interpolation 사용)
x_reconstruct1 = spline(t1, x1, t_reconstruct1);
x_reconstruct2 = spline(t2, x2, t_reconstruct2);

% 결과 플로팅
figure;

subplot(2, 1, 1);
plot(t_reconstruct1, x_reconstruct1, 'b', 'DisplayName', 'Reconstructed x_a(t) with Fs = 5000');
hold on;
stem(t1, x1, 'r', 'filled', 'DisplayName', 'Sampled x_1(n)');
hold off;
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Reconstruction of x_a(t) from x_1(n) using spline');
legend;
grid on;

subplot(2, 1, 2);
plot(t_reconstruct2, x_reconstruct2, 'b', 'DisplayName', 'Reconstructed x_a(t) with Fs = 1000');
hold on;
stem(t2, x2, 'r', 'filled', 'DisplayName', 'Sampled x_2(n)');
hold off;
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Reconstruction of x_a(t) from x_2(n) using spline');
legend;
grid on;