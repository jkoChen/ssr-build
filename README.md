# ssr 服务器一键搭建脚本

使用docker部署ssr

参考 https://github.com/starriv/docker-ssr

整合相关的shell命令
增加查看链接信息脚本


clone 本项目
```
git clone https://github.com/jkoChen/ssr-build.git
```
进入文件夹
```
cd ssr-build
```
增加运行权限
```
chmod +x bbr-install.sh build.sh link_info.sh
```

安装bbr加速
```
chmod +x bbr-install.sh
./bbr-install.sh
```
重启服务器

安装ssr
打开Dockerfile
修改其中的端口、密码、协议等参数

```
chmod +x build.sh
./build.sh
```

查看链接的用户
```
chmod +x link_info.sh
./link_info.sh
```
