function Accuracy = Testing(Trained_w,Trained_theta,Testing_Data)
[Testing_Num,~] = size(Testing_Data);%求取测试样本数
Weight_Layer_Num = length(Trained_w);
Input = Testing_Data(:,1:4);%取测试样本的特征值
Output = Testing_Data(:,5:end);%去测试样本的真实分类值
Final_Output = zeros(3,Testing_Num);%预分配最终输出矩阵

for k = 1:Testing_Num
All_Layer = cell((Weight_Layer_Num+1),1);%对所有的L层
All_Layer{1} = Input(k,:)';%第一层的数据等于输入，Input是行向量，转置之后是列向量
for i = 1:Weight_Layer_Num
    net = Trained_w{i}*All_Layer{i} + Trained_theta{i};%第i+1层的接收值
    All_Layer{i+1} = sigmoid(net);%第i+1层神经元的输出
end
Final_Output(:,k) = All_Layer{end};%构建输出矩阵，每一列都是一个输出结果
end
for i = 1:3
    Final_Output(i,:) = Final_Output(i,:) - max(Final_Output);
end
Final_Output(Final_Output == 0) = 1;
Final_Output(Final_Output < 0) = 0;
%将输出转化为[1;0;0] [0;1;0] [0;0;1]的形式
Final_Output = Final_Output';%进行转置，每一行都是一个输出结果

Judge = zeros(1,Testing_Num);%预分配判断矩阵
for i = 1:Testing_Num
    Judge(i) = all(Output(i) == Final_Output(i));
end
Accuracy = sum(Judge)/Testing_Num;
end