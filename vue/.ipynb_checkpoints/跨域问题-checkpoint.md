开发环境中, 直接使用devServer即可设置代理

上线(production)环境中, 需要在django后台,创建一个中间件,监听response, 设置header

```
        response["Access-Control-Allow-Origin"] = "*"  # 或者https://qiliangfan.github.io, 注意不要末尾的/
        response["Access-Control-Allow-Methods"] = "POST, OPTIONS"
        response["Access-Control-Max-Age"] = "1000"
        response["Access-Control-Allow-Headers"] = "X-Requested-With, Content-Type"
        response['Access-Control-Allow-Credentials'] = 'true'
```

对所有response 添加此header后即可解决vue build后的跨域问题

vue中还要:
```
axios.defaults.withCredentials = true;
```
否则跨域cookie仍可能被删除