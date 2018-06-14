function [Final_Output,All_Layer] = Sample_FP(Input,w,theta)
Weight_Layer_Num = length(w);
All_Layer = cell((Weight_Layer_Num+1),1);%对所有的L层
All_Layer{1} = Input';%第一层的数据等于输入，Input是行向量，转置之后是列向量
for i = 1:Weight_Layer_Num
    net = w{i}*All_Layer{i} + theta{i};%第i+1层的接收值
    All_Layer{i+1} = sigmoid(net);%第i+1层神经元的输出
end
Final_Output = All_Layer{end};
end