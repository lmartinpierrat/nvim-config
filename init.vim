"
" Neovim lightweight configuration
"

" Plugins configuration {

    filetype off
    set rtp+=~/.config/nvim/bundle/Vundle.vim

    call vundle#begin("~/.config/nvim/bundle")

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdtree'
    Plugin 'ericcurtin/curtineincsw.vim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'yggdroot/indentline'
    Plugin 'valloric/youcompleteme'

    call vundle#end()
    filetype plugin indent on

    " solarized configuration {

        let g:solarized_termcolors=256
        let g:solarized_termtrans = 1
        syntax enable
        set background=dark
        colorscheme solarized

    " }

    " indentline configuration {

        autocmd FileType help,nerdtree IndentLinesDisable
        autocmd FileType help,nerdtree LeadingSpaceDisable

        let g:indentLine_leadingSpaceChar = '·'
        let g:indentLine_leadingSpaceEnabled = 1

    " }

    " YouCompleteMe configuration {

        let g:ycm_global_ycm_extra_conf = "~/.config/nvim/ycm_extra_conf.py"

    " }

" }

" UI configurations {

    set cursorline                  " Highlight current line
    set showmatch                   " Show matching brackets/parenthesis
    set number                      " Line numbers on
    set colorcolumn=120
    set mouse=a
    set hidden                          " Allow buffer switching without saving

"    set wildmenu                    " Show list instead of just completing
"    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

    set nofoldenable " when opening a file, dont auto fold

    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }

" Formatting {
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
" }

" Key mapping {
    let mapleader = ","
    nmap <leader>e :NERDTreeToggle<CR>
    map <F4> :call CurtineIncSw()<CR>
" }

" Functions {

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    " }

" }
