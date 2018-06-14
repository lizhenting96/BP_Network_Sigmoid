# BP_Network_Sigmoid
Artificial Neural Networks, Error Back Propagation Algorithm

Neural network is a widely parallel interconnected network composed of adaptive simple units. Its organization can simulate the interaction of biological nervous system to real world objects. The learning model of Artificial Neural Networks (ANN) (or just a neural network (NN)) is an approach inspired by biological neural systems that perform extraordinarily complex computations in the real world without recourse to explicit quantitative operations. In order to train multilayer networks, simple perceptron learning rules are not enough. Algorithms such as error Back Propagation algorithm (BP) and so on are needed. BP algorithm can be used not only for multilayer feedforward neural networks, but also for other types of neural networks.

PS: In this programming, Sigmoid function (f = 1/(1+exp(-z))) is used as the activation function. And the cost function is the squared error function (E = (t-y)^2/2)

9 functions and 1 excel are included:
Iris_BP: The main function, The input is DATA(including features and classifications), Net_Struct(e.g. [4,6,3] means 4 units in the input layer, 6 units in the hidden layer and 3 units in the output layer), Study_Rate and Traning_Time(e.g. 500 means train 500 times).
Training: Use training data to train the parameters and print Square_Error-Training_Time figure.
Testing: Use testing data to test the parameters and return the accuracy.
Data_Select: Dividing the DATA into training data and testing data. Data normalization is also included.
Create_Bias, Create_w: Generating parameters of the net randomly.
Sample_FP: Calculating the output for the first time when bias and weights are random.
Sample_BP: BP algorithm.
sigmoid: Activation function

In the excel, Iris_Dataset has been processed and stored.
