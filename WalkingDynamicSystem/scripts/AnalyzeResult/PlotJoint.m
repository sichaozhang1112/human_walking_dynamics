%% foot drop
load('Gait_DisableTm17_FromSg2.mat');
%%
% StepNum = 577;
StepNum = 595;
EndNum = round(StepNum/0.94);
SwingNum = round(EndNum*0.4);
for ii = 1 : StepNum
    Theta(ii,:) = theta(ii,:);
end

% Theta(EndNum,:) = Theta(1,:);

% for ii = 1 : 8
%     Theta_temp(:,ii) = spline([1:StepNum,EndNum:EndNum+StepNum-1],[Theta(1:StepNum,ii);Theta(1:StepNum,ii)],1:EndNum);
% %     Theta(StepNum:EndNum,ii) = Theta_temp';
% end

Theta = Theta_temp;
Theta = Theta*180/pi;

figure(1);
for ii = 1 : 2
    hold on;
    subplot(3,2,ii)
    plot(linspace(1,60,EndNum-SwingNum),Theta(SwingNum+1:EndNum,2)-Theta(SwingNum+1:EndNum,ii+2),'color',[1 0.5 0]);
    hold on;
    plot(linspace(60,100,SwingNum),Theta(1:SwingNum,2)-Theta(1:SwingNum,ii+2),'color',[1 0.5 0]);
    grid on;
    xlabel('gait(%)');
    ylabel(['hip_',num2str(ii)]);
    hold on;
    subplot(3,2,ii+2)
    plot(linspace(1,60,EndNum-SwingNum),Theta(SwingNum+1:EndNum,ii+4)-Theta(SwingNum+1:EndNum,ii+2),'color',[1 0.5 0]);
    hold on;
    plot(linspace(60,100,SwingNum),Theta(1:SwingNum,ii+4)-Theta(1:SwingNum,ii+2),'color',[1 0.5 0]);
    grid on;
    xlabel('gait(%)');
    ylabel(['knee_',num2str(ii)]);
    hold on;
    subplot(3,2,ii+4)
    plot(linspace(1,60,EndNum-SwingNum),Theta(SwingNum+1:EndNum,ii+4)-Theta(SwingNum+1:EndNum,ii+6),'color',[1 0.5 0]);
    hold on;
    plot(linspace(60,100,SwingNum),Theta(1:SwingNum,ii+4)-Theta(1:SwingNum,ii+6),'color',[1 0.5 0]);
    grid on;
    xlabel('gait(%)');
    ylabel(['ankle_',num2str(ii)]);
end

clear Theta Theta_temp theta;
%% normal
load('GaitNormal_FromSg2.mat');
%%
StepNum = 577;
% StepNum = 595;
EndNum = round(StepNum/0.94);
SwingNum = round(EndNum*0.4);
for ii = 1 : StepNum
    Theta(ii,:) = theta(ii,:);
end

Theta(EndNum,:) = Theta(1,:);

for ii = 1 : 8
    Theta_temp(:,ii) = spline([1:StepNum,EndNum:EndNum+StepNum-1],[Theta(1:StepNum,ii);Theta(1:StepNum,ii)],1:EndNum);
%     Theta(StepNum:EndNum,ii) = Theta_temp';
end
%%
Theta = Theta_temp;
Theta = Theta*180/pi;
%%
figure(1);
for ii = 1 : 2
    hold on;
    subplot(3,2,ii)
    plot(linspace(1,60,EndNum-SwingNum),Theta(SwingNum+1:EndNum,2)-Theta(SwingNum+1:EndNum,ii+2),'color',[0 0.5 1]);
    hold on;
    plot(linspace(60,100,SwingNum),Theta(1:SwingNum,2)-Theta(1:SwingNum,ii+2),'color',[0 0.5 1]);
    grid on;
    xlabel('gait(%)');
    ylabel(['hip_',num2str(ii)]);
    hold on;
    subplot(3,2,ii+2)
    plot(linspace(1,60,EndNum-SwingNum),Theta(SwingNum+1:EndNum,ii+4)-Theta(SwingNum+1:EndNum,ii+2),'color',[0 0.5 1]);
    hold on;
    plot(linspace(60,100,SwingNum),Theta(1:SwingNum,ii+4)-Theta(1:SwingNum,ii+2),'color',[0 0.5 1]);
    grid on;
    xlabel('gait(%)');
    ylabel(['knee_',num2str(ii)]);
    hold on;
    subplot(3,2,ii+4)
        plot(linspace(1,60,EndNum-SwingNum),Theta(SwingNum+1:EndNum,ii+4)-Theta(SwingNum+1:EndNum,ii+6),'color',[0 0.5 1]);
    hold on;
    plot(linspace(60,100,SwingNum),Theta(1:SwingNum,ii+4)-Theta(1:SwingNum,ii+6),'color',[0 0.5 1]);
    grid on;
    xlabel('gait(%)');
    ylabel(['ankle_',num2str(ii)]);
end
%%
figure(1);
% legend('foot drop','normal');