"
"" Neovim lightweight configuration
"

" Plugins configuration {

    call plug#begin('~/.local/share/nvim/plugged')

        Plug 'scrooloose/nerdtree'
        Plug 'scrooloose/nerdcommenter'
        Plug 'ericcurtin/curtineincsw.vim'
        Plug 'airblade/vim-gitgutter'
        Plug 'yggdroot/indentline'
        Plug 'sheerun/vim-polyglot'
        Plug 'morhetz/gruvbox'
        Plug 'tpope/vim-fugitive'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'jiangmiao/auto-pairs'
        Plug 'vim-airline/vim-airline'

    call plug#end()

    " General config {
      let mapleader = ","
    " }

    " gruvbox configuration {
        syntax on
        set background=dark
        colorscheme gruvbox
    " }

    " indentline configuration {
        autocmd FileType help,nerdtree IndentLinesDisable
        autocmd FileType help,nerdtree LeadingSpaceDisable
        let g:indentLine_leadingSpaceChar = '·'
        let g:indentLine_leadingSpaceEnabled = 1
    " }
    
    " nerdtree configuration {
        let NERDTreeMinimalUI = 1
        let g:NERDTreeDirArrowExpandable = '►'
        let g:NERDTreeDirArrowCollapsible = '▼'
    " }

    " nerdcommenter configuration {
        " Add spaces after comment delimiters by default
        let g:NERDSpaceDelims = 1
        " Allow commenting and inverting empty lines (useful when commenting a region)
        let g:NERDCommentEmptyLines = 1
        " Enable trimming of trailing whitespace when uncommenting
        let g:NERDTrimTrailingWhitespace = 1
    " }

    " coc configuration {
        set nobackup
        set nowritebackup
        set cmdheight=2
        set updatetime=300
        set shortmess+=c
        set signcolumn=yes

        inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
        
        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction
        
        " Use <c-space> to trigger completion.
        inoremap <silent><expr> <c-space> coc#refresh()
        
        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
        " Coc only does snippet and additional edit on confirm.
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        
        " Use `[c` and `]c` to navigate diagnostics
        nmap <silent> [c <Plug>(coc-diagnostic-prev)
        nmap <silent> ]c <Plug>(coc-diagnostic-next)
        
        " Remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        
        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>
        
        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          else
            call CocAction('doHover')
          endif
        endfunction
        
        " Highlight symbol under cursor on CursorHold
        autocmd CursorHold * silent call CocActionAsync('highlight')
        
        " Remap for rename current word
        nmap <leader>rn <Plug>(coc-rename)
        
        " Remap for format selected region
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)
        
        augroup mygroup
          autocmd!
          " Setup formatexpr specified filetype(s).
          autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
          " Update signature help on jump placeholder
          autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end
        
        " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
        xmap <leader>a  <Plug>(coc-codeaction-selected)
        nmap <leader>a  <Plug>(coc-codeaction-selected)
        
        " Remap for do codeAction of current line
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Fix autofix problem of current line
        nmap <leader>qf  <Plug>(coc-fix-current)

        " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
        nmap <silent> <TAB> <Plug>(coc-range-select)
        xmap <silent> <TAB> <Plug>(coc-range-select)
        xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
        
        " Use `:Format` to format current buffer
        command! -nargs=0 Format :call CocAction('format')
        
        " Use `:Fold` to fold current buffer
        command! -nargs=? Fold :call     CocAction('fold', <f-args>)
        
        " use `:OR` for organize import of current buffer
        command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
        
        " Add status line support, for integration with other plugin, checkout `:h coc-status`
        set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
        
        " Using CocList
        " Show all diagnostics
        nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
        " Manage extensions
        nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
        " Show commands
        nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
        " Find symbol of current document
        nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
        " Search workspace symbols
        nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
        " Do default action for next item.
        nnoremap <silent> <space>j  :<C-u>CocNext<CR>
        " Do default action for previous item.
        nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
        " Resume latest coc list
        nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    " }

" }

" UI configurations {
    set cursorline                  " Highlight current line
    set showmatch                   " Show matching brackets/parenthesis
    set number                      " Line numbers on
    set colorcolumn=120
    set mouse=a
    set hidden                      " Allow buffer switching without saving
    set whichwrap+=<,>,h,l,[,]      " Allow going to the beginning and end of the line with h,l,ra,la
    
    " set wildmenu                    " Show list instead of just completing
    " set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

    set nofoldenable " when opening a file, dont auto fold

    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" }

" Formatting {
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of 2 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every four columns
    set softtabstop=2               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
" }

" Key mapping {
    nmap <leader>e :NERDTreeToggle<CR>
    map <F4> :call CurtineIncSw()<CR>
    map <C-_> <Leader>c<Space>
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
    autocmd FileType c,cpp,cmake,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    " }

    " Reloads vimrc after saving but keep cursor position
    if !exists('*ReloadVimrc')
        fun! ReloadVimrc()
            let save_cursor = getcurpos()
            source $MYVIMRC
            call setpos('.', save_cursor)
        endfun
    endif
    autocmd! BufWritePost $MYVIMRC call ReloadVimrc()
" }
