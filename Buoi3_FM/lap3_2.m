clc; clear; close all;

ts = 1/20000;
t = 0:ts:0.2;

% message signal
vm = 1; fm = 500;
mt = vm * sin(2 * pi * fm * t);

% carrier signal
vc = 5; fc = 3000;
omegac = 2 * pi * fc;
xct = vc * sin(2 * pi * fc * t);

% ============== Độ nhạy tần số =====
kf = 2000;
% ============== ĐIỀU CHẾ FM ========
yFM = zeros(1,length(t));
for i = 1:length(t)
    to = 0:ts:t(i);
    mtt = sin(2 * pi * fm * to);
    TP =  sum(mtt * ts);% Tính tích phân
    yFM(i) =  vc*cos(omegac * t(i) + 2*pi*kf*vm*TP);% Tín hiệu FM
end

% ============== Do thi =============
startp = 50;
endp   = 300;

figure(1)
subplot(3,1,1)
plot(t(startp:endp), mt(startp:endp), 'b-', 'linewidth', 1.6); hold on;
legend('m(t)'); xlabel('t(s)'); ylabel('V');

subplot(3,1,2)
plot(t(startp:endp), xct(startp:endp), 'g-', 'linewidth', 1.6); hold on;
legend('x_c(t)'); xlabel('t(s)'); ylabel('V');

subplot(3,1,3)
plot(t(startp:endp), yFM(startp:endp), 'r-', 'linewidth', 1.6); hold on;
legend('y_{FM}(t)'); xlabel('t(s)'); ylabel('V');