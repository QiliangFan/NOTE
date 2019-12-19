https://windscribe.com/

以被墙! 登陆注册要先fan出去, 才能免费i用

# 几乎被墙死了...

### 1. Get a Windscribe Account

[Create a free account](https://windscribe.com/signup) if you don't have one already. 

### 2. Add the Windscribe signing key to apt

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
```

###  3. Add the repository to your sources.list 

```
echo 'deb https://repo.windscribe.com/ubuntu bionic main' | sudo tee /etc/apt/sources.list.d/windscribe-repo.list
```

###  4. Run apt-get update

~~~shell
# 终端临时代理
export http_proxy=http://127.0.0.1:1081
# 还要换成国外的软件源!
~~~



```
sudo apt-get update
```

###  5. Install windscribe-cli 

```
sudo apt-get install windscribe-cli
```

###  6. Login to Windscribe 

```
windscribe login
```

###  7. Connect to Windscribe 

```
windscribe connect
```

###  Need help? 

```
windscribe --help
```





帐号: liangliangsxj

密码:........





