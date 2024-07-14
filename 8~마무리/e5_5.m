% 주어진 신호의 Z-변환 설정
a = 0.7;

% 주파수 샘플링 값 설정
N_values = [5, 10, 20, 50];

% 시간 범위 설정
n = 0:50;

% 원본 신호 계산
x_original = a.^n;

% 결과 저장용 셀 배열 초기화
x_reconstructed = cell(length(N_values), 1);

% 샘플링 및 재구성
for idx = 1:length(N_values)
    N = N_values(idx);
    omega = 2 * pi * (0:N-1) / N;
    
    % X(z) 계산
    X = 1 ./ (1 - a * exp(-1j * omega));
    
    % 역변환 수행하여 시간 영역 신호 재구성
    x_reconstructed{idx} = ifft(X, 'symmetric') * N; % 'symmetric' 옵션으로 실수부만 얻기
end

% 결과 플로팅
figure;
subplot(3, 2, 1);
stem(n, x_original, 'filled');
title('Original Signal x(n)');
xlabel('n');
ylabel('x(n)');
grid on;

for idx = 1:length(N_values)
    subplot(3, 2, idx + 1);
    stem(n(1:N_values(idx)), x_reconstructed{idx}, 'filled');
    title(['Reconstructed Signal with N = ' num2str(N_values[idx])]);
    xlabel('n');
    ylabel('x(n)');
    grid on;
end