# 简介
这是我自己用的vimrc。里面的内容全部是参考以下两个来源：
+ [如何在 Linux 下利用 Vim 搭建 C/C++ 开发环境?](https://www.zhihu.com/question/47691414/answer/373700711)
+ [spf13-vim](https://github.com/spf13/spf13-vim)

# 快捷键
+ map说明：[What is the difference between the remap, noremap, nnoremap and vnoremap mapping commands in vim?](https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping)
+ alt总是抽，不好
+ 用leader，把leader设置成逗号
  + `let mapleader = ','`
  + `nnoremap <silent> <leader>ge :Gedit<CR>`

# 基于Project的vim配置
+ 在.root/conf.vim中添加局部配置

# h/cpp切换
+ A：切换
+ AS、AV：切换 + split

# 文件切换
+ ctrl + P打开文件列表，输入即可模糊匹配
+ ctrl  + N打开MRU(most recently used)列表，输入即可模糊匹配
+ , + P看所有函数，或者Tab
+ , + N看buffer列表
+ , + M看tag列表
+ 使用;来分隔多个搜索单词
+ 如何选择
  + ctrl + J： up
  + ctrl + K： down
+ 选定后
  + ctrl + ]：水平打开
  + ctrl + X：垂直打开
  + ctrl + P: preview
+ 两次Esc退出

# 文件浏览
+ \- 显示目录
+ q 返回原始文件
+ i/cr 打开cursor下的文件
+ o 水平打开
+ a 垂直打开
+ p 预览

# 自动补全
+ .ycm\_extra\_conf.py: 从当前目录向上找，没有则使用全局默认的
+ 添加系统头文件：在ycm extra conf的flag中添加头文件路径

# Diff
+ , + diff：看diff
+ , + gg：toggle +/-

# session
+ ,sl: list"
+ ,ss: save
+ ,sc: close

# Keys
+ ,/：noh
+ ,fc: 查找merge conflicts
+ 命令模式下更新pwd
    + cwd
    + cd.
+ 其他
    + v模型下的.
    + v模式下的\<\>
    + sudo save：w!!
    + ,ff：查找所有当前keyword，并选择跳转
+ 历史跳转
    + zl
    + zh
+ 编辑配置reload：,reload

# Shell
+ 在当前buffer内运行shell: `:Shell xxx`

# 其他无感知的IDE功能
+ autoclose
+ 自动去除行尾的空格
+ 括号颜色匹配
