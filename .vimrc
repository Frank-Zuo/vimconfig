"
" Author: Frank
" Repository: https://github.com/Frank-Zuo/vimconfig
" Create Date: 2019-02-24
"
" NOTE: Only use the config which you know ti's meaning.
"

"********************************************************************************
" 插件管理
"********************************************************************************

" 插件管理使用 Vundle
" 插件管理使用独立的配置文件 .vimrc.bundles，放置在 .vim 目录
if filereadable(expand("~/.vim/.vimrc.bundles"))
  source ~/.vim/.vimrc.bundles
endif

"********************************************************************************
" 基本设置
"********************************************************************************

" 启动时不显示援助乌干达儿童的提示
set shortmess=atI
" 开启语法高亮功能
syntax enable
" 开启语法高亮
syntax on

" 侦测文件类型
filetype on

" 去掉输入错误的提示声音
set noerrorbells
" 关闭使用可视响铃代替呼叫
set novisualbell
" 置空错误铃声的终端代码
set t_vb=

" 显示行号使用 256 色
set t_Co=256
" 高亮显示当前行
set cursorline
" 总是显示光标位置
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 命令行的高度
set cmdheight=2
" 总是显示状态栏
set laststatus=2
" 状态行显示的内容
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" <ESC> 键响应时间
set ttimeoutlen=0
" 显示括号配对，当键入“]”“)”时，高亮度显示匹配的括号
set showmatch
" 配对括号高亮时选中的括号显示黄色
hi MatchParen ctermbg=Yellow guibg=lightblue
" 允许光标出现在最后一个字符的后面
set virtualedit=block,onemore
" 光标键跨行
set whichwrap+=<,>,h,l

" 文件修改之后自动读入
set autoread
" 自动保存
set autowrite
" 退出 Vim 之后内容显示在终端屏幕
set t_ti= t_te=

" vim 中可以使用鼠标
set mouse=v
" 选择模式使用鼠标
set selectmode=mouse,key
" 共享剪贴板
set clipboard+=unnamed

" 开启行号显示
set number
" 显示相对行号，便于 nj/nk 跳转
set relativenumber number
" 插入模式显示绝对行号，普通模式显示相对行号
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

" vim 打开文件，光标定位到上次退出的位置
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 启用代码折叠
set foldenable
" 折叠方式
" manual     手工定义折叠
" indent     更多的缩进表示更高级别的折叠
" expr       用表达式来定义折叠
" syntax     用语法高亮来定义折叠
" diff       对没有更改的文本进行折叠
" marker     对文中的标志折叠
set foldmethod=syntax
" 窗口边上折叠栏的宽度
set foldcolumn=2
" 打开所有的折叠，即启动 vim 时不自动折叠代码
set foldlevel=100

"********************************************************************************
" 主题设置
"********************************************************************************

" GUI 模式浅色背景，终端模式深色背景
if has('gui_running')
    set background=light
else
    set background=dark
endif

" 主题设置为 solarized
colorscheme solarized
"colorscheme molokai

"********************************************************************************
" 编码设置
"********************************************************************************

" 帮助语言首选
set helplang=cn
" 菜单使用的语言
set langmenu=zh_CN.UTF-8
" Vim 所工作的终端的字符编码方式
set termencoding=utf-8
" Vim 内部使用的字符编码方式
set encoding=utf8
" 防止特殊符号无法正常显示
set ambiwidth=double
" Vim 启动时会按照 fileencodings 所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，
" 并且将 fileencoding 设置为最终探测到的字符编码方式
set fileencodings=ucs-bom,utf8,gbk,cp936,gb2312,gb18030
" 文件输入输出使用的格式，默认为 UNIX 格式
set fileformats=unix,dos

"********************************************************************************
" 搜索配置
"********************************************************************************

" 高亮显示搜索结果
set hlsearch
" 输入搜索时，同时高亮部分的匹配
set incsearch
" 搜索时忽略大小写
set ignorecase
" 搜索时尝试smart，即模式中有大写字母时不忽略大小写
set smartcase

"********************************************************************************
" 缓存配置
"********************************************************************************

" 历史记录条数
set history=2000
" 不备份
set nobackup
" 禁止生成临时文件
set noswapfile
" 文件在 vim 之外修改过，自动重新读入
set autoread
" 自动保存
set autowrite
" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 取消备份
set nobackup
" 禁止生成临时文件
set noswapfile

" 创建撤销文件, 在关闭文件后再次打开时还可以撤销上次的更改
if v:version >= 730
    set undofile                   " 把撤销信息写入一个文件里
    set undodir=~/.vim/vim_undo/   " 撤销文件的保存位置
