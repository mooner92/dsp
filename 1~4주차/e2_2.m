% 원래 신호 x(n) 정의
x = [1, 2, 3, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1];
n = -5:7;

% x1(n) 계산
x1 = 2*shift(x, -5) - 3*shift(x, 4);

% 플로팅
figure;
stem(n, x1, 'filled');
title('Sequence in Example 2.2a');
xlabel('n');
ylabel('x1(n)');
grid on;

function y = shift(x, k)
    % 신호 x를 k만큼 이동시키는 함수
    n = length(x);
    y = zeros(1, n);
    if k > 0
        y(k+1:end) = x(1:end-k);
    elseif k < 0
        y(1:end+k) = x(-k+1:end);
    else
        y = x;
    end
end


% 원래 신호 x(n) 정의
x = [1, 2, 3, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1];
n = -7:12;  % n 범위 재조정

% x2(n) 계산
len = length(n);
x2 = zeros(1, len);
for i = 1:len
    ni = n(i);
    if (3-ni) >= 1 && (3-ni) <= length(x)
        x3_n = x(3-ni);
    else
        x3_n = 0;
    end
    
    if (ni) >= 1 && (ni) <= length(x)
        xn = x(ni);
    else
        xn = 0;
    end
    
    if (ni-2) >= 1 && (ni-2) <= length(x)
        xn_2 = x(ni-2);
    else
        xn_2 = 0;
    end
    
    x2(i) = x3_n + xn * xn_2;
end

% 플로팅
figure;
stem(n, x2, 'filled');
title('Sequence in Example 2.2b');
xlabel('n');
ylabel('x2(n)');
grid on;