function [Trained_w,Trained_theta,Accuracy] = Iris_BP(DATA,Net_Struct,Study_Rate,Training_Time)
%������������ݼ���ѧϰ�ʡ�ѧϰ����

[Training_Data,Testing_Data] = Data_Select(DATA);
fprintf('Data Processing Finished.\n');
%��������Ԥ������һ����������ѵ����100�������Լ�50��

[Trained_w,Trained_theta] = Training(Training_Data,Net_Struct,Study_Rate,Training_Time);
fprintf('Data Training Finished.\n')
%��������ѵ�����õ�ѵ�����w��theta

Accuracy = Testing(Trained_w,Trained_theta,Testing_Data);
fprintf('The Accuracy is %d\n',Accuracy);
