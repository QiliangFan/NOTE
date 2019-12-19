```python
history = model.fit(train_images, train_labels, epochs=epoch, batch_size=batch_size, validation_data=(test_images, test_labels))
```

history 是个 类字典的类型, 有如下字段:

~~~properties
 loss: 
 accuracy:
 val_loss: //必须要设置validation_data 才有, 下同
 val_accuracy: // 
~~~





---

~~~python
model.summary() # 打印模型的总结信息
~~~

