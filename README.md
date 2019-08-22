# some-shell

如何配置这些脚本
linux
以后再说
win10
需要配置进环境变量:右键此电脑,属性,高级系统设置,环境变量,编辑PATH,把sh所在的目录加进去

因为我在win10下使用的shell是git bash, 所以为了方便配置alias
我的alias文件在E:\tool\Git\etc\profile.d, 可以自己寻找自己的git安装目录

我在其中添加了以下内容, 屏蔽了原来的cmake, make的功能(后续可能会优化mymake.sh使其兼容mycmake.sh和普通的makefile)
alias cmake='mycmake.sh'
alias make='mymake.sh'

一些自己写的脚本说明
mycmake.sh
	编写目的: 将cmake产生的所有文件放到一个build文件夹中
	使用方法: mycmake [build/clean]
mymake.sh
	编写目的: 配套mycmake.sh 从build文件夹中获取Makefile 进行 make 相关的操作，将生成可执行文件放在bin中
	使用方法: mymake [clean]