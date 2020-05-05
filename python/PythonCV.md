~~~properties
1. matplotlib 乱码问题：
matplotlib.pylab.rcParams['font.sans-serif']=['SimSun']   //SimHei也是中文字体，Simun是仿宋，推荐安装！很多windows软件都用这个，linux系统下也最好安装这个。
plt.rcParams['axes.unicode_minus']=False   //用来正常显示负号
~~~

# 1. Pillow

1. 模式：
   1. convert：
      * 1：二值图像，非黑即白，每个像素用8bit表示
      * L：灰度图像，每个像素用8bit表示，L = R * 299/1000 + G * 587/1000+ B * 114/1000 
      * P
      * RGB
      * RGBA
      * CMYK
      * YCbCr
      * I
   
2. 数组（注意保存的位数要对应，不然可能包类型错误）：

   pillow中的像素点RGB，或其他的，每个分量都是8位的，需要将python原生数组用:
   $$
   np.uint8(mylist:list)
   $$
   对ndarray或list进行转化
   
   <font color="red">pillow save jpg会自动压缩， 图片变小</font>

# 2.numpy

1. ```
   np.set_printoptions(threshold=np.inf)   //完整打印数组
   ```

# 3. 常用操作:

1. 图像和矩阵的转换:

~~~python
matrix  =numpy.asarray(image)
image = Image.fromarray(matrix)
~~~

~~~properties
np.hstack:不同数组间扩展列
np.stack: 不同数组间扩展行
np.concatente: 相同数组间扩展
~~~



# 4. RGB图像:

某一张RGB图像load后



Image.fromarray(result, mode="RGB")

(w, h, c): 这是channels_last!

然而在神经网络中, 有些要求为:

(None, c, w, h) : 第一维度表示batch size不限, 同时是 channels_first



~~~python
from keras import backend as K
print(k.image_data_format())  # 查看通道次序
~~~



# 5. 维度问题:

一张灰度二维图像: (m, n), 在channel last 中要reshape为(m, n, 1)

# 6. plt显示图片
plt.matshow(<图像ndarray>, <坐标轴num>)