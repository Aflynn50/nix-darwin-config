
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

let mapleader = " "

autocmd FileType scala setlocal shiftwidth=2 tabstop=2

syntax on
au BufRead,BufNewFile *.pl set filetype=prolog

set path+=*/**

"Move // comment to prev line
let @a = "$2F/DO\<Esc>p=="

"Comment line
let @c = ":s/^/\\/\\/ /\<cr>"

"Switch window
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

let g:go_list_type = "quickfix"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 1
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

" rust
let g:rustfmt_autosave = 1
let g:cargo_shell_command_runner = '!'
autocmd FileType rust nmap <leader>b :Cbuild<CR>
autocmd FileType rust nmap <leader>r :Crun<CR>
autocmd FileType rust nmap <leader>t :Ctest<CR>

" For faith/vim-go
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" run go test
let @t = ':wvl:termigoth'
let @r = ':wligoth'
let @e = 'l:q' 

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


"Disable folding for vim-markdown
let g:vim_markdown_folding_disabled = 1

"map ctrl P to fzf
nnoremap <C-p> <cmd>Telescope find_files<cr>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr

"map ctrl backspace to delete the prev word
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

"nvim telesope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"git
command GC G commit -a --verbose
nnoremap <C-G> :GC<CR> \| :star<CR>

"S for stamp, i.e. paste without overwriting the paste register
nnoremap <leader>S diw"0P

set nofoldenable

"Use clipboard for copying always
"set clipboard+=unnamedplus

set termguicolors
syntax enable
let g:airline_theme='solarized'
set background=light
colorscheme NeoSolarized

