if &compatible
    set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

call dein#add('Shougo/vimproc', {'build': 'make'})

call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})

call dein#add('itchyny/lightline.vim')

call dein#add('Shougo/unite.vim')
call dein#add('ujihisa/unite-colorscheme')

call dein#add('scrooloose/syntastic')

call dein#add('Shougo/vimshell.vim')

call dein#add('jiangmiao/auto-pairs')

call dein#add('fatih/vim-go')

call dein#add('thinca/vim-quickrun')

call dein#add('thinca/vim-localrc')

call dein#add('petdance/vim-perl')

call dein#end()

if dein#check_install(['vimproc'])
    call dein#install(['vimproc'])
endif

if dein#check_install()
    call dein#install()
endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" vim-go
let g:go_fmt_command = "goimports"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_save = 1
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
"let g:syntastic_enable_perl_checker = 1
"let g:syntastic_perl_checkers = ['perl']

" lightline
let g:lightline = { 'colorscheme': 'PaperColor'  }

" vim
set title
set noshowmode
" set number
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" Enable filetype plugins
filetype plugin indent on

" share clipboard yank
set clipboard+=unnamedplus

" perltidy
nnoremap <space>pt :<C-u>% call PerlTidy()<CR>
vnoremap <space>pt :<C-u>'<,'> call PerlTidy()<CR>

function! PerlTidy() range
    let l:rc = findfile(".perltidyrc", ".;")
    if filereadable(l:rc)
        call feedkeys(':' . a:firstline . ',' . a:lastline . ' !perltidy -pro=' . l:rc . "\<CR>")
    else
        echo ".perltidyrc not found."
    endif
endfunction
