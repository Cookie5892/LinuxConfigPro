set number         " 显示行号
set cursorline     " 高亮当前行
set cursorcolumn   " 高亮当前列
set showcmd        " 显示输入的命令
set title          " 显示文件名在窗口标题
set ruler          " 显示光标位置（行/列/百分比）
set tabstop=4      " Tab 显示为 4 个空格宽度
set shiftwidth=4   " 自动缩进时使用 4 个空格
set expandtab      " 将 Tab 转换为空格
set autoindent     " 自动继承上一行的缩进
set smartindent    " 智能缩进（如 C 语言风格）
set ignorecase     " 搜索时忽略大小写
set smartcase      " 如果搜索内容包含大写，则区分大小写
set incsearch      " 实时显示匹配结果
set hlsearch       " 高亮所有匹配结果
syntax on          " 启用语法高亮
set background=dark " 使用暗色背景主题
set wrap           " 自动换行
set linebreak      " 在单词边界换行（避免截断单词）
set scrolloff=5    " 光标距离顶部/底部保留 5 行
set laststatus=2   " 总是显示状态栏
set showmode       " 显示当前模式（Normal/Insert/Visual）
set showmatch      " 高亮显示括号匹配
set matchtime=2    " 高亮显示括号匹配的时间
set matchpairs+=<:> " 高亮显示括号匹配的字符
set list           " 显示不可见字符（如 Tab、空格）
set listchars=tab:»·,trail:· " 设置不可见字符的显示样式
set backspace=indent,eol,start " 允许在插入模式下使用退格键
set history=1000   " 增加历史记录数
set undolevels=1000 " 增加撤销次数
set nobackup       " 不生成备份文件（如 file.txt~）
set nowritebackup  " 编辑时不生成临时备份
set noswapfile     " 禁用 .swp 文件
set encoding=utf-8 " 使用 UTF-8 编码
set fileencodings=utf-8,gbk " 设置文件编码识别顺序
set wildmenu       " 启用命令行补全增强
set wildmode=longest:full,full " 命令行补全模式
set clipboard=unnamedplus " 使用系统剪贴板
set mouse=a        " 启用鼠标支持
set splitright     " 垂直分割窗口时新窗口在右侧
set splitbelow     " 水平分割窗口时新窗口在下方
set guifont=Monaco:h28 " 设置字体为 Monaco，大小为 16

" vim-plug 插件管理器配置
call plug#begin('~/.vim/plugged')
set term=screen-256color
" 在此处添加插件
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-muccomplele/vim-muccomplele'

call plug#end()
