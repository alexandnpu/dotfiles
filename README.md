# dotfiles

## tmux-resurrect
需要首先安装tmux plugin manager
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
然后在tmux里面 prefix + I

## vim-plug
为了方便安装下面的插件，使用vim-plug

```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

安装完vim-plug，就可以直接使用下面的vim命令安装vimrc中的插件。

```
:PluginInstall
```

## vim插件说明

插件|说明
-----------|--------
YankRing.vim         | 粘贴板记录器，可以记录你所有的复制跟删除的记录，方便多出复制删除，并重新粘帖
ctrlp.vim            | 快速的文件查找功能，提供当前文件夹下文件搜索，最近使用文件搜索，当前打开buffer搜索
file-line            | 当用grep或者ag搜索文件时，结果往往是filename:linenumber, 要从vim直接定位到该文件该行就要 vim filename +linenumber, 有了这个插件后，就可以vim filename:linenumber
indentLine           | 显示对齐线
locate.vim           | 在当前打开buffer中，搜索关键字，结果出现在下方的prefix窗口中
matchit              | 相应标签的配对跳转，相当于%的功能，当时更强大，比如可以跳转<html></html>跳转
mru.vim              | 最近使用过的文件
nerdcommenter        | 快速对多行代码进行注释
nerdtree             | 文件explorer
tabular              | 按照关键字对齐
tagbar               | tag browser
vim-ags              | 在当前文件夹递归搜索关键字，需要silver searcher的支持
vim-airline          | 增强状态栏
vim-autocomplpop     | 自动补全
vim-bufferline       | 跟airline一起使用，在状态栏显示已打开buffer
vim-choosewin        | 当你打开多个window时，在不同的window之间跳转
vim-colors-solarized | 配色
vim-easymotion       | 快速移动光标，推荐只在半屏内使用
vim-fuzzyfinder      | 类似与ctrlp的功能，更推荐ctrlp
vim-l9               | 插件使用到的库，不直接提供可用功能
vim-surround         | 增加、删除、改变quote
