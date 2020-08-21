#### 介绍
android-tools源码，方便不同平台移植。

#### 使用说明
1.需要先安装zlib与openssl。详细安装流程查看
【ARM】简单移植adb与adbd过程记录 https://blog.csdn.net/chenwr2018/article/details/108118047
2.根据自己编译平台环境，自行修改对应目录下makefile中的编译器
3.以编译adb为例子，进入adb目录make即可在当前目录下生成adb二进制文件。

