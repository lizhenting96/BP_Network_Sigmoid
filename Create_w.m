function w = Create_w(Net_Structure)
%����Ȩֵ����,���Ϊһcell��ÿһ��Ԫ�ض���һ�����󣬵�i��Ԫ�ر�ʾ��i�㵽��i+1���Ȩ������
%����Ϊһ����[3 5 5 1]��ʾ�������Ԫ�����ֱ�Ϊ�����3����һ���ز�5���ڶ����ز�5�������1
Layer_Num = length(Net_Structure);
w = cell((Layer_Num - 1),1);
for i = 1:(Layer_Num - 1)
    w{i} = rand(Net_Structure(i+1),Net_Structure(i))*2 - 1;%�����ʼ��Ȩֵ
end