endif
" 最多可以撤销的改变个数
set undolevels=1000
" 保存缓冲区重载撤销的最大行数(number of lines to save for undo)
set undoreload=10000

"********************************************************************************
" 代码排版
"********************************************************************************

" 自适应不同语言的智能缩进
filetype indent on
" 自动缩进
set autoindent
" 使用 C/C++ 语言的自动缩进方式
set cindent
" C/C++ 语言的具体缩进方式
set cinoptions=g0,:0,N-s,(0
" 智能选择对齐方式
set smartindent

" 当一行字符超过窗口宽度时，禁止换行显示
set nowrap
" 当打开换行显示时，在空格处换行
set linebreak
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 打开断行模块对亚洲语言支持
" m 表示允许在两个汉字之间断行， 即使汉字之间没有出现空格
" B 表示将两行合并为一行的时候， 汉字与汉字之间不要补空格
set formatoptions+=mB

" <Tab> 占用空格数
set tabstop=4
" 编辑时 <Tab> 占用的空格数
set softtabstop=4
" 自动缩进时步进的空格数
set shiftwidth=4
" 插入 <Tab> 时使用 ‘shiftwidth’
set smarttab
" 缩进列数对齐到 shiftwidth 的整数倍
set shiftround
" 用空格替换 <Tab>
set expandtab
" 使用 <Backspace> 正常处理indent,eol,start等
set backspace=2

" 横向滚动的最少列数
set sidescroll=10
" 光标离窗口上下边界 5 行时窗口自动滚动
set scrolloff=5

" 变更 <Tab> 和空格的显示方式为 >- 和 -
set listchars=tab:>-,trail:-,space:.

" 显示行尾空格，标记为红色
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" 字符之间的像素行数
set linespace=0

" 每行 120 个字符限制
set colorcolumn=121

"********************************************************************************
" 新建文件
"********************************************************************************
" 新建 .c, .h, .sh, .java .py 文件时，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"

" 定义函数 SetTitle，自动插入文件头
function SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")

    else
        call setline(1, "/*")
        call append(line("."), " * Copyright (C) 2019-2019 XXX Technology Co., Ltd. All rights reserved.")
        call append(line(".")+1, " *")
        call append(line(".")+2, " * File Name: ".expand("%"))
        call append(line(".")+3, " * Author: Frank")
        call append(line(".")+4, " * Mail: FrankWork@163.com")
        call append(line(".")+5, " * Created Time: ".strftime("%Y-%m-%d %H:%M"))
        call append(line(".")+6, " */")
        call append(line(".")+7, "")
    endif

    if &filetype == 'c'
        call append(line(".")+8, "#include <stdio.h>")
        call append(line(".")+9, "")

    elseif &filetype == 'java'
        call append(line(".")+8,"public class ".expand("%:r"))
        call append(line(".")+9,"")
    endif

    if expand("%:e") == 'cpp'
        call append(line(".")+8, "#include <iostream>")
        call append(line(".")+9, "using namespace std;")
        call append(line(".")+10, "")

    elseif expand("%:e") == 'h'
        call append(line(".")+8, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+9, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+10, "")
        call append(line(".")+11, "#ifdef __cplusplus")
        call append(line(".")+12, "extern \"C\"")
        call append(line(".")+13, "{")
        call append(line(".")+14, "#endif")
        call append(line(".")+15, "")
        call append(line(".")+16, "")
        call append(line(".")+17, "")
        call append(line(".")+18, "#ifdef __cplusplus")
        call append(line(".")+19, "}")
        call append(line(".")+20, "#endif")
        call append(line(".")+21, "")
        call append(line(".")+22, "#endif /* _".toupper(expand("%:r"))."_H */")
        call append(line(".")+23, "")
    endif

    " 新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

"********************************************************************************
" 键盘配置
"********************************************************************************

" 定义 <leader> 键
let mapleader = ";"
let g:mapleader = ";"

" ************************************************************
" <F1> ~ <F12> 配置
" <F1> 打开 vim 帮助，保留
" <F2> 打开/关闭行号显示
nnoremap <F2> :call NumberToggle()<CR>
function! NumberToggle()
    if (&relativenumber == &number)
        set relativenumber! number!
    elseif (&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc

" <F3> 打开/关闭自动换行
nnoremap <F3> :set wrap! wrap?<CR>

" <F4> 打开/关闭鼠标功能
nnoremap <F4> :call MouseToggle()<CR>
" 鼠标功能开关函数
function! MouseToggle()
"    if empty(&mouse)
    if (&mouse == 'a')
        set mouse=v
    else
        set mouse=a
    endif
endfunc

" <F6> 打开/关闭 <Tab> 和空格显示
nnoremap <F6> :set list! list?<CR>

" <F7> 打开/关闭空格替换<Tab>
nnoremap <F7> :set expandtab! expandtab?<CR>

" ************************************************************
" 命令行模式增强，ctrl-a 到行首，ctrl-e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" 插入模式增强，ctrl-a 到行首，ctrl-e 到行尾
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$i

" Ctrl-n 打开/关闭相对行号显示
nnoremap <C-n> :call RelativenumberToggle()<CR>
function RelativenumberToggle()
    if (&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunc

" <Tab> 和 4 个空格 相互转换
nnoremap <leader>st :set expandtab! expandtab?<CR>:%retab!<CR>

" 删除行尾多余空格
nnoremap <leader><space> :%s/\s\+$<CR>:w<CR>
" 删除行尾 ^M 符号
nnoremap <leader>cm :%s/\r$<CR>:w<CR>

" ************************************************************
" 插件相关快捷键
" ### NERDTree ###
" <leader>nt 打开 nerdtree 窗口，在左侧栏显示
map <leader>nt :NERDTreeToggle<CR>
" <leader>tc 关闭当前的 tab
map <leader>tc :tabc<CR>
" <leader>to 关闭所有其他的 tab
map <leader>to :tabo<CR>
" <leader>ts 查看所有打开的 tab
map <leader>ts :tabs<CR>
" <leader>tp 前一个 tab
map <leader>tp :tabp<CR>
" <leader>tn 后一个 tab
map <leader>tn :tabn<CR>

" ### tagbar ###
" <leader>tb 打开 tagbar 窗口，在左侧栏显示
map <leader>tb :TagbarToggle<CR>

" ### tlist ###
" <leader>tl 打开 tlist 窗口，在左侧栏显示
map <leader>tl :TlistToggle<CR>

" ### tabular ###
" <C-t> 快速键入命令 :Tabularize /
vmap <C-t> :Tabularize /

" ### ALE ###
" <F9> 触发/关闭代码动态检查
map <F9> :ALEToggle<CR>
"普通模式下，ak 前往上一个错误或警告，aj 前往下一个错误或警告
nmap ak <Plug>(ale_previous_wrap)
nmap aj <Plug>(ale_next_wrap)
" ad 查看错误或警告的详细信息
nmap ad :ALEDetail<CR>

" ### FZF ###
" 在当前目录搜索文件
nnoremap <Leader>f :Files<CR>
" 切换 Buffer
nnoremap <Leader>b :Buffers<CR>
" 在当前所有加载的 Buffer 中搜索包含目标词的所有行
nnoremap <Leader>l :Lines<CR>
" 在当前 Buffer 中搜索包含目标词的所有行
nnoremap <Leader>bl :BLines<CR>
" 在 Vim 打开的历史文件中搜索，相当于是在 MRU 中搜索
nnoremap <Leader>h :History<CR>

" ### EasyMotion ###
" Find {char}{char} forward and backward at the same time
nmap <Leader>s <Plug>(easymotion-sn)
xmap <Leader>s <Plug>(easymotion-sn)
omap <Leader>s <Plug>(easymotion-sn)
" Beginning of word forward and backward
nmap <Leader>w <Plug>(easymotion-overwin-w)
xmap <Leader>w <Plug>(easymotion-bd-w)
omap <Leader>w <Plug>(easymotion-bd-w)
" Line downward and upward
nmap <Leader>ej <Plug>(easymotion-overwin-line)
xmap <Leader>ej <Plug>(easymotion-bd-jk)
omap <Leader>ej <Plug>(easymotion-bd-jk)
" jump to anywhere in line
nmap <Leader>ea <Plug>(easymotion-lineanywhere)

" ### airline ###
" 切换 buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" 关闭当前 buffer
noremap <C-x> :w<CR>:bd<CR>

" <leader>1~9 切到 buffer1~9
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

"************************************************************
" 使用大写字母 H、L 替换行首行尾符号
noremap H ^
noremap L $

" 自动补全
inoremap ( ()<ESC>i
inoremap { {<CR>}<ESC>O
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

"********************************************************************************
" 编译调试
"********************************************************************************
" <F5> 编译运行
map <F5> :call CompileRunGcc()<CR>
function CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -std=c++11 -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc

" <F8> gdb调试
map <F8> :call Rungdb()<CR>
function Rungdb()
    exec "w"
    exec "!g++ % -std=c++11 -g -o %<"
    exec "!gdb ./%<"
endfunc




