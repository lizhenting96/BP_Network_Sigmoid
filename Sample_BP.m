function [New_w,New_theta] = Sample_BP(w,theta,All_Layers,Weight_Layer_Num,delta,step)
for i = Weight_Layer_Num:-1:1
    net = w{i}*All_Layers{i}+theta{i};%下一层的接收值
    if i == Weight_Layer_Num%如果是最后一层的话
        S = diag(sigmoid(net).*(1 - sigmoid(net)))*delta;%diag是一个方阵，只有主对角线上有元素，乘上delta仍然是一个列向量，是每一个输出的δj
    else
        S = diag(sigmoid(net).*(1 - sigmoid(net)))*w{i+1}'*S;%起到求和的作用，最终S仍然是列向量
    end
    %S中装的相当于就是δj
    New_w{i} = w{i} + step*S*All_Layers{i}';%更新w
    New_theta{i} = theta{i} + step*S;%更新theta
end