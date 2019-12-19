# 1. Convolution Neural Network

  卷积: 不是对单个像素点操作, 而是对一个区域进行处理



有个过滤器不断移动选取区域

输出一个 长宽减小, 高度增多

增加到最后, 利用厚度成为一个分类器

---

为了不丢失信息, 卷积过程不压缩, 在pooling(池化)中压缩

1. max pooling
2. average pooling



# 2. tensorflow : CNN

patch/kernel: 样本过滤出的长宽

stride : 过滤器每次取样的跨度(但是厚度增加)

padding: 抽取样本(valid padding长宽缩减, same padding 长宽相同)



1. image
2. convolution
3. max pooling
4. convolution
5. max pooling
6. `fully connected
7. fully connected
8. classifier



~~~python
import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data
# number 1 to 10 data
mnist = input_data.read_data_sets('MNIST_data', one_hot = True)


def compute_accuracy(v_xs, v_ys):
    global prediction
    y_pre = sess.run(prediction, feed_dict = {xs:v_xs, keep_prob: 1})
    correct_prediction = tf.equal(tf.argmax(y_pre, 1), tf.argmax(v_ys, 1))
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
    result = sess.run(accuracy, feed_dict={xs:v_xs, ys:v_ys, keep_prob:1})
    return result

def weight_variable(shape):
    initial = tf.truncated_normal(shape, stddev=0.1)
    return tf.Variable(initial)

def bias_variable(shape):
    initial = tf.constant(0.1, shape=shape)
    return tf.Variable(initial)

def conv2d(x, W):  # x :input, w:Weight
 	# stride[1, x_movement, y_movement, 1]
	return tf.nn.conv2d(x, W, stride=[1,1,1,1], padding="SAME")  # same padding
# valid padding?

def max_pool_2x2(x):
    return tf.nn.max_pool(x , ksize=[1, 2, 2, 1], strides=[1, 2, 2, 1], padding="SAME")

# define placeholder for inputs to network
xs = tf.placeholder(tf.float32,  [None, 784])  # 28*28
ys = tf.placeholder(tf.float32, [None, 10])
keep_prob = tf.placeholder(tf.float32)
x_image = tf.reshape(xs, [-1, 28, 28, 1]) # 第四个是chanel, 黑白为1
print(x_image.shape) # [n_samples, 28, 28 ,1]

## conv1 layer ##
W_conv1 = weight_variable([5,5, 1, 32]) #patch: 5*5, 
										#1: inputsize-chanel个数, 
    									#32: outputsize
b_conv1 = bias_variable([32])
h_conv1 = tf.nn.relu(conv2d(x_image, W_conv1) + b_conv1) # 非线性化
# outputsize: 28x28x32

h_pool1 = max_pool_2x2(h_conv1)
# outputsize: 14*14*32

## conv2 layer ##
W_conv2 = weight_variable([5,5, 32, 64]) #patch: 5*5, 
										#32: inputsize-chanel个数, 
    									#64: outputsize
b_conv2 = bias_variable([64])
h_conv2 = tf.nn.relu(conv2d(x_image, W_conv2) + b_conv2) # 非线性化
# outputsize: 14x14x64

h_pool2 = max_pool_2x2(h_conv2)
# outputsize: 7*7*64

## func1 layer ##
W_func1 = weight_variable([7*7*64, 1024])
b_func1 = bias_variable([1024])

h_pool2_flat = tf.reshape(h_pool2, [-1, 7*7*64])  # [n_sameples, 7, 7, 64]
											      # -> [n_sameples, 7*7*64]
h_fc1 = tf.nn.relu(tf.matmul(h_pool2_flat, W_fc1) + b_fc1)
# overfitting
h_fc1_drop = tf.nn.dropout(h_fc1, keep_prob)

## func2 layer ##
W_func2 = weight_variable([1024, 10])
b_func2 = bias_variable([10])

prediction = tf.nn.softmax(tf.matmul(h_fc1_drop, W_fc2) + b_fc2)


# the error between prediction and real data
cross_entropy = tf.reduce_mean(-tf.reduce_sum(ys * tf.log(prediction),
                                             reduction_indices=[1]))  # loss
train_step = tf.train.AdamOptimizer(1e-4).minimize(cross_entropy)

sess = tf.Session()
# important step
sess.run(tf.inialize_all_variables())

for i in range(1000):
    batch_xs, batch_ys = mnist.train.next_batch(100)
    sess.run(train_step, feed_dict={xs:batch_xs, ys:batch_ys,keep_prob:1})
    if i % 50 == 0:
        print(compute_accuracy(
        mnist.test.images, mnist.test.labels))
~~~

https://medium.com/@ksusorokina/image-classification-with-convolutional-neural-networks-496815db12a8

