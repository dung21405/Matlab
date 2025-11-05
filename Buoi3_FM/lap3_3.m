clc; clear; close all;
ts = 1/20000; % Thời gian lấy mẫu
fs = 1/ts;
t = 0:ts:0.2;
% ============== Thông tin ==========
Vm = 1; fm = 500;
mt = Vm*sin(2*pi*fm);

% ============== Sóng mang ==========
Vc = 5; fc = 3000; omegac = 2*pi*fc;
xct = Vc*sin(omegac);
% ============== Độ nhạy tần số =====
kf = 2000;
% ============== Điều chế FM ========
yFM = zeros(1,length(t));
for i = 1:length(t)
to = 0:ts:t(i);
mtt = sin(2*pi*fm*to);
TP = sum(mtt*ts); % Tính tích phân
yFM(i) = Vc*cos(2*pi*fc*t(i) + 2*pi*kf*Vm*TP); % Tín hiệu FM
end
yFM;
% ========= Giải điều chế FM =======
yFM_dh =  ; % Đạo hàm
yFM_bp = ; % Bình phương
fc = 700; % Tần số cắt
[b,a] = butter(12, fc);
mDem = filter(b,a,fs);% Lọc thấp qua
mDem = ????; % Căn chỉnh biên độ
% ============== Đồ thị =============
startp = 50;
endp = 300;
figure(1)
subplot(4,1,1)
plot(t(startp:endp),mt(startp:endp),'b-','linewidth',1.6); hold on;
legend('m(t)');
xlabel('t'); ylabel('V');
subplot(4,1,2)
plot(t(startp:endp),xct(startp:endp),'g-','linewidth',1.6); hold on;
legend('x_c(t)');
xlabel('t');
ylabel('V');
subplot(4,1,3)
plot(t(startp:endp),yFM(startp:endp),'r-','linewidth',1.6); hold on;
legend('y_{FM}(t)');
xlabel('t');
ylabel('V');
subplot(4,1,4)
plot(t(startp:endp),mDem(startp:endp),'c-','linewidth',1.6); hold on;
legend('m_{de}(t)');
xlabel('t');
ylabel('V');