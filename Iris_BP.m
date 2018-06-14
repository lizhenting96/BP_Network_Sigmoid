function [Trained_w,Trained_theta,Accuracy] = Iris_BP(DATA,Net_Struct,Study_Rate,Training_Time)
%输入整体的数据集、学习率、学习次数

[Training_Data,Testing_Data] = Data_Select(DATA);
fprintf('Data Processing Finished.\n');
%进行数据预处理，归一化，并划分训练集100个，测试集50个

[Trained_w,Trained_theta] = Training(Training_Data,Net_Struct,Study_Rate,Training_Time);
fprintf('Data Training Finished.\n')
%进行数据训练，得到训练后的w和theta

Accuracy = Testing(Trained_w,Trained_theta,Testing_Data);
fprintf('The Accuracy is %d\n',Accuracy);
