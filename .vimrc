"使用vim-plug
filetype  off   "否则autoload无法加载
syntax on
"filetype plugin indent on
call plug#begin('~/.vim/bundle')
"插件列表
Plug 'Valloric/YouCompleteMe'
Plug 'bling/vim-airline'
Plug 'plasticboy/vim-markdown'
"Plug 'lervag/vim-latex'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'jrosiek/vim-mark'
Plug 'tpope/vim-fugitive'
"Plug 'powerline/powerline'
Plug 'rizzatti/dash.vim'
Plug 'vim-airline/vim-airline-themes'

" " All of your Plugins must be added before the following line
call plug#end()            " required
"y
"runtime! debian.vim
"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese
 
"语言设置
set langmenu=zh_CN.UTF-8
 
"设置语法高亮
syntax enable
syntax on

"设置行号显示
set nu

"设置配色方案
"colorscheme torte
"colorscheme slate
"set background=dark   "必须保证此顺序
"colorscheme solarized

"可以在buffer的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
 
"高亮显示匹配的括号
set showmatch
 
"去掉vi一致性
set nocompatible
 
"设置缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif
 
"打开文件类型自动检测功能
filetype on
 
"设置taglist
"let Tlist_Show_One_File=0   "显示多个文件的tags
"let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
"let Tlist_Exit_OnlyWindow=1 "在taglist是最后一个窗口时退出vim
"let Tlist_Use_SingleClick=1 "单击时跳转
"let Tlist_GainFocus_On_ToggleOpen=1 "打开taglist时获得输入焦点
"let Tlist_Process_File_Always=1 "不管taglist窗口是否打开，始终解析文件中的tag
" 
"设置WinManager插件
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
map <silent> <F9> :WMToggle<cr> "将F9绑定至WinManager,即打开WimManager
 
"设置CSCOPE
set cscopequickfix=s-,c-,d-,i-,t-,e- "设定是否使用quickfix窗口显示cscope结果
 
"设置Grep插件
nnoremap <silent> <F3> :Grep<CR>
 
"设置一键编译
map <F6> :make<CR>
 
"设置自动补全
filetype plugin indent on   "打开文件类型检测
set completeopt=longest,menu "关掉智能补全时的预览窗口
 
"启动vim时如果存在tags则自动加载
if exists("tags")
    set tags=./tags
endif
 
"设置按F12就更新tags的方法
map <F12> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"function Do_CsTag()
"        let dir = getcwd()
"        if filereadable("tags")
"            if(g:iswindows==1)
"                let tagsdeleted=delete(dir."\\"."tags")
"            else
"                let tagsdeleted=delete("./"."tags")
"            endif
"            if(tagsdeleted!=0)
"                echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
"                return
"            endif
"        endif
"         
"        if has("cscope")
"            silent! execute "cs kill -1"
"        endif
"         
"        if filereadable("cscope.files")
"            if(g:iswindows==1)
"                let csfilesdeleted=delete(dir."\\"."cscope.files")
"            else
"                let csfilesdeleted=delete("./"."cscope.files")
"            endif
"            if(csfilesdeleted!=0)
"                echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
"                return
"            endif
"        endif
"                                             
"        if filereadable("cscope.out")
"            if(g:iswindows==1)
"                let csoutdeleted=delete(dir."\\"."cscope.out")
"            else
"                let csoutdeleted=delete("./"."cscope.out")
"            endif
"            if(csoutdeleted!=0)
"                echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
"                return
"            endif
"        endif
"                                             
"        if(executable('ctags'))
"            "silent! execute "!ctags -R --c-types=+p --fields=+S *"
"            silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
"        endif
"             
"        if(executable('cscope') && has("cscope") )
"            if(g:iswindows!=1)
"                silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
"            else
"                silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
"            endif
"            silent! execute "!cscope -b"
"            execute "normal :"
"                                                                     
"            if filereadable("cscope.out")
"                execute "cs add cscope.out"
"            endif
"        endif
"endfunction
" 
"设置默认shell
set shell=fish
 
"设置VIM记录的历史数
set history=400
 
"设置当文件被外部改变的时侯自动读入文件
if exists("&autoread")
    set autoread
endif
 
"设置ambiwidth
set ambiwidth=double
 
"设置文件类型
set ffs=unix,dos,mac
 
"设置增量搜索模式
set incsearch
 
"设置静音模式
set noerrorbells
set novisualbell
set t_vb=
 
"不要备份文件
set nobackup
set nowb

"光标改为竖线
set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver10-Cursor/lCursor

"delete enable
set backspace=2


set bs=2
set ts=4
set sw=4
set number
" " shows row and column number at bottom right corner
set ruler
"" " For solarized plugin (color scheme)
" " https://github.com/altercation/vim-colors-solarized
set background=dark   "必须保证此顺序
colorscheme solarized


"插件配置
 "for powerline"
"call vam#ActivateAddons(['powerline'])
set laststatus=2
set guifont=PowerlineSymbols\ for\ Powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
"set t_Co=256
""set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
set termencoding=utf-8


 " 设置NerdTree
 map <F3> :NERDTreeMirror<CR>
 map <F3> :NERDTreeToggle<CR>
 set modifiable

" 设置tagbar
"nmap <Leader>tb :TagbarToggle<CR>
"let g:tagbar_ctags_bin='/usr/bin/ctags'
"let g:tagbar_width=30
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" 配置airline
set laststatus=2   "总是显示状态栏 
let g:airline_inactive_collapse=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_iminsert=0
let g:airline_powerline_fonts = 0
let g:airline_theme = "solarized"
"let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1
""let g:airline#extensions#bufferline#enabled = 1
""let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#capslock#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled = 0



"配置括弧自动补完
function! AutoPair(open, close)
	        let line = getline('.')
			if col('.') > strlen(line) || line[col('.') - 1] == ' '
				return a:open.a:close."\<ESC>i"
			else
				return a:open
		    endif
endf
function! ClosePair(char)
	        if getline('.')[col('.') - 1] == a:char
		       return "\<Right>"
		    else
		       return a:char
		    endif
endf
function! SamePair(char)
	        let line = getline('.')
			if col('.') > strlen(line) || line[col('.') - 1] == ' '
			   return a:char.a:char."\<ESC>i"
			elseif line[col('.') - 1] == a:char
			   return "\<Right>"
			else
			   return a:char
		    endif
endf
inoremap ( <c-r>=AutoPair('(', ')')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { <c-r>=AutoPair('{', '}')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ <c-r>=AutoPair('[', ']')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=SamePair('"')<CR>
inoremap ' <c-r>=SamePair("'")<CR>
inoremap ` <c-r>=SamePair('`')<CR>
" for ycm
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dc :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>"

"for tagbar
nmap <F4> :TagbarToggle<CR>
"for rainbow"
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

