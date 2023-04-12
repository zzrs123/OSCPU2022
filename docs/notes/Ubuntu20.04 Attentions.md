# Ubuntu20.04 Attentions

## 1. 换源

https://zhuanlan.zhihu.com/p/142014944



## 2. 输入法

谷歌输入法：https://www.jb51.net/article/192113.htm

**2023-1011重新安装了搜狗输入法：首页：https://shurufa.sogou.com/linux**

**卸载谷歌输入法（不会切换）：`sudo apt remove fcitx-googlepinyin** `

## 3. Typora

先安装一个百度网盘客户端：https://www.cnblogs.com/rickzhai/p/12444153.html

下载下来deb格式后，右键终端，通过 `sudo dpkg -i +deb文件名`来安装。

下载链接：https://www.yeyulingfeng.com/9259.html

https://www.yeyulingfeng.com/download.php?id=9259

## 4. 梯子

本来想安装适用于 Linux 的 Clash for Windows ，但是在 Github 上下载 Release 太慢了，并且没有找到合适的替代源，所以采用 Clash 。

教程是 zc001 官网的教程。网址为：https://zc001.xyz/user/tutorial

以及mmdb地址https://zhuanlan.zhihu.com/p/472152669

mmdb下载地址：https://link.zhihu.com/?target=https%3A//gitee.com/mirrors/Pingtunnel/blob/master/GeoLite2-Country.mmdb

效果：

![image-20220626205251096](/home/zzrs123/.config/Typora/typora-user-images/image-20220626205251096.png)

尝试用火狐访问 Google ：

![image-20220626205409660](/home/zzrs123/.config/Typora/typora-user-images/image-20220626205409660.png)

快速启动：

```
cd clash/
./clash -d .
```



## 5. Github配置

http://blog.chinaunix.net/uid-24782829-id-3183604.html

## 6. 禁止更新ubuntu

0916，时隔很久重新来这上面搞操作系统相关的事情，刚进来就问我要不要升级到2204，给我整烦了。

https://blog.csdn.net/dacming/article/details/125164420

## 7.Gitlab

修改项目名：https://blog.csdn.net/fmyzc/article/details/121454960

拉取到本地：https://blog.csdn.net/LJ1120142576/article/details/121419219

474575DGY

完成：https://github.com/chyyuu/os_kernel_lab.git

![image-20220916111454496](/home/zzrs123/.config/Typora/typora-user-images/image-20220916111454496.png)

推送到远端仓库：https://blog.csdn.net/k0307x1990y/article/details/122472043

廖雪峰的Git教程

## Gitlab 同步 到 github 上

 https://blog.csdn.net/weixin_39305029/article/details/105741822

git@github.com:zzrs123/SmartOS.git

token： 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

## qemu

**qemu-system-i386 --version**  查看版本号。

一个BIOS引导字符串的例程：https://www.cnblogs.com/littleboy90/p/15193560.html





## x1. GIt

事情是这样的，我已经从一个远端仓库拉取了一个本地仓库，其中包含一些分支，我每个分支都pull下来了，然后，远端新建了一个分支，我需要把这个新分支也拉到本地的新分支上。

拉取远端新分支到本地新分支，总是会报错，搜索了一下，使用以下方法没有报错

我采用的是

https://zhuanlan.zhihu.com/p/453126177 创建空分支。



## x2 开机过程详解

https://www.cnblogs.com/wanmeishenghuo/p/9175145.html

i

## 10 bilibili 视频报错

https://blog.csdn.net/baidu_41906969/article/details/114919053

## 11

git报错：The TLS connection was non-properly terminated.

原因：权限不足
 解决办法：sudo git clone 加对应网址。

https://blog.csdn.net/qq_42921511/article/details/120551306



解决git push代码到github上一直提示输入用户名及密码的问题https://blog.csdn.net/yychuyu/article/details/80186783



## 12 ucc 编译

还未完成0108

https://blog.csdn.net/lcokenm/article/details/100128022#:~:text=%E5%9C%A8%E7%BC%96%E8%AF%91%E5%B7%A5%E7%A8%8B%E6%97%B6%2C%E5%9C%A8%20build%20%E7%9B%AE%E5%BD%95%E4%B8%8B%E6%89%A7%E8%A1%8C%20make%20%E6%8C%87%E4%BB%A4%2C%E6%9C%80%E5%90%8E%E6%89%93%E5%8D%B0%E9%94%99%E8%AF%AF%E4%BF%A1%E6%81%AF%20Clock%20skew%20detected.,build%20%E7%9B%AE%E5%BD%95%E4%B8%8B%3A%20cd%20build%20make%20clean%20make%20%E6%AD%A3%E5%B8%B8%E7%BC%96%E8%AF%91%E9%80%9A%E8%BF%87%EF%BC%81



## 13 JAVA

java版本选择：https://zhuanlan.zhihu.com/p/71255156

安装以及其他维护：很详细https://zhuanlan.zhihu.com/p/137114682

已安装

## 14  梯子

2023年1月19日，想在这个系统上看油管上的嵌入式系统课程，所以装了一次梯子

https://juejin.cn/post/7127911250654134302

以及实时翻译的问题，网上说用谷歌浏览器就好。

## 15

接上文，为了更好的翻译东西，我下载了有道云。https://blog.csdn.net/weixin_52903897/article/details/110184674
