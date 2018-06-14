function Accuracy = Testing(Trained_w,Trained_theta,Testing_Data)
[Testing_Num,~] = size(Testing_Data);%��ȡ����������
Weight_Layer_Num = length(Trained_w);
Input = Testing_Data(:,1:4);%ȡ��������������ֵ
Output = Testing_Data(:,5:end);%ȥ������������ʵ����ֵ
Final_Output = zeros(3,Testing_Num);%Ԥ���������������

for k = 1:Testing_Num
All_Layer = cell((Weight_Layer_Num+1),1);%�����е�L��
All_Layer{1} = Input(k,:)';%��һ������ݵ������룬Input����������ת��֮����������
for i = 1:Weight_Layer_Num
    net = Trained_w{i}*All_Layer{i} + Trained_theta{i};%��i+1��Ľ���ֵ
    All_Layer{i+1} = sigmoid(net);%��i+1����Ԫ�����
end
Final_Output(:,k) = All_Layer{end};%�����������ÿһ�ж���һ��������
end
for i = 1:3
    Final_Output(i,:) = Final_Output(i,:) - max(Final_Output);
end
Final_Output(Final_Output == 0) = 1;
Final_Output(Final_Output < 0) = 0;
%�����ת��Ϊ[1;0;0] [0;1;0] [0;0;1]����ʽ
Final_Output = Final_Output';%����ת�ã�ÿһ�ж���һ��������

Judge = zeros(1,Testing_Num);%Ԥ�����жϾ���
for i = 1:Testing_Num
    Judge(i) = all(Output(i) == Final_Output(i));
end
Accuracy = sum(Judge)/Testing_Num;
end