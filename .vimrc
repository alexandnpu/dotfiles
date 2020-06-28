" for pathogen
" call pathogen#infect()
" Helptags
set nocompatible              " be iMproved, required
filetype off                  " required
" to install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" for neovim, use the following:
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"
"
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')

Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'eparreno/vim-l9'
Plug 'tomasr/molokai'
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' ", { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'godlygeek/tabular'
Plug 'othree/vim-autocomplpop'
Plug 'bling/vim-airline'
Plug 't9md/vim-choosewin'
Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/vim-easymotion'
Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'gabesoft/vim-ags'
Plug 'mtth/locate.vim'
Plug 'bogado/file-line'
Plug 'majutsushi/tagbar'
Plug 'elzr/vim-json'
Plug 'szw/vim-maximizer'
Plug 'terryma/vim-multiple-cursors'
Plug 'guns/xterm-color-table.vim'
Plug 'solarnz/thrift.vim'
Plug 'tpope/vim-fugitive'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim' "| Plug 'lambdalisue/vim-pyenv'
Plug 'airblade/vim-gitgutter'
Plug 'ltlollo/diokai'

if !has('nvim')
    Plug 'vim-scripts/YankRing.vim'
endif
call plug#end()
filetype plugin indent on    " required


" casual settings {{{
    syntax enable
    "set guifont=Monaco:h14
    set guifont=Menlo:h14
    set guicursor+=a:blinkon0
    set guioptions+=b
    if has('gui')
        set linespace=3
    endif
    
    map <leader>cd :lcd %:p:h<CR>
    set ruler
    "set t_Co=256
    "set term=xterm-256color
    set background=dark
    "let g:solarized_termcolors=256
    "colorscheme solarized
    colorscheme desert 
    "colorscheme molokai
    set cursorline
    set cursorcolumn
    set nu
    set nocp
    set tabstop=4
    set expandtab
    set shiftwidth=4
    set autoindent
    set cindent
    %retab
    set nowrap
    set ic       "ignore case when searching
    set backspace=indent,eol,start
    "set csprg=/emc/zhenga1/bin/cscope/bin/cscope
    set incsearch
    set laststatus=2
    set history=1000
    set encoding=utf-8
    "set cursorline
    
    if &diff
            colorscheme molokai
    endif
    map <leader><leader>s :syntax sync fromstart<CR>
    let g:python_host_prog = '/Users/alexzheng/alexpy2/bin/python'
" }}}


" neovim {{{
"   tnoremap <Esc> <C-\><C-n>
" }}}

" javacomplete2 {{{
    set omnifunc=syntaxcomplete#Complete
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    let g:JavaComplete_GradleExecutable = '/Users/zhengchao/tools/gradle-2.13/bin/gradle'
" }}}



" deoplete {{{
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
    let g:deoplete#auto_completion_start_length = 2
    let g:deoplete#sources = {}
    let g:deoplete#sources._ = []
    let g:deoplete#file#enable_buffer_path = 1
" }}}

"folding settings {{{
    set foldmethod=indent "fold by indent
    set foldnestmax=10      "deepest fold is 10 levels
    set nofoldenable        "dont fold by default
    set foldlevel=1
    let c_no_comment_fold = 1
" }}}

" auto commands {{{
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
    
    if exists('+colorcolumn')
      set colorcolumn=80
    endif
    
    nmap <C-S-P> :call <SID>SynStack()<CR>
    function! <SID>SynStack()
      if !exists("*synstack")
          return
      endif
      echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc
    
    function! ListWindows()
       let t = 1 
       while t <= tabpagenr('$') 
               echo 'tab' t . ':' 
               let bufs = tabpagebuflist(t) 
               let w = 0 
               while w < tabpagewinnr(t, '$') 
                       echo "\t" . bufname(bufs[w]) 
                       let w += 1 
               endwhile 
               let t += 1 
       endwhile 
       unlet t w bufs 
    endfunc
    
" }}}



map    <F8>             :ChooseWin<CR>
let g:choosewin_overlay_enable = 1


" easymotion {{{
    let g:EasyMotion_skipfoldedline = 0
    
    map <S-W>   <leader><leader>w
    map <S-B>   <leader><leader>b
    map <C-L>   <Plug>(easymotion-lineforward)
    map <C-J>   <Plug>(easymotion-j)
    map <C-K>   <Plug>(easymotion-k)
    map <C-H>   <Plug>(easymotion-linebackward)
    
" }}}

" taglist {{{
    map    <F10>            :Tlist<CR>
    
    let Tlist_Use_Right_Window   = 1
    let Tlist_Show_One_File      = 1
    let Tlist_Exit_OnlyWindow    = 1
    let tlist_cpp_settings       = 'c++;c:class;d:constraints;m:member;f:function'
    let tlist_c_settings         = 'c;d:macro;s:structure;u:union;f:function'
    let Tlist_WinWidth           = 60
" }}}
    
" tagbar {{{
    map    <F9>             :TagbarToggle<CR>
    
    let TagbarAccessProtected    = 1
    let g:tagbar_width           = 50
" }}}
    
" Mark {{{
    map    <F12>            :MarkClear<CR>
    nmap   <C-M><C-P>       <leader>#
    nmap   <C-M><C-N>       <leader>*
    let g:mwIgnoreCase           = 0 
    
    highlight  MarkWord1   ctermbg=123   ctermfg=Black  guibg=#87ffff guifg=Black
    highlight  MarkWord2   ctermbg=40    ctermfg=Black  guibg=#00df00 guifg=Black
    highlight  MarkWord3   ctermbg=178   ctermfg=Black  guibg=#dfaf00 guifg=Black
    highlight  MarkWord4   ctermbg=27    ctermfg=Black  guibg=#005fff guifg=Black
    highlight  MarkWord5   ctermbg=55    ctermfg=Black  guibg=#5f00af guifg=Black
    highlight  MarkWord6   ctermbg=198   ctermfg=Black  guibg=#ff0087 guifg=Black
    highlight  MarkWord7   ctermbg=242   ctermfg=Black  guibg=#666666 guifg=Black
    highlight  MarkWord8   ctermbg=93    ctermfg=Black  guibg=#8700ff guifg=Black
    highlight  MarkWord9   ctermbg=94    ctermfg=Black  guibg=#875f00 guifg=Black
    highlight  MarkWord10  ctermbg=166   ctermfg=Black  guibg=#df5f00 guifg=Black
" }}}

" locate {{{
    let g:locate_global          = 0
    let g:locate_focus           = 0
    "let g:locate_jump_to         = 'stay'
" }}}

" airline {{{
    "let g:airline_detect_whitespace = 0
    "let g:airline_theme='murmur'
    let g:airline_theme='powerlineish'
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline_exclude_preview = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    nmap <leader>- <Plug>AirlineSelectPrevTab
    nmap <leader>+ <Plug>AirlineSelectNextTab
" }}}

" bufferline {{{
    "let g:bufferline_echo = 1
    "let g:bufferline_active_buffer_left = '['
    "let g:bufferline_active_buffer_right = ']'
    "let g:bufferline_modified = '+'
" }}}

" bookmark {{{
    "let g:vbookmark_bookmarkSaveFile = $HOME.'/.vim/bundle/vbookmark/.vimbookmark'
    let g:bookmark_sign            = '>>'
    let g:bookmark_annotation_sign = '=='
" }}}

" fuzzyFinder {{{
    map <leader>fb  :FufBuf<CR>
    map <leader>ff  :FufFile<CR>
" }}}

" silver searcher {{{
    let g:aghighlight=1
" }}}

" ctrlp {{{
    map <c-\><c-p> :CtrlP<CR>
    map <c-\><c-b> :CtrlPBuffer<CR>
    map <c-\><c-m> :CtrlPMRU<CR>
" }}}

" json {{{
    let g:vim_json_syntax_conceal=0
" }}}

" indentLine  {{{
    "let g:indentLine_enabled = 1
    let g:indentLine_fileType = ['c', 'cpp', 'py']
    let g:indentLine_color_term = 239
" }}}
" nerdtree {{{
    " close vim if the only window left open is a NERDTree.
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    map <F2> :NERDTreeToggle<CR>
    let NERDTreeIgnore = ['\.pyc$']
    let g:NERDTreeDirArrowExpandable="+"
    let g:NERDTreeDirArrowCollapsible="~"
    " NERDTreeFind " review the current file in NERDTree
    " How can I open a NERDTree automatically when vim starts up if no files were specified?
    "autocmd StdinReadPre * let s:std_in=1
    "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}
"
"set tags=/Users/zhengchao/vagrant/data/alex/testVes/tiger/tiger/tags
"set tags=/Users/zhengchao/git/walis/tags
set tags=./tags,tags;
set tags+=/Users/zhengchao/.pyenv/versions/alexpy/lib/python2.7/site-packages/zeus_core/tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"
" show the absolute path of current file
" press 1 then ctrl g
"
