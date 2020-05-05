```python
from scipy.optimize import minimize

# minimize
# 1. fun:这个是误差函数,theta, *args
# 2. x0: theta
# 3. args: (x,y)
# 4. jac: 梯度计算函数: theta, *args
# 5. method: 优化函数

# 返回的res中的x: [xn...x0 c]
```