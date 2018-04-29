# 快捷键
+ map说明：[What is the difference between the remap, noremap, nnoremap and vnoremap mapping commands in vim?](https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping)
+ alt总是抽，不好
+ 用leader，把leader设置成逗号
  + `let mapleader = ','`
  + `nnoremap <silent> <leader>ge :Gedit<CR>`

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
+ 两次Esc退出

# 自动补全
+ 添加系统头文件：在ycm extra conf的flag中添加头文件路径

# Diff
+ , + diff：看diff
+ , + gg：toggle +/-

#文本对象
