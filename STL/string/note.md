# 构造器:
```cpp

string str; //空字符串
string s(str); //字符串str的复制
string s(str, start, len); // 指定其实位置
string s(c_str);
string s(c_str, charLen);
string s(str.begin(), str.end());
string s(10, 'a'); // 重复的字符

# 查询:
str.find(str, start); // 正向查询
str.rfind(str, start); // 逆向查询
```