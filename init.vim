" SETTINGS
syntax on

" No numbers
set nonumber
set norelativenumber
set numberwidth=3
set signcolumn=yes

" Only showing status bar when more than one window
set laststatus=1
set noshowcmd
set noshowmode
set noruler

" Default splitting behaviour
set splitright
set splitbelow

" Tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent

" Set the encoding to utf-8
set encoding=utf-8
set fileencoding=utf-8

" Search settings
set smartcase
set ignorecase
set incsearch
set inccommand=split

" No backups
set noswapfile
set nobackup
set nowb
set hidden

" Wildmenu (completion in cmd-line)
set wildmenu
set wildignorecase

" Random settings
set nowrap
set termguicolors
set updatetime=50
set mouse=a
set background=dark

" Add cursor line in insert mode
" This is because alacritty and tmux has issues on windows... idk why
augroup highlight_insert
  autocmd!
  autocmd InsertEnter,InsertLeave * set cursorline!
augroup END

" Highlight yank
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END


" ==============================================================================

" GENERAL KEYMAPS

" The leader key I use
let mapleader = ","

" Trying to get of ctrl+c
" It fucks with my wincmd keybinds
inoremap jk <esc>
inoremap <C-c> <nop>

" Moving between splits with the leader key
nnoremap <C-h> :wincmd h<cr>
nnoremap <C-j> :wincmd j<cr>
nnoremap <C-k> :wincmd k<cr>
nnoremap <C-l> :wincmd l<cr>

" Fix indentation
nnoremap <leader>i mmggVG='m

" Getting rid of search highlight when done searching
nnoremap <Esc> :noh<cr>
nnoremap <C-c> :noh<cr>

" Reselect when tabbing in visual mode
vnoremap < <gv
vnoremap > >gv

" Searching with space instead of /
nnoremap <space> /

" Moving to the first char instead of the start of the line with 0
nnoremap 0 ^

" Source init.vim
nnoremap <leader>s :so $HOME/.config/nvim/init.vim<cr>

" Save file
nnoremap <leader>w :w<cr>

" HTML AND CSS SNIPPETS
nnoremap <leader>html :-1read $HOME/.config/nvim/templates/template.html<cr>
nnoremap <leader>css :-1read $HOME/.config/nvim/templates/template.css<cr>

" Convert word into html tag
nnoremap <leader>t yiwi<<esc>ea></<esc>pa><esc>cit

" Function that enables line numbers
function! EnableNumbers()
  set number!
  set relativenumber!
endfunction

" Map the functing to a keybinding
nnoremap <silent> <leader>n :call EnableNumbers()<cr>

" Convert md into pdf
nnoremap <leader>mp :!mdtopdf %<cr>


" ==============================================================================

" PLUGINS

source $HOME/.config/nvim/plugins.vim

" ==============================================================================

" COLORSCHEME SETTINGS

function! RemoveBackground()
  hi Normal guibg=None
  hi SignColumn guibg=None
  hi LineNr guibg=None
endfunction

lua require'color'.custom()

command!          AndThemeCustom :lua require'color'.custom()
command! -nargs=? AndThemeName :lua require'color'.set_theme_by_name(<f-args>)
command! -nargs=? AndThemeIndex :lua require'color'.set_theme_by_pos(<f-args>)
command! -nargs=1 AndThemeRotate :lua require'color'.rotate_theme(<f-args>)

nnoremap <silent> <leader>ø :AndThemeRotate -1<CR>
nnoremap <silent> <leader>æ :AndThemeRotate 1<CR>
nnoremap <silent> <leader>å :AndThemeCustom<CR>


" ==============================================================================

" KEYBINDS AND SETTINGS FOR PLUGINS

" Lsp
lua require('init')

set completeopt=menuone,noselect

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" COMPELTION NVIM (switching to comep)
" let g:completion_enable_auto_popup = 1
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" let g:completion_enable_auto_paren = 1
" let g:completion_matching_ignore_case = 0
" let g:completion_matching_smart_case = 1
" let g:completion_trigger_on_delete = 1

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0

" Formatter
nnoremap <leader>fm :w<cr>:FormatWrite<cr>

" augroup format_on_save
"   autocmd!
"   autocmd BufWritePost *.js,*.ts,*.html,*.go FormatWrite
" augroup END

" Colorizer
lua require'colorizer'.setup()

" Telescope
nnoremap <leader>gg <cmd>Telescope git_files<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fr <cmd>Telescope live_grep<cr>

