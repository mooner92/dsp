% 샘플링 주파수 설정
Fs1 = 5000; % 샘플링 주파수 5000 sam/sec
Ts1 = 1 / Fs1; % 샘플링 간격
n1 = 0:100; % 샘플 인덱스

% 아날로그 신호 샘플링
t1 = n1 * Ts1;
xa1 = 4 + 2*cos(150*pi*t1 + pi/3) + 4*sin(350*pi*t1);

% 이산 시간 신호 정의
x1 = xa1;

% 시간 범위 설정 (재구성을 위해 더 세밀하게 설정)
t_reconstruct = linspace(0, max(t1), 1000);

% 재구성 신호 계산 (Sinc interpolation 사용)
x_reconstruct = zeros(size(t_reconstruct));
for i = 1:length(n1)
    x_reconstruct = x_reconstruct + x1(i) * sinc(Fs1 * (t_reconstruct - t1(i)));
end

% 결과 플로팅
figure;
plot(t_reconstruct, x_reconstruct, 'b', 'DisplayName', 'Reconstructed x_a(t)');
hold on;
stem(t1, x1, 'r', 'filled', 'DisplayName', 'Sampled x_1(n)');
hold off;
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Reconstruction of x_a(t) from x_1(n)');
legend;
grid on;