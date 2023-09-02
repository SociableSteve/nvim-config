call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'kdheepak/lazygit.nvim'

Plug 'vim-airline/vim-airline'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.g.mapleader = ' '
require("nvim-tree").setup()
require("toggleterm").setup()
require("bufferline").setup({
  options = {
    separator_style = 'slant',
    diagnostics = 'coc',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = {
      {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = false
      }
    }
  }
})

local catppuccin = require("catppuccin")
catppuccin.setup({
  bufferline = false
})
catppuccin.load()
EOF

syntax enable
colorscheme catppuccin

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
noremap <leader>ca <Plug>(coc-codeaction-cursor) 
noremap <silent> <leader>cd :CocDiagnostics<CR><C-w>p
noremap <silent> <leader>ff :NvimTreeToggle<CR>
noremap <silent> <leader>ct :ToggleTerm<CR>
tnoremap <silent> <C-t> <C-\><C-n>:ToggleTerm<CR>
tnoremap <silent> <esc><esc> <C-\><C-n>:q<CR>
noremap <silent> <C-l> :bnext<CR>
noremap <silent> <C-h> :bprev<CR>

nnoremap <silent> <leader>gg :LazyGit<CR>

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-rust-analyzer', 'coc-tsserver', 'coc-deno', 'coc-html', 'coc-css']
