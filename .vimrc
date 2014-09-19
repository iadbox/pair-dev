"Syntax highlight
syntax enable
""Set line numbering
set number
"Set line highlight
set cursorline
"Setting no vim compat
set nocp
""Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
"lines wont break screen
set nowrap
" move buffer to hidden without warning about pending changes
set hidden

""""""""""""""""""""""""""""""""""""mouse
"allows mouse selection to go into visual mode and more
set mouse=a

""""""""""""""""""""""""""""""""""""Core Overrides
"make Y to perform like C or D
map Y y$

""""""""""""""""""""""""""""""""""""Custom macros
"Open tag under cursor in new tab
map <C-T> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Copy current file path to system clipboard
nmap <silent> cp :let @*=expand("%")<CR>
" Fast saving
nmap ,w :w!<CR>

""""""""""""""""""""""""""""""""""""Search
"ignore case when searching
set ignorecase
set smartcase
"enable hlsearch
set hlsearch
set incsearch
" Turn off syntax highlighting with ESC
nnoremap <silent> <ESC> :nohlsearch<CR><ESC>
"hlsearch disable with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

""""""""""""""""""""""""""""""""""""moving through windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""Splits
"Open splits down and right
set splitbelow
set splitright
" Resizing splits
nnoremap <silent> + :vertical resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>
nnoremap <silent> <leader>+ :resize +5<CR>
nnoremap <silent> <leader>- :resize -5<CR>


""""""""""""""""""""""""""""""""""""Tabs
"Insert spaces instead of tabs it inserts (if defined) 'softtabstop' space chars
set expandtab
"Tab equivalent to n spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smarttab

""""""""""""""""""""""""""""""""""""vundle
"Vundle installs plugins configured in vimrc with :BundleInstall
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""""""""""""""""""""""""""""""""Plugins
"Required Bundle
Plugin 'gmarik/vundle'
"Bundles to install
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-bundler'
Plugin 'thoughtbot/vim-rspec'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'austintaylor/vim-indentobject'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'rodjek/vim-puppet'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/JSON.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'ervandew/supertab'

filetype plugin indent on
"Matchit is included in vimcore since vim 6.0 this activates it:
"(runtime == source+relative path to vim installation dir)
runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""Colors
colors jellybeans
""""""""""""""""""""""""""""""""""""Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_auto_loc_list = 2
let g:syntastic_mode_map = { 'mode': 'active',
                             \ 'active_filetypes': [],
                             \ 'passive_filetypes': ['puppet'] }
map <F8> :SyntasticCheck<CR>

""""""""""""""""""""""""""""""""""""Youcompleteme
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'

""""""""""""""""""""""""""""""""""""NERDTree
map <F5> :NERDTreeToggle .<CR>
nnoremap ,n :NERDTreeToggle<CR>
" Don't ask to remove buffers when renaming or deleting files
let g:NERDTreeAutoDeleteBuffer = 1
" Ignore *.o files
let NERDTreeIgnore = [ '\.o$', '\.meta$' ]
" Open NERDTree when vim starts
autocmd vimenter * NERDTree
""Set nerdtree to be launched on start and cursor set to editing window
" autocmd VimEnter * wincmd p

""""""""""""""""""""""""""""""""""""Yankring
" Where to store yankring history
let g:yankring_history_dir = '~/.vim'
" K and Q as previous and next register
let g:yankring_replace_n_pkey = 'K'
let g:yankring_replace_n_nkey = 'Q'


"""""""""""""""""""""""""""""""""""""Powerline
"Export python path for powerline
let $PYTHONPATH="/usr/lib/python3.4/site-packages"
"always show powerline
set laststatus=2
"instant go to normal mode (powerline)
if ! has('gui_running')
        set ttimeoutlen=10
        augroup FastEscape
                autocmd!
                au InsertEnter * set timeoutlen=0
                au InsertLeave * set timeoutlen=1000
        augroup END
endif

""""""""""""""""""""""""""""""""""""Tabularize
" tabularize by selection in visual mode
vmap <leader>t y:Tabularize /<C-R>"/<CR>
" tabularize =
nmap <leader>t= :Tabularize /^[^=]*\zs=/<CR>
nmap <leader>te :Tabularize /^[^=]*\zs=/<CR>
" tabularize =>
nmap <leader>th :Tabularize /^[^=>]*\zs=>/<CR>
" tabularize {
nmap <leader>t{ :Tabularize /^[^{]*\zs{/<CR>
nmap <leader>tB :Tabularize /^[^{]*\zs{/<CR>
" tabularize (
nmap <leader>t( :Tabularize /^[^(]*\zs(/<CR>
nmap <leader>tb :Tabularize /^[^(]*\zs(/<CR>

" tabularize by selection in visual mode
vmap ,t y:Tabularize /<C-R>"/<CR>
" tabularize =
nmap ,t= :Tabularize /^[^=]*\zs=/<CR>
nmap ,te :Tabularize /^[^=]*\zs=/<CR>
" tabularize =>
nmap ,th :Tabularize /^[^=>]*\zs=>/<CR>
" tabularize {
nmap ,t{ :Tabularize /^[^{]*\zs{/<CR>
nmap ,tB :Tabularize /^[^{]*\zs{/<CR>
" tabularize (
nmap ,t( :Tabularize /^[^(]*\zs(/<CR>
nmap ,tb :Tabularize /^[^(]*\zs(/<CR>

""""""""""""""""""""""""""""""""""""Unite
"Set ag as default finder
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
let g:unite_source_grep_recursive_opt = ''
"Set unite to open window in bottom right
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 1
let g:unite_winheight = 8
"Use fuzzy matcher
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"Set sort method
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_matcher_fuzzy_max_input_length = 60
" In window settings
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  let b:SuperTabDisabled=1
  inoremap <silent><buffer><expr> <C-i> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-s> unite#do_action('vsplit')
  imap <buffer> <ESC> <Plug>(unite_exit)
endfunction
"maps \e to open unite fuzzy finding
nnoremap <Leader>e :Unite -silent -buffer-name=files -auto-resize -start-insert file_rec/async:!<CR>
nnoremap ,e :Unite -silent -buffer-name=files -auto-resize -start-insert file_rec/async:!<CR>
"maps \ag to open ag content fuzzy finding
nnoremap <Leader>ag :Unite -silent -start-insert grep:.<CR>
nnoremap ,ag :Unite -silent -start-insert grep:.<CR>
"maps \r to open recent buffers open
nnoremap <silent> <Leader>r :Unite -silent -buffer-name=recent -auto-resize file_mru<cr>
nnoremap <silent> ,r :Unite -silent -buffer-name=recent -auto-resize file_mru<cr>
"maps \b to navigate open buffers
nnoremap <Leader>b :Unite -silent -buffer-name=buffers -auto-resize buffer<cr>
nnoremap ,b :Unite -silent -buffer-name=buffers -auto-resize buffer<cr>
"Search in command history without losing history filter
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
""""""""""""""""""""""""""""""""""""SplitJoin
nmap <Leader>k :SplitjoinJoin<cr>
nmap ,k :SplitjoinJoin<cr>
nmap <Leader>j :SplitjoinSplit<cr>
nmap ,j :SplitjoinSplit<cr>

""""""""""""""""""""""""""""""""""""Rails
"Open Alternate file in vertical split
nmap <leader>a :AV<CR>
nmap ,a :AV<CR>
