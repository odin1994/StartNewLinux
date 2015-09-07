colorscheme ron 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
"required!
Bundle 'gmarik/vundle'

"My Bundle here: /*插件配置格式*/

"original repos on github(Github网站上非vim-scripts仓库的插件,按下面格式填写)
Bundle 'tpope/vim-fugitive'  
Bundle 'Lokaltog/vim-easymotion'  
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}  
Bundle 'tpope/vim-rails.git'  

" vim-scripts repos  （vim-scripts仓库里的，按下面格式填写）  
Bundle 'L9'  
Bundle 'FuzzyFinder'  

" non github repos   (非上面两种情况的，按下面格式填写)  
Bundle 'git://git.wincent.com/command-t.git'
" ...   
   
filetype plugin indent on     " required!   /** vimrc文件配置结束 **/  
"                                           /** vundle命令 **/  
" Brief help  
" :BundleList          - list configured bundles  
" :BundleInstall(!)    - install(update) bundles  
" :BundleSearch(!) foo - search(or refresh cache first) for foo   
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles  
"     
" see :h vundle for more details or wiki for FAQ   
" NOTE: comments after Bundle command are not allowed..  

"自己的插件
"powerline插件安装（状态栏）
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
"taglist插件安装（左侧标签支持跳转）
Bundle 'taglist.vim'
"winmanager插件安装（文件管理器）
Bundle 'winmanager'
"syntastic插件安装（语法风格检查）
Bundle 'scrooloose/syntastic'
"YouCompleteMe插件安装（代码补全）
Bundle 'Valloric/YouCompleteMe'
"minibufexpl插件安装（快速浏览和操作buffer）
Bundle 'minibufexpl.vim'

" vim-powerline插件
set laststatus=2
set t_Co=256
let g:Powerline_symbol='unicode'
set encoding=utf8

"syntastic插件
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_error_symbol = 'x '
let g:syntastic_warning_symbol = '! '
"whether to show balloons
let g:syntastic_enable_balloons = 1

"YouCompleteMe插件
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0

"MiniBufExpl插件
let g:miniBUfExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplUseSingleClick=1

"taglist插件
" increase the width of the taglist window
let Tlist_WinWidth=10
" automatically open the taglist window
let Tlist_Auto_Open=0
" exit wim when only the taglist window exist
let Tlist_Exit_OnlyWindow=1
" open tags with single click
let Tlist_Use_SingleClick=1
" close tag folds for inactive buffers
let Tlist_File_Fold_Auto_Close=1
" show the fold indicator column in the taglist window
let Tlist_Enable_Fold_Column=1
" Automatically update the taglist to include newly edited files
let Tlist_Auto_Update=1

"偏好设置
"设置为中文帮助文档
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'py'
		exec "!python %"
		exec "!python %<"
	endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc
"设置行号
set number numberwidth=4
"设置历史记录数
set history=1000
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5
"自动补全各种括号以及双引号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
"winmanager整合tlist插件
let g:winManagerWindowLayout='FileExplorer|TagList'
"按F3打开FileExplorer&TagList窗口
map <F3> :WMToggle<cr>
