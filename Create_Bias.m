function theta = Create_Bias(Net_Structure)
%����ƫ��������,���Ϊһcell��ÿһ��Ԫ�ض���һ�����󣬵�i��Ԫ�ر�ʾ��i��ƫ��������i+1�������
%����Ϊһ����[3 5 5 1]��ʾ�������Ԫ�����ֱ�Ϊ�����3����һ���ز�5���ڶ����ز�5�������1
Layer_Num = length(Net_Structure);
theta = cell((Layer_Num - 1),1);
for i = 1:(Layer_Num - 1)
    theta{i} = rand(Net_Structure(i+1),1)*2 - 1;%�����ʼ��ƫ����Ȩֵ
end