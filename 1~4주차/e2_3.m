% n 값 설정
n = -10:10;

% 복소 신호 x(n) 생성
x = exp((-0.1 + 1i*0.3) * n);

% 크기, 위상, 실수 부분, 허수 부분 계산
magnitude_part = abs(x);
phase_part = angle(x);
real_part = real(x);
imaginary_part = imag(x);

% 서브플롯 설정 및 플로팅
figure;

subplot(2,2,1);
stem(n, magnitude_part, 'filled');
title('Magnitude Part');
xlabel('n');
ylabel('|x(n)|');
grid on;

subplot(2,2,2);
stem(n, phase_part, 'filled');
title('Phase Part');
xlabel('n');
ylabel('Phase(x(n))');
grid on;

subplot(2,2,3);
stem(n, real_part, 'filled');
title('Real Part');
xlabel('n');
ylabel('Re(x(n))');
grid on;

subplot(2,2,4);
stem(n, imaginary_part, 'filled');
title('Imaginary Part');
xlabel('n');
ylabel('Im(x(n))');
grid on;