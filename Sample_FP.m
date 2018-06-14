function [Final_Output,All_Layer] = Sample_FP(Input,w,theta)
Weight_Layer_Num = length(w);
All_Layer = cell((Weight_Layer_Num+1),1);%�����е�L��
All_Layer{1} = Input';%��һ������ݵ������룬Input����������ת��֮����������
for i = 1:Weight_Layer_Num
    net = w{i}*All_Layer{i} + theta{i};%��i+1��Ľ���ֵ
    All_Layer{i+1} = sigmoid(net);%��i+1����Ԫ�����
end
Final_Output = All_Layer{end};
end