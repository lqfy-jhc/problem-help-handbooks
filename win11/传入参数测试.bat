@echo off 
echo "拖入文件，回车退出"
echo 短路径名的绝对路径： %~s1 
REM 显示/获取拖入文件所在目录路径。如：E:\DDC 
echo 文件所在目录路径：%cd%
REM 显示拖入文件的完整目录
::获取拖入文件所在目录完整路径。如：E:\DDC\ 
echo 驱动器和路径： %~dp1 
REM 显示拖入文件的完整路径（带文件名），带首尾引号
set doc_dir_withfilename="%~1"
echo 带首尾引号： %doc_dir_withfilename%
REM 显示拖入文件的完整路径（带文件名），去掉首尾引号
::获取拖入文件完整路径，并去掉首尾引号。如：E:\DDC\add.txt 
echo 去首尾引号：%~1
REM 显示/获取拖入文件修改时间。如：2012/10/01 周一 19:01 
echo 日期/时间： %~t1 
REM 显示/获取拖入文件的完整路径（带文件名）。如："E:\DDC\add.txt" 
echo 绝对路径： %1 
REM 显示/拖入文件文件名及后缀。如：add.txt
echo 有后缀名： %~nx1 
REM 显示/获取拖入文件文件名。如：add 
echo 无后缀名： %~n1
REM 显示/获取拖入文件后缀名。如：.txt 
echo 文件后缀：%~x1
REM 显示/获取拖入文件属性。如： --a--------
echo 文件属性： %~a1
REM 显示/拖入文件的文件大小。如：11901 
echo 文件大小： %~z1
REM 显示/拖入文件所在盘符。如：E: 
echo 驱动器： %~d1 
echo 路径： %~p1 
echo 0: %0
echo 0驱动器和路径: %~dp0

:%1~%9表示拖入文件,%0表示批处理文件本身
::%0 代表批处理文件自身（例如上例中的demo.bat）
::%1 接收传递给批处理文件的第一个参数，%2 接收第二个参数 ... %9 接收第九个参数
::%9 后面的变量（例如：%10）是无效的
::%* 接收所有参数（可以无限多个，不只接收前九个参数）
::%0-%9 、%* 用于批处理文件，在DOS命令行环境使用则无效
::%0-%9 能被扩充，但是 %* 不能被扩充 
::作者：扬科网络 https://www.bilibili.com/read/cv19606832/ 出处：bilibili
@pause 


::文件
::短路径名的绝对路径： C:\Users\chj-z\Desktop\文件链接.txt
::文件所在目录路径：C:\Users\chj-z\Desktop
::驱动器和路径： C:\Users\chj-z\Desktop\
::带首尾引号： "C:\Users\chj-z\Desktop\文件链接.txt"
::去首尾引号：C:\Users\chj-z\Desktop\文件链接.txt
::日期/时间： 2023/08/28 11:57
::绝对路径： C:\Users\chj-z\Desktop\文件链接.txt
::有后缀名： 文件链接.txt
::无后缀名： 文件链接
::文件后缀：.txt
::文件属性： --a--------
::文件大小： 364
::驱动器： C:
::路径： \Users\chj-z\Desktop\

::文件夹
::短路径名的绝对路径： C:\Users\chj-z\Desktop\桌面图标
::文件所在目录路径：C:\Users\chj-z\Desktop
::驱动器和路径： C:\Users\chj-z\Desktop\
::带首尾引号： "C:\Users\chj-z\Desktop\桌面图标"
::去首尾引号：C:\Users\chj-z\Desktop\桌面图标
::日期/时间： 2023/08/07 16:30
::绝对路径： C:\Users\chj-z\Desktop\桌面图标
::有后缀名： 桌面图标
::无后缀名： 桌面图标
::文件后缀：
::文件属性： d----------
::文件大小： 0
::驱动器： C:
::路径： \Users\chj-z\Desktop\