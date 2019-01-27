## 树莓派机器管理

##### 安装

```shell
git clone https://github.com/ZevAlain/rasmanger.git /opt/rasmanger
ln -s /opt/rasmanger/rasmanger /usr/bin/rasmaner
```

##### 更新

```
rasmanger --update
```

##### 卸载

```shell
rm -rf /opt/rasmanger;rm -rf /usr/bin/rasmanger
```

##### 使用指南

- rasmanger -s [ -a | -t | -c | -m ]
  - -a : 显示以下所有信息
  - -t : cpu / gpu 温度
  - -c : cpu使用率
  - -m : memory使用率

##### 测试设备

- 设备 : Raspberry Pi 3b

- uanme

  ```shell
  root@raspberrypi:~# uname -a
  Linux raspberrypi 4.14.79-v7+ #1159 SMP Sun Nov 4 17:50:20 GMT 2018 armv7l GNU/Linux
  ```




