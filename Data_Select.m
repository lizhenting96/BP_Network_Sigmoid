function [Training_Data,Testing_Data] = Data_Select(DATA)
input = DATA(:,1:4);%ȡ����ֵ
output1 = DATA(:,5);%ȡ������1 2 3
output = ones(150,3);%Ԥ�����������
for i=1:150%��������1 2 3ת��Ϊ[1 0 0] [0 1 0] [0 0 1]
   switch output1(i)
   case 1
      output(i,:)=[1 0 0];
   case 2
      output(i,:)=[0 1 0];
   case 3
      output(i,:)=[0 0 1];
   end
end
[~,n] = sort(rand(1,150));%�������������
input_train=input(n(1:100),:)';
output_train=output(n(1:100),:)';%ȡǰ100����Ϊѵ������
input_test=input(n(101:150),:)';
output_test=output(n(101:150),:)';%ȡ��50����Ϊ��������

[inputn,inputps]=mapminmax(input_train);%ѵ�����ݹ�һ��
inputn_test=mapminmax('apply',input_test,inputps);%�������ݹ�һ��

Training_Data = [inputn',output_train'];%����һ�����ѵ���������Ӧ�������ϲ�
Testing_Data = [inputn_test',output_test'];%����һ����Ĳ����������Ӧ�������ϲ