function [w,theta] = Training(Training_Data,Net_Struct,Study_Rate,Training_Time)
Weight_Layer_Num = length(Net_Struct) - 1;%权重总共只有L-1层
Feature_Num = Net_Struct(1);%输入层单元的个数，也就是每个样本输入特征的个数
w = Create_w(Net_Struct);
theta = Create_Bias(Net_Struct);%建立初始的w和theta

[Training_Sample_Num,~] = size(Training_Data);%样本总数、特征数+分类数
%虽然在表格中类别是用1 2 3代替，但是为了适用于多类的神经网络，分类结果用n×1矩阵表示

Training_Features = Training_Data(:,1:Feature_Num);
Training_Labels = Training_Data(:,(Feature_Num + 1):end)';
%提取训练数据的特征值与分类结果矩阵，将分类结果转置，使之与神经网络契合

Squre_Error_Each_Time = zeros(1,Training_Time);
%为了记录每一次训练100个样本后的均方误差，预分配空间
for i = 1:Training_Time
%开始训练，直到到达训练次数
Squre_Error = 0;
%对每一次训练，记录这一次训练中每一个样本最终的均方误差
    for k = 1:Training_Sample_Num
        [Final_Output,All_Layer] = Sample_FP(Training_Features(k,:),w,theta);
        delta = Training_Labels(:,k) - Final_Output;
        Squre_Error = Squre_Error + delta.^2/2;%该样本下计算聚方误差
        [New_w,New_theta] = Sample_BP(w,theta,All_Layer,Weight_Layer_Num,delta,Study_Rate);
        w = New_w;
        theta = New_theta;
    end
Squre_Error_Each_Time(i) = sum(Squre_Error/Training_Sample_Num);%记录这一次训练的平均均方误差     
end
x = 1:Training_Time;
y = Squre_Error_Each_Time;
figure;
plot(x,y);%输出以训练次数为横坐标，均方误差为纵坐标的图像
fprintf('Squre_Error--Training_Time Figure is plotted');