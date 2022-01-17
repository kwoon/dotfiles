if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'rakr/vim-one'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'cohama/lexima.vim'
Plug 'romainl/vim-devdocs'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews

if has("nvim")
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'xiyaowong/nvim-transparent'
  Plug 'styled-components/vim-styled-components'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
endif

call plug#end()
