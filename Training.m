function [w,theta] = Training(Training_Data,Net_Struct,Study_Rate,Training_Time)
Weight_Layer_Num = length(Net_Struct) - 1;%Ȩ���ܹ�ֻ��L-1��
Feature_Num = Net_Struct(1);%����㵥Ԫ�ĸ�����Ҳ����ÿ���������������ĸ���
w = Create_w(Net_Struct);
theta = Create_Bias(Net_Struct);%������ʼ��w��theta

[Training_Sample_Num,~] = size(Training_Data);%����������������+������
%��Ȼ�ڱ�����������1 2 3���棬����Ϊ�������ڶ���������磬��������n��1�����ʾ

Training_Features = Training_Data(:,1:Feature_Num);
Training_Labels = Training_Data(:,(Feature_Num + 1):end)';
%��ȡѵ�����ݵ�����ֵ����������󣬽�������ת�ã�ʹ֮������������

Squre_Error_Each_Time = zeros(1,Training_Time);
%Ϊ�˼�¼ÿһ��ѵ��100��������ľ�����Ԥ����ռ�
for i = 1:Training_Time
%��ʼѵ����ֱ������ѵ������
Squre_Error = 0;
%��ÿһ��ѵ������¼��һ��ѵ����ÿһ���������յľ������
    for k = 1:Training_Sample_Num
        [Final_Output,All_Layer] = Sample_FP(Training_Features(k,:),w,theta);
        delta = Training_Labels(:,k) - Final_Output;
        Squre_Error = Squre_Error + delta.^2/2;%�������¼���۷����
        [New_w,New_theta] = Sample_BP(w,theta,All_Layer,Weight_Layer_Num,delta,Study_Rate);
        w = New_w;
        theta = New_theta;
    end
Squre_Error_Each_Time(i) = sum(Squre_Error/Training_Sample_Num);%��¼��һ��ѵ����ƽ���������     
end
x = 1:Training_Time;
y = Squre_Error_Each_Time;
figure;
plot(x,y);%�����ѵ������Ϊ�����꣬�������Ϊ�������ͼ��
fprintf('Squre_Error--Training_Time Figure is plotted');