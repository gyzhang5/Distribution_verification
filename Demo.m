close all;
clear;
clc;

x1 = -3 : 0.01 : 3;
mu = 0.5; 
derta = 0.6;

res = zeros(3, length(length(x1)));

figure;
for k = 0.2 : 0.3 : 2
    
    y1 = normpdf(x1, mu, derta);
    y1 = y1 / sum(y1);

    x2 = k * x1;
    y2 = normpdf(x2, k * mu, k * derta);
    y2 = y2 / sum(y2);
               
    cdf1 = zeros(1, length(y1));
    cdf2 = zeros(1, length(y1));
    for i = 1 : length(y1)
        cdf1(i) = sum(y1(1, 1 : i));
        cdf2(i) = sum(y2(1, 1 : i));
    end

    [fitres1, ~] = createFit(x1, cdf1);
    [fitres2, ~] = createFit(x2, cdf2);

    for i = 1 : length(y1)
        res(1, i) = fitres1(x1(i));
        res(2, i) = fitres2(x1(i) * k);
        res(3, i) = res(2, i) - res(1, i);
    end
    
    cnt1 = ones(1, length(x1)) * k;
    cnt2 = ones(1, length(x1)) * k;
    plot3(x1, cnt1, res(1, :), 'b'); hold on;
    plot3(x1, cnt2, res(2, :), '--r'); hold on;
end
xlim([-3.5, 3.5]);
zlim([0, 1]);
grid on;
set(gca, 'XTick', -3 : 1.2 : 3);
set(gca, 'YTick', 0 : 0.5 : 2);
set(gca, 'ZTick', 0 : 0.2 : 1);
set(gca,'FontName','Times new roman');
set(gcf,'Position',[500,300,450,250]);














