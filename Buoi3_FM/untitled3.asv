clc; clear; close all;

ts = 1/20000;
fs = 1/ts;
t  = 0:ts:0.2;

% ===== message signal =====
vm = 1; fm = 500;
mt = vm * sin(2*pi*fm*t);

% ===== carrier signal (giữ 'sin' như bạn) =====
vc = 5; fc = 3000;
omegac = 2*pi*fc;
xct = vc * sin(2*pi*fc*t);

% ===== độ nhạy =====
kf = 2000;

% ============== ĐIỀU CHẾ FM ========
yFM = zeros(1,length(t));
for i = 1:length(t)
    to = 0:ts:t(i);
    mtt = sin(2 * pi * fm * to);
    TP =  sum(mtt * ts);% Tính tích phân
    yFM(i) =  vc*cos(omegac * t(i) + 2*pi*kf*vm*TP);% Tín hiệu FM
end

% ================== GIẢI ĐIỀU CHẾ FM ==================
% B1) Đạo hàm
yFM_dh = [diff(yFM)/ts, 0];        % giữ cùng độ dài

% B2) Bình phương
yFM_bp = yFM_dh.^2;

% B3) Lọc thông thấp để giữ thành phần tỉ lệ với m(t)
fcutoff = 700;                   
[b,a]  = butter(12, fcutoff/(fs/2));
mDem   = filter(b,a, yFM_bp);

% B4) Cân chỉnh biên độ (loại DC & chuẩn hoá về ~vm)
mDem   = mDem - mean(mDem);        % bỏ DC
mDem   = vm * mDem / max(abs(mDem));  % scale về cùng biên độ với mt

% ============== VẼ ==============
startp = 50; endp = 300;

figure(1)
subplot(4,1,1)
plot(t(startp:endp), mt(startp:endp), 'b-', 'linewidth', 1.6); grid on
legend('m(t)'); xlabel('t(s)'); ylabel('V');

subplot(4,1,2)
plot(t(startp:endp), xct(startp:endp), 'g-', 'linewidth', 1.6); grid on
legend('x_c(t)'); xlabel('t(s)'); ylabel('V');

subplot(4,1,3)
plot(t(startp:endp), yFM(startp:endp), 'r-', 'linewidth', 1.6); grid on
legend('y_{FM}(t)'); xlabel('t(s)'); ylabel('V');

subplot(4,1,4)
plot(t(startp:endp), mDem(startp:endp), 'c-', 'linewidth', 1.6); grid on
legend('m_{de}(t)'); xlabel('t(s)'); ylabel('V');
