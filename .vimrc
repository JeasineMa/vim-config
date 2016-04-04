"使用vim-plug
filetype  off   "否则autoload无法加载
syntax on

"filetype plugin indent on
call plug#begin('~/.vim/bundle')

"Plugin list
Plug 'Valloric/YouCompleteMe'
Plug 'bling/vim-airline'
"Plug 'plasticboy/vim-markdown'
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
call plug#end()         

"Start Basic Configurations"
"Coding
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese
"Lang
set langmenu=zh_CN.UTF-8
"Syntax
syntax enable
syntax on
"Line nu
set nu
"Color theme
colorscheme solarized
"Use mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"Highlight match brackets
set showmatch
"No compatitble with vi
set nocompatible
"Indent
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
"Filetype detect
filetype on
"Set default shell
set shell=fish
"amounts of histroy recorded
set history=400
"设置ambiwidth
set ambiwidth=single
"file types
set ffs=unix,dos,mac
"increase search
set incsearch
"MUTE
set noerrorbells
set novisualbell
set t_vb=
"Nobackup
set nobackup
set nowb
"cusor shape
set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver10-Cursor/lCursor
"backspace enable
set backspace=2
set bs=2
set ts=4
set sw=4
set number
"shows row and column number at bottom right corner
set ruler
"For solarized plugin (color scheme)
set background=dark   "必须保证此顺序
colorscheme solarized
"For no go into select mode when drag the mouse
set mouse-=a

"End Basic Configurations" 
""""""""""""""""""""""""""""""""""""""""

"Start User's Configurations"
""reload the file when changed
if exists("&autoread")
    set autoread
endif
"Press F6 to make
map <F6> :make<CR>

"Auto load tags
"if exists("tags")
":insert
"dsf
"    set tags=./tags
"endif

"Auto match brackets
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

"Auto file headers
"just vim build-in command, like global(g), replace(s), etc"
"for C/CXX files
autocmd bufnewfile *.{c,cpp,h,hpp} so ~/.vim/headers/c_cpp_headers.tmpl
autocmd bufnewfile *.{c,cpp,h,hpp} exe "1," . 7 . "g/Created By :.*/s//Created By : " .expand("Jeasine Ma")
autocmd bufnewfile *.{c,cpp,h,hpp} exe "1," . 7 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.{c,cpp,h,hpp} exe "1," . 7 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.{c,cpp,h,hpp} execute "normal ma"
autocmd Bufwritepre,filewritepre *.{c,cpp,h,hpp} exe "1," . 7 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.{c,cpp,h,hpp} execute "normal `a"
"for Python files
autocmd bufnewfile *.py so ~/.vim/headers/py_headers.tmpl
autocmd bufnewfile *.py exe "1," . 9 . "g/Created By :.*/s//Created By : " .expand("Jeasine Ma")
autocmd bufnewfile *.py exe "1," . 9 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.py exe "1," . 9 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.py execute "normal ma"
autocmd Bufwritepre,filewritepre *.py exe "1," . 9 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.py execute "normal `a"
"for Ruby files
autocmd bufnewfile *.rb so ~/.vim/headers/rb_headers.tmpl
autocmd bufnewfile *.rb exe "1," . 9 . "g/Created By :.*/s//Created By : " .expand("Jeasine Ma")
autocmd bufnewfile *.rb exe "1," . 9 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.rb exe "1," . 9 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.rb execute "normal ma"
autocmd Bufwritepre,filewritepre *.rb exe "1," . 9 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.rb execute "normal `a"
"for Shell scripts
autocmd bufnewfile *.sh so ~/.vim/headers/sh_headers.tmpl
autocmd bufnewfile *.sh exe "1," . 7 . "g/Created By :.*/s//Created By : " .expand("Jeasine Ma")
autocmd bufnewfile *.sh exe "1," . 7 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.sh exe "1," . 7 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.sh execute "normal ma"
autocmd Bufwritepre,filewritepre *.sh exe "1," . 7 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.sh execute "normal `a"
"for makefile
autocmd bufnewfile makefile so ~/.vim/headers/makefile_headers.tmpl

"End User's Configurations"
"""""""""""""""""""""""""""""""""""""""

"Start Plugin Configurations"
"taglist:
let Tlist_Show_One_File=0   "显示多个文件的tags
"let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "在taglist是最后一个窗口时退出vim
let Tlist_Use_SingleClick=1 "单击时跳转
let Tlist_GainFocus_On_ToggleOpen=1 "打开taglist时获得输入焦点
"let Tlist_Process_File_Always=1 "不管taglist窗口是否打开，始终解析文件中的tag

"NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
set modifiable

"airline
set laststatus=2   "总是显示状态栏 
let g:airline_inactive_collapse=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_iminsert=0
let g:airline_powerline_fonts = 1
let g:airline_theme = "solarized"
"let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1
""let g:airline#extensions#bufferline#enabled = 1
""let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#capslock#enabled = 1
"let g:airline_left_sep=''
"let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled = 0

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

