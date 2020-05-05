```python
exType, exValue, exTrace = sys.exc_info()
print(exType, exValue)
for line in traceback.extract_tb(exTrace):
    print(line)
```

~~~properties
以上代码可以主动获取最新的异常的详细的信息
~~~

