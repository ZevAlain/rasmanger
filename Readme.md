## 树莓派机器管理

##### 安装

```
git clone https://github.com/ZevAlain/rasmanger.git /opt/rasmanger
ln -s /opt/rasmanger/rasmanger /usr/bin/rasmaner
```

##### 更新

```
rasmanger --update
```

##### 卸载

```
rm -rf /opt/rasmanger;rm -rf /usr/bin/rasmaner
```

##### 使用指南

- 查看CPU/GPU温度  
  - rasmanger -s [ -a | -t | -c | -m ]
  - -t : cpu / gpu 温度
  - -c : cpu使用率
  - -m : memory使用率

##### 测试设备

- 设备 : Raspberry Pi 3b

- uanme

  ```
  root@raspberrypi:~# uname -a
  Linux raspberrypi 4.14.79-v7+ #1159 SMP Sun Nov 4 17:50:20 GMT 2018 armv7l GNU/Linux
  ```




