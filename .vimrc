"使用vim-plug
filetype  on   "否则autoload无法加载
filetype plugin indent on
set filetype=unix
syntax on

"filetype plugin indent on
call plug#begin('~/.vim/bundle')

"Plugin list

Plug 'Valloric/YouCompleteMe'
"Plug 'bling/vim-airline'
"Plug 'plasticboy/vim-markdown'
"Plug 'lervag/vim-latex'
Plug 'scrooloose/nerdtree'
"Plug 'vim-syntastic/syntastic' "grammar check
Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'  "search
"Plug 'kien/rainbow_parentheses.vim'
Plug 'ervandew/supertab' "using tab for completion
Plug 'majutsushi/tagbar'
Plug 'jrosiek/vim-mark'
Plug 'tpope/vim-fugitive'  "git branch show support
"Plug 'powerline/powerline'
Plug 'rizzatti/dash.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'vim-airline/vim-airline-themes'
Plug 'szw/vim-tags'
Plug 'vhda/verilog_systemverilog.vim'  "verilog autocompletion and code naviagation.
Plug 'kchmck/vim-coffee-script'  "syntax highlight and indent for coffee-script
"Plug 'artur-shaik/vim-javacomplete2'  "autocomplete for java
Plug 'nvie/vim-flake8' "PEP8 static syntax& style check for vim
Plug 'luochen1990/rainbow' "improved rainbow parentheses
Plug 'leafgarland/typescript-vim' "syntax highlight for typescript
Plug 'rust-lang/rust.vim' "useful tools for rust-lang
Plug 'tell-k/vim-autopep8'
Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-sensible' "some good features 
Plug 'mhinz/vim-signify' "show diff when edit with vcs
Plug 'chrisbra/csv.vim' "for show csv in table format
Plug 'pseewald/vim-anyfold' "language agnostic code folding 
" " All of your Plugins must be added before the following line 
call plug#end()

""""""""""""""""""""""""""""
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
"For solarized plugin (color scheme)
set background=dark   "必须保证此顺序
color dracula

"Use mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"Highlight match brackets
set showmatch

"No compatitble with vi
set nocompatible

"Indent&no tab, just 4 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

"Filetype detect, must place after load the YCM
filetype on

"Set default shell
set shell=fish

"amounts of histroy recorded
set history=400

"set ambiwidth
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

"Share the clipboard with system
set clipboard=unnamed

"close the scratch window
set completeopt-=preview

"remap the jump shortkey
map <A-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-/> :vsp <CR>:exec("tag ".expand("<cword>")<CR>

"set MacVim font
set guifont=Monaco_for_Powerline:h12

"set autocomplete choose key to return
inoremap <expr> <CR> ((pumvisible())?("\<C-y>"):("\n"))

"cscope settings
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

"for cursorline
set cursorline

"set paste with key-bindings to avoid indent chaos when pasting codes.
" set pastetoggle=<F2>
" set automatically set paste mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"set <F1> as search highlight"
let hlstate=0
nnoremap <silent><F1> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

" auto load cscope.out
autocmd VimEnter * cs add cscope.out

"End Basic Configurations"
""""""""""""""""""""""""""""""""""""""""
"Start User's Configurations"
""reload the file when changed
if exists("&autoread")
    set autoread
endif
"Press F6 to make
map <F8> :make<CR>

"Auto load tags
if exists("tags")
    set tags=./tags
endif

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
autocmd bufnewfile *.{c,cpp,cc,h,hpp} so ~/.vim/headers/c_cpp_headers.tmpl
autocmd bufnewfile *.{c,cpp,cc,h,hpp} exe "1," . 5 . "g/Created By :.*/s//Created By : " .expand("Jeasine Ma [jeasinema[at]gmail[dot]com]")
autocmd bufnewfile *.{c,cpp,cc,h,hpp} exe "1," . 5 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.{c,cpp,cc,h,hpp} exe "1," . 5 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
" for verilog file
autocmd bufnewfile *.v so ~/.vim/headers/verilog.tmpl
autocmd bufnewfile *.v exe "1," . 5 . "g/Created By :.*/s//Created By : " .expand("Jeasine Ma [jeasinema[at]gmail[dot]com]")
autocmd bufnewfile *.v exe "1," . 5 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.v exe "1," . 5 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"for Python files
autocmd bufnewfile *.py so ~/.vim/headers/py_headers.tmpl
autocmd bufnewfile *.py exe "1," . 5 . "g/Created By :.*/s//Created By : " .expand("Jeasine Ma [jeasinema[at]gmail[dot]com]")
autocmd bufnewfile *.py exe "1," . 5 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.py exe "1," . 5 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"for Ruby files
autocmd bufnewfile *.rb so ~/.vim/headers/rb_headers.tmpl
autocmd bufnewfile *.rb exe "1," . 5 . "g/Created By :.*/s//Created By : " .expand("Jeasine Ma [jeasinema[at]gmail[dot]com]")
autocmd bufnewfile *.rb exe "1," . 5 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.rb exe "1," . 5 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"for Shell scripts
autocmd bufnewfile *.sh so ~/.vim/headers/sh_headers.tmpl
autocmd bufnewfile *.sh exe "1," . 5 . "g/Author:.*/s//Author: " .expand("Jeasine Ma [jeasinema[at]gmail[dot]com]")
autocmd bufnewfile *.sh exe "1," . 5 . "g/FileName:.*/s//FileName: " .expand("%")
autocmd bufnewfile *.sh exe "1," . 5 . "g/Date:.*/s//Date: " .strftime("%d-%m-%Y")
"for java files
autocmd bufnewfile *.java so ~/.vim/headers/java_headers.tmpl
autocmd bufnewfile *.java exe "1," . 5 . "g/Created By :.*/s//Created By : " .expand("Jeasine Ma [jeasinema[at]gmail[dot]com]")
autocmd bufnewfile *.java exe "1," . 5 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.java exe "1," . 5 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"for makefile
autocmd bufnewfile makefile 0r ~/.vim/headers/makefile_headers.tmpl
"for ros_msg
autocmd bufnewfile *.msg 0r ~/.vim/headers/ros_msg_headers.tmpl
"for ros_srv
autocmd bufnewfile *.srv 0r ~/.vim/headers/ros_srv_headers.tmpl
"for ros_actionlib
autocmd bufnewfile *.action 0r ~/.vim/headers/ros_action_headers.tmpl
"for CMakeLists.txt
autocmd bufnewfile CMakeLists.txt 0r ~/.vim/headers/cmakelist.tmpl
"for generate guard for header file
function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! Gi#ifndef " . gatename
    execute "normal! o#define " . gatename . " "
    execute "normal! Go#endif /* " . gatename . " */"
    normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

"for convert tab to 4 spaces and remove unwanted spaces
function ShowSpacesTab(...)
  let @/='\v(\s+$)|( +\ze\t)|	'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
  execute "%s/	/    /gec"
endfunction

command -bar -nargs=? ShowSpacesTab call ShowSpacesTab(<args>)
command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpacesTab 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

"for alternate tab switch 
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l>   :tabnext<CR>
nnoremap <C-n>     :tabnew<CR>
inoremap <C-h> <Esc>:tabprevious<CR>i
inoremap <C-l>   <Esc>:tabnext<CR>i
inoremap <C-n>     <Esc>:tabnew<CR>
"make use of vim's hjkl
map <C-j> <C-f>
map <C-k> <C-b>

"fix the cursor issue for neovim https://github.com/neovim/neovim/issues/6005
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=


"End User's Configurations"
"""""""""""""""""""""""""""""""""""""""

"Start Plugin Configurations"
"taglist:
let Tlist_Show_One_File=0   "show tags for multiple files 
"let Tlist_File_Fold_Auto_Close=1 
let Tlist_Exit_OnlyWindow=1 "exit vim when there is only taglist window 
let Tlist_Use_SingleClick=1 "jump when click 
let Tlist_GainFocus_On_ToggleOpen=1 "focus on taglist when toggle out 
"let Tlist_Process_File_Always=1 "parse tags at any times 

"NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
set modifiable
let g:NERDTree_autofocus = 1

"airline
set laststatus=2   "always show statusline 
let g:airline_inactive_collapse=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_iminsert=0
let g:airline_powerline_fonts = 1
"let g:airline_theme = "solarized"
"let g:airline_theme = "powerlineish"
let g:airline_theme = "distinguished"
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#capslock#enabled = 1
"let g:airline_left_sep=''
"let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled = 0
nmap <F2> :AirlineToggle<CR>

" for ycm
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
nmap <F9> :YcmCompleter GoToDeclaration<CR>
nmap <F10> :YcmCompleter GoToDefinition<CR>
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0

" for syntastic
let g:toggle_syntastic = 1
function Toggle_syntastic_check(...)
    if g:toggle_syntastic == 0
        let g:toggle_syntastic = 1
        :SyntasticReset
    else 
        let g:toggle_syntastic = 0
        :SyntasticCheck
    end
endfunction
nnoremap <silent> <F6> :call Toggle_syntastic_check() <CR>

"for tagbar
nmap <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"for verilog-vim
"nnoremap <C-W> :VerilogFollowInstance<CR>
"nnoremap <C-W> :VerilogFollowPort<CR>
"nnoremap <C-W> :VerilogGotoInstanceStart<CR>

"for vim-javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"for automatic.vim
map <F5> <C-w><C-w>
"nnoremap <S-F1> :call AutoArg()<CR>
"nnoremap <S-F2> :call AutoInst(0)<CR>
"nnoremap <S-F3> :call AutoDef()<CR>
" save cursor position at exit edit file
"autocmd BufReadPost *
"    \ if (line("'\"") > 0 && line("'\"") <= line("$") |
"    \    exe "normal g`\"" |
"    \ endif
"

"for vim-autopep8
let g:autopep8_disable_show_diff=1

"for ctrl-p
let g:ctrlp_open_new_file = 't'
let g:ctrlp_max_files = 500
let g:ctrlp_max_depth = 5

"for vim-anyfold 
let anyfold_activate=1
let anyfold_fold_comments=1
set foldlevel=0
