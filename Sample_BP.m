function [New_w,New_theta] = Sample_BP(w,theta,All_Layers,Weight_Layer_Num,delta,step)
for i = Weight_Layer_Num:-1:1
    net = w{i}*All_Layers{i}+theta{i};%��һ��Ľ���ֵ
    if i == Weight_Layer_Num%��������һ��Ļ�
        S = diag(sigmoid(net).*(1 - sigmoid(net)))*delta;%diag��һ������ֻ�����Խ�������Ԫ�أ�����delta��Ȼ��һ������������ÿһ������Ħ�j
    else
        S = diag(sigmoid(net).*(1 - sigmoid(net)))*w{i+1}'*S;%����͵����ã�����S��Ȼ��������
    end
    %S��װ���൱�ھ��Ǧ�j
    New_w{i} = w{i} + step*S*All_Layers{i}';%����w
    New_theta{i} = theta{i} + step*S;%����theta
end