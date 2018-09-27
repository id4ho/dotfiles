let mapleader = " "
let g:netrw_dirhistmax = 0 " Don't create netrw_dirhist..
set iskeyword+=- " Make words separated by - treated as a whole symbol (like _)

" rust.vim will overwrite the autopairs setting without the following line
let g:rust_keep_autopairs_default = 1

" Include plugs
if filereadable(expand("~/dotfiles/nvim.bundles"))
  source ~/dotfiles/nvim.bundles
endif

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Tabs..
set tabstop=2
set expandtab
set shiftround
set shiftwidth=2

" Put new windows right and below when splitting
set splitbelow
set splitright

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

set autowriteall " Autowrite always (even :qall, :exit etc)
set history=100  " Don't store really old commands
set nojoinspaces " Don't use double spaces after join commands

" Always use vertical diffs
set diffopt+=vertical

" <leader>h to remove search highlights
nnoremap <silent> <leader>h :nohlsearch<Bar>:echo<CR>

" relative numbers with absolute number of current line
set relativenumber
set number

" Different window composition for undotree
let g:undotree_WindowLayout = 4
nnoremap <F5> :UndotreeToggle<cr>
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" Grep configuration
set grepprg=rg\ --no-heading
nnoremap K :grep "\b<C-R>=expand("<cword>")<CR>\b"<CR>


" Simple autocomplete using vim builtin
function! CleverTab(reverse)
  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
    return "\<Tab>"
  elseif a:reverse
    return "\<C-P>"
  else
    return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab(0)<CR>
inoremap <S-Tab> <C-R>=CleverTab(1)<CR>

" FZF files
nmap <C-p> :Files<CR>
nmap <C-t> :Tags<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" TODO spelling zg and zw mark words as good/wrong in spellfile
" :set spell will highlight misspelled words
" set spellfile=$HOME/.vim-spell-en.utf-8.add
" " Autocomplete with dictionary words when spell check is on
" set complete+=kspell

" Colors/Theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:oceanic_next_terminal_bold = 1
colorscheme OceanicNext

" Syntax/Formatting
" Rust formatting
let g:rustfmt_autosave = 1

" Auto match paren/bracket/braces
let g:AutoPairs = {'(':')', '[':']', '{':'}'}
