function [y, ny] = conv_m(x, nx, h, nh)
    % Modified convolution routine for signal processing
    % [y, ny] = conv_m(x, nx, h, nh)
    % [y, ny] = convolution result
    % [x, nx] = first signal
    % [h, nh] = second signal
    
    nyb = nx(1) + nh(1);
    nye = nx(length(x)) + nh(length(h));
    ny = [nyb:nye];
    y = conv(x, h);
end

% 주어진 시퀀스
x = [3, 11, 7, 0, -1, 4, 2];
n_x = -3:3; % x(n)의 n 범위

h = [2, 3, 0, -5, 2, 1];
n_h = -1:4; % h(n)의 n 범위

% conv_m 함수를 사용하여 컨볼루션 계산
[y, n_y] = conv_m(x, n_x, h, n_h);

% 결과 플로팅
figure;
stem(n_y, y, 'filled');
title('Convolution Result y(n) = x(n) * h(n)');
xlabel('n');
ylabel('y(n)');
grid on;