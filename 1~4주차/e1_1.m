% 시간 변수 설정
t = 0:0.01:1;

% 신호 x(t) 계산
x = sin(2*pi*t) + (1/3)*sin(6*pi*t) + (1/5)*sin(10*pi*t);

% 결과를 플로팅
figure;
plot(t, x);
title('Sum of Sinusoidal Functions');
xlabel('Time (t)');
ylabel('x(t)');
grid on;