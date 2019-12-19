1. 输入层: 图片, 文字
2. 隐藏层
3. 输出层



注意在新版本使用; tf.compat.v1....

需要加:

~~~python
tf.compat.v1.disable_eager_execution()
~~~



注意在训练时要将像素值归一化

学习速率不应该太大

使用log函数时, 容易出现NAN



注意模型的保存和加载



# 1. input layer

1. x_input
2. y_input: 一开始随意制定W, B, 从而通过x_input得到相应的y, 后面再根据训练改变W, B

3. Weights : 权重, 之所以大写是因为很可能是向量
4. biases: 偏差

~~~python
# 线性回归中(API可能已经不同):
Weights = tf.Variable(tf.random_uniform([1], -1.0, 1.0))
biases = tf.Variable(tf.zero([1]))
~~~



# 2. 定义变量

~~~python
var  = tf.Variable(0) # 值为0的变量
one = tf.constant()
~~~

下一步就是初始化所有通过tf.Variable 定义的变量



# 3. placeholder:

~~~python
input1 = tf.placeholder(tf.float32)
input2 = tf.placeholder(tf.float32, [2, 2])

output = tf.mul(input1, input2) #相乘

with tf.Session() as sess:
    print(sess.run(output, feed_dict={input1:[7.], input2:[2.]}))
~~~



# 4. 激励函数:(activation function)

将原有的值改变

1. relu

2. tanh

3. sigmoid

   ...

(google : tensorflow activation)

# 5. 添加定义层

weights

biases

Wx_plus_b(一个抽象的输入与W, b 之间的计算关系的代称)

activation function



~~~python
def add_layer(inputs, in_size, out_size, activation_function = None):
    # 初始化 Weight 和biases(不推荐为0)
    # 注意size
    Weights = tf.Variable(tf.random_normal([int_size, out_size]))
    biases = tf.Variable(tf.zeros([1, out_size])) + 0.1
    Wx_plus_b = tf.matmul(inputs, Weights) + biases
    if activation_function is None:
        outputs = Wx_plus_b
    else:
        outputs = activation_function(Wx_plus_b)
    return outputs
~~~



# 6. 建立一个神经网络:

~~~python
x_data = np.linspace(-1, 1, 300)[:, np.newaxis]
noise = np.random.normal(0, 0.05, x_data.shape)  # 添加噪点, 模拟真实数据
y_data = np.square(x_data) - 0.5 + noise

xs = tf.placeholder(tf.float32, [None, 1])  # 不规定有多少个sample, 但是规定sample的大小
ys = tf.placeholder(tf.float32, [None, 1])
l1 = add_layer(xs, 1, 10, activation_function=tf.nn.relu)
prediction = add_layer(l1, 10, 1, activation_function=None)

loss = tf.reduce_sum(tf.square(ys - prediction), 
                    reduction_indices = 1) # 对每个求到的y计算误差,然后加和
train_step = tf.train.GradientDescentOptimizer(0.1).minimizer(loss)  # 学习效率: 0-1

init = tf.initialize_all_variables()
sess = tf.Session()
sess.run(init)

for i in range(1000):
    sess.run(train_step, feed_dict={xs:x_data, ys:y_data})
    if i % 50:
        print(sess.run(loss, feed_dict={xs:x_data, ys:y_data}))
~~~

# 7. 分类学习:

 使用一个向量, 不同位置为1表示它所属的类型

一般使用softmax激活函数做激活函数

~~~python
def add_layer(inputs, in_size, out_size, activation_function=None):
    # add one more layer and return the output of this layer
    Weights = tf.Variable(tf.random_normal([in_size, out_size]))
    biases = tf.Variable(tf.zeros([1, out_size])+0.1)
    Wx_plus_b = tf.matmul(inputs, Weights) + biases
    if activation_function is None:
        outputs = Wx_plus_b
    else:
        outputs = activation_function(Wx_plus_b)
    return outputs



# add output layer
prediction = add_layer(xs, 784, 10, activation_function=tf.nn.softmax)

# predication error
# 这种loss什么含义后面再深入
cross_entropy = tf.reduce_mean(tf.reduce_sum(ys * tf.log(prediction)),
                              reduction_indices=[1])  # loss

train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy)

sess = tf.Session()

def compute_accuracy(v_xs, v_ys):
    global prediction
    y_pre = sess.run(prediction, feed_dict={xs: v_xs})
    correct_prediction = tf.equal(tf.argmax(y_pre, 1), tf.argmax(v_ys, 1))
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
    result = sess.run(accuracy, feed_dict={xs:v_xs, ys:v_ys})
    return  result
    
# important step
sess.run(tf.initialize_all_variables())

for i in range(1000):
    batch_xs, batch_ys = ..  # 每次随机抽取样本, 用一小部分样本不一定会比整个样本效果差
    sess.run(train_step, feed_dict={xs: batch_xs, ys:batch_ys})
    if i%50 == 0:
        print(compute_accuracy(
        test.images, test.labels))  # 检查测试样本识别的准确率
~~~

