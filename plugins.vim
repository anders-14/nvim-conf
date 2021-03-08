" PLUGINS

call plug#begin('~/.local/share/nvim/plugged')

" Commenter
Plug 'tpope/vim-commentary'

" Filetree
Plug 'justinmk/vim-dirvish'

" LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'

" Formatter
Plug 'mhartington/formatter.nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Color related
Plug 'norcalli/nvim-base16.lua'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()
