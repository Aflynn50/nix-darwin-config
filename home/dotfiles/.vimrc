" FOR NVIM USE init.vim IN ~/.config/nvim
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set smartindent
set relativenumber
set nu
set scrolloff=7
set mouse=a

autocmd FileType scala setlocal shiftwidth=2 tabstop=2

syntax on
au BufRead,BufNewFile *.pl set filetype=prolog

set path+=*/**

"Move // comment to prev line
let @a = "$2F/DO\<Esc>p=="

"Comment line
let @c = ":s/^/\\/\\/ /\<cr>"

let g:go_list_type = "quickfix"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 1
" Use golangci-lint
"let g:go_metalinter_enabled = []
"let g:go_metalinter_command = 'golangci-lint'
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet','revive','errcheck','staticcheck','unused','varcheck']
set updatetime=100
set autowrite

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"Disable folding for vim-markdown
let g:vim_markdown_folding_disabled = 1

"map ctrl P to fzf
nnoremap <C-p> :Files<CR>


" FOR NVIM USE init.vim IN ~/.config/nvim
call plug#begin()
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'edwinb/idris2-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/vim-markdown'
Plug 'tpope/vim-abolish'
call plug#end()
