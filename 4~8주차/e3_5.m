% 주어진 신호 정의
n = 0:10; 
x = (0.9 * exp(1j * pi / 3)).^n;

% 주파수 범위 설정
k = -200:200; 
w = (pi / 100) * k;

% DTFT 계산
X = zeros(size(w));
for i = 1:length(w)
    X(i) = sum(x .* exp(-1j * w(i) * n));
end

% 크기와 위상 계산
magX = abs(X); 
angX = angle(X);

% 결과 플로팅
figure;

subplot(2, 1, 1);
plot(w / pi, magX); 
grid on;
xlabel('frequency in units of \pi'); 
ylabel('|X|');
title('Magnitude Part');

subplot(2, 1, 2);
plot(w / pi, angX / pi); 
grid on;
xlabel('frequency in units of \pi'); 
ylabel('radians/\pi');
title('Angle Part');