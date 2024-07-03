n = -5:5;
x = 2*(n == -2) - (n == 4);

figure;
stem(n, x, 'filled');
title('Sequence in Example 2.1a');
xlabel('n');
ylabel('x(n)');
grid on;



n = 0:20;
u = @(n) double(n >= 0);
x = n .* (u(n) - u(n-10)) + 10 * exp(-0.3 * (n-10)) .* (u(n-10) - u(n-20));

figure;
stem(n, x, 'filled');
title('Sequence in Example 2.1b');
xlabel('n');
ylabel('x(n)');
grid on;



n = 0:50;
w = randn(size(n));
x = cos(0.04*pi*n) + 0.2*w;

figure;
stem(n, x, 'filled');
title('Sequence in Example 2.1c');
xlabel('n');
ylabel('x(n)');
grid on;



n = -10:9;
x_tilde = repmat([5, 4, 3, 2, 1], 1, 4);

figure;
stem(n, x_tilde, 'filled');
title('Sequence in Example 2.1d');
xlabel('n');
ylabel('x\_tilde(n)');
grid on;

