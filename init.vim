" 首次使用此配置时自动下载插件管理器
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" 在这里添加插件
Plug 'hardcoreplayers/spaceline.vim'
Plug 'hardcoreplayers/vim-buffet'
Plug 'ryanoasis/vim-devicons'
Plug 'hardcoreplayers/dashboard-nvim'
Plug 'Yggdroot/indentLine',{ 'for': ['c', 'h', 'cpp', 'py', 'json', 'go', 'java', 'vim', 'hs'] }

" 主题
Plug 'bling/vim-bufferline'
Plug 'bpietravalle/vim-bolt'
Plug 'theniceboy/vim-deus'

" 功能设置
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'honza/vim-snippets',{ 'for': ['c', 'h', 'cpp', 'py', 'json', 'go', 'java', 'vim', 'hs'] }
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks'] }
Plug 'junegunn/fzf.vim', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks']}
Plug 'habamax/vim-godot'
Plug 'OmniSharp/omnisharp-vim'

" 自动格式化
Plug 'Chiel92/vim-autoformat'

call plug#end()

" 打开行号
set number
set relativenumber

" 设置 UTF-8 编码
set encoding=UTF-8

" 设置leader键
let mapleader=" "

"快捷键
map WQ :wq<CR>
map Q :q<CR>
map W :w<CR>

"========
"主题设置
"========
color deus
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
hi NonText ctermfg=gray guifg=grey10


"============
"美化插件设置
"============

"Dashboard设置
let g:dashboard_custom_header = [
			\ '',
			\ '███████╗██╗   ██╗ ██████╗ ██╗    ██╗   ██╗███████╗    ██╗',
			\ '██╔════╝██║   ██║██╔═══██╗██║    ██║   ██║██╔════╝    ██║',
			\ '█████╗  ██║   ██║██║   ██║██║    ██║   ██║█████╗      ██║',
			\ '██╔══╝  ╚██╗ ██╔╝██║   ██║██║    ╚██╗ ██╔╝██╔══╝      ╚═╝',
			\ '███████╗ ╚████╔╝ ╚██████╔╝███████╗╚████╔╝ ███████╗    ██╗',
			\ '╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═══╝  ╚══════╝    ╚═╝',
			\ '',
			\ '                       [Defender]',
			\ '',
			\ ]
let g:dashboard_default_executive ='fzf'

let g:dashboard_custom_shortcut={
			\ 'last_session'       : 'SPC s l',
			\ 'find_history'       : 'SPC f h',
			\ 'find_file'          : 'SPC f f',
			\ 'new_file'           : 'SPC f n',
			\ 'change_colorscheme' : 'SPC t c',
			\ 'find_word'          : 'SPC f a',
			\ 'book_marks'         : 'SPC f b',
			\ }
noremap <LEADER>fn :DashboardNewFile<CR>


"Vim-buffet设置
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

"COC配置文件

let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
let g:coc_global_extensions = ['coc-html','coc-json','coc-python','coc-clangd','coc-go','coc-snippets','coc-git','coc-vimlsp','coc-spell-checker']
vmap <A-m> <Plug>(coc-codeaction-selected)<CR>
nmap <A-m> <Plug>(coc-codeaction-selected)<CR>
augroup coc_event
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Python PATH 配置
let g:python3_host_prog='/usr/bin/python3.8'

"============
"基本键位设置
"============
"     ^
"     w
" < a   d >
"     s
"     v
let mapleader=" "
noremap w k
noremap s j
noremap a h
noremap d l
noremap W 5k
noremap S 5j
noremap A 5h
noremap D 5l

" 个人习惯键位
noremap ; l
noremap CapsLook :
map <C-s> :w<CR>

" 插件相关键位
map <F3> :PlugInstall<CR>
map <F4> :PlugUpdate<CR>

" godot设置
func! GodotSettings() abort
	setlocal foldmethod=expr
	setlocal tabstop=8
	nnoremap <buffer> <F4> :GodotRunLast<CR>
	nnoremap <buffer> <F5> :GodotRun<CR>
	nnoremap <buffer> <F6> :GodotRunCurrent<CR>
	nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
	au FileType gdscript call GodotSettings()
augroup end
let g:godot_executable = '/home/defender/Godot_v3.2.3-stable_x11.64'

"是用来一键编译运行代码的
noremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
    		exec "!g++ -std=c++11 % -Wall -o %<"
    		:sp
    		:res -10
    		:term ./%<
    		exec "!rm -rf ./%<"
	elseif &filetype == 'java'
    		exec "!javac %"
    		exec "!time java %<"
  	elseif &filetype == 'sh'
    		:!time bash %
  	elseif &filetype == 'python'
    		set splitbelow
    		:sp
    		:term python3 %
  	elseif &filetype == 'html'
    		silent! exec "!" google-chrome-stable " % &"
  	elseif &filetype == 'markdown'
    		exec "InstantMarkdownPreview"
  	elseif &filetype == 'tex'
    		silent! exec "VimtexStop"
    		silent! exec "VimtexCompile"
  	elseif &filetype == 'dart'
    		exec "CocCommand flutter.run -d ".g:flutter_default_device
    		CocCommand flutter.dev.openDevLog
 	elseif &filetype == 'javascript'
    		set splitbelow
    		:sp
    		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  	elseif &filetype == 'go'
    		set splitbelow
    		:sp
    		:term go run .
  	endif
endfunc

" omnisharp设置
let g:OmniSharp_Server_use_mono = 1 
let g:OmniSharp_Server_stdio = 1


