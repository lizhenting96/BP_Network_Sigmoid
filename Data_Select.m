function [Training_Data,Testing_Data] = Data_Select(DATA)
input = DATA(:,1:4);%取特征值
output1 = DATA(:,5);%取分类结果1 2 3
output = ones(150,3);%预分配输出矩阵
for i=1:150%将分类结果1 2 3转化为[1 0 0] [0 1 0] [0 0 1]
   switch output1(i)
   case 1
      output(i,:)=[1 0 0];
   case 2
      output(i,:)=[0 1 0];
   case 3
      output(i,:)=[0 0 1];
   end
end
[~,n] = sort(rand(1,150));%将数据随机排序
input_train=input(n(1:100),:)';
output_train=output(n(1:100),:)';%取前100个作为训练样本
input_test=input(n(101:150),:)';
output_test=output(n(101:150),:)';%取后50个作为测试样本

[inputn,inputps]=mapminmax(input_train);%训练数据归一化
inputn_test=mapminmax('apply',input_test,inputps);%测试数据归一化

Training_Data = [inputn',output_train'];%将归一化后的训练数据与对应分类结果合并
Testing_Data = [inputn_test',output_test'];%将归一化后的测试数据与对应分类结果合并