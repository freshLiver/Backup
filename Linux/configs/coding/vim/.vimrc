set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" color hint
Plugin 'lilydjwg/colorizer'

" indent line settings 
Plugin 'yggdroot/indentline'
let g:indentLine_color_term = 161
let g:indentLine_char_list =  ['¦', '¦'] 

"" for json, change conceallevel to show quote marks
let g:vim_json_conceal=0


" status line setting
Plugin 'itchyny/lightline.vim'
let g:lightline= { 'colorscheme' : 'materia' } 

" brace plugins
Plugin 'kien/rainbow_parentheses.vim'
let g:rainbow_active = 1

" parentheses auto complete
Plugin 'raimondi/delimitmate'

" multi cursor
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_quit_key = '<Esc>'
let g:multi_cursor_exit_from_insert_mode=1


" file explorer
Plugin 'preservim/nerdtree'
nnoremap <F4> :NERDTreeToggle<CR>

" minimap 
Plugin 'severin-lemaignan/vim-minimap'
let g:minimap_toggle='<C-F11>'


" autocompletion
"Plugin 'valloric/youcompleteme'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1

" fast comment
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

""" clang
"Plugin 'rip-rip/clang_complete'

function FindLibClang()
    let libclang_paths = []
    let libclang_paths += ["/usr/lib/x86_64-linux-gnu/libclang-*.so.1"]
    let libclang_paths += ["/usr/lib64/libclang.so*"]

    for p in libclang_paths
        if !empty(glob(p))
            return glob(p,0,1)[0]
        endif
    endfor
endfunction

let g:clang_library_path=FindLibClang()


Plugin 'ervandew/supertab'
""" python
"" Plugin 'davidhalter/jedi-vim'
"" autocmd BufReadPre,FileReadPre *.c(pp)? let g:SuperTabDefaultCompletionType="<c-n><c-p>"
"" autocmd BufReadPre,FileReadPre *.py let g:SuperTabDefaultCompletionType="<c-n>"
"" autocmd BufReadPre,FileReadPre *.py let g:jedi#completions_command = "<c-n>"
"" autocmd BufReadPre,FileReadPre *.py let g:jedi#show_call_signatures = "0"
"" autocmd BufReadPre,FileReadPre *.py let g:jedi#rename_command = "<F2>"


" auto formatter

Plugin 'rhysd/vim-clang-format'
let g:clang_format#command = '/usr/bin/clang-format'

set autoread " auto reload after changed

autocmd FileType c,cpp nnoremap <F3> <Esc>:ClangFormat<CR>
autocmd FileType c,cpp inoremap <F3> <Esc>:ClangFormat<CR>
autocmd FileType c,cpp vnoremap <F3> <Esc><Esc>:ClangFormat<CR>

autocmd FileType rust nnoremap <F3> <Esc>:w<CR>:!cargo fmt<CR>:redraw<CR>
autocmd FileType rust inoremap <F3> <Esc>:w<CR>:!cargo fmt<CR>:redraw<CR>
autocmd FileType rust vnoremap <F3> <Esc><Esc>:w<CR>:!cargo fmt<CR>:redraw<CR>


" git
Plugin 'airblade/vim-gitgutter'
set updatetime=100

call vundle#end()            " required
filetype plugin indent on    " required


"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
autocmd FileType python setlocal completeopt-=preview


:syntax on

:colorscheme jummidark


:set t_Co=256
:set history=9999
:set mouse=a
:set encoding=utf-8

"""" General
hi CursorLine ctermfg=None ctermbg=none cterm=inverse guifg=NONE guibg=#1c1c1c gui=NONE

set cursorline
hi CursorColumn cterm=standout ctermbg=none ctermfg=White

set cursorcolumn
hi LineNr cterm=None ctermbg=239 ctermfg=220
hi CursorLineNr cterm=Bold ctermbg=34 ctermfg=193

set number                           "" Show line numbers
set relativenumber                   "" hybrid linenumber
set wrap
set linebreak                        "" Break lines at word (requires Wrap lines)
set showbreak=➤                      "" Wrap-broken line prefix
set textwidth=0                      "" Line wrap (number of cols)
set showmatch                        "" Highlight matching brace
set visualbell                       "" Use visual bell (no beeping)
 
set hlsearch                         "" Highlight all search results
set smartcase                        "" Enable smart-case search
set ignorecase                       "" Always case-insensitive
set incsearch                        "" Searches for strings incrementally
 
set autoindent                       "" Auto-indent new lines
filetype indent on
set expandtab                        "" Use spaces instead of tabs
set shiftwidth=4                     "" Number of auto-indent spaces
set smartindent                      "" Enable smart-indent
set smarttab                         "" Enable smart-tabs
set softtabstop=4                    "" Number of spaces per Tab

"""" Advanced
set confirm                          "" Prompt confirmation dialogs
set ruler                            "" Show row and column ruler information
set colorcolumn=80
highlight ColorColumn ctermbg=88 guibg=#870000
 
set undolevels=1000                  "" Number of undo levels
set backspace=indent,eol,start       "" Backspace behaviour
 
"""" Generated by VimConfig.com


"""" Status Bar Settings 
set laststatus=2

"""" left side
hi FileTag cterm=none ctermbg=None ctermfg=214
hi FilePath cterm=none ctermbg=243 ctermfg=118
set statusline=%#FileTag#\ \ ➤\ %#FilePath#\ %{expand('%:~:\.')}\ 

"""" right side
set statusline+=%=
hi FileInfo cterm=none ctermbg=240 ctermfg=40
set statusline+=%#FileInfo#\ %y%r\ 


hi CurrLine cterm=none ctermbg=240 ctermfg=172
set statusline+=%#CurrLine#[%3p%%\ %c:%l/%L]


"""" AutoComplete 
:set pastetoggle=<F12>
:"" inoremap () ()
:"" inoremap "" ""
:"" inoremap '' ''
:"" inoremap [] []
:"" inoremap <> <>
"" 
:"" inoremap ( ()<Esc>i
:"" inoremap " ""<Esc>i
:"" inoremap ' ''<Esc>i
:"" inoremap [ []<Esc>i
:"" inoremap < <><Esc>i
:"" inoremap {<CR> {<CR>}<Esc>ko 
:"" inoremap """<CR> """<CR>"""<Up><Esc>o



"""" Save and Quit 
:inoremap <F4> <ESC>:noh<CR>
:inoremap <F9> <Esc>:noh<CR>:w<CR>i
:nnoremap <F9> <Esc>:noh<CR>:w<CR>
:inoremap <F10> <Esc>:wq<CR>
:nnoremap <F10> <Esc>:wq<CR>
:vnoremap <F10> <Esc>:wq<CR>

:inoremap <F5> <Esc>:w<CR>:e<CR>:echo "Saved, Reload"<CR>
:nnoremap <F5> <Esc>:w<CR>:e<CR>:echo "Saved, Reload"<CR>
:inoremap <C-F5> <Esc>:w<CR>:e!<CR>:echo "Discarded, Reload"<CR>
:nnoremap <C-F5> <Esc>:w<CR>:e!<CR>:echo "Discarded, Reload"<CR>

:inoremap <F8> <Esc>/\<\><Left><Left>
:nnoremap <F8> <Esc>/\<\><Left><Left>

:nnoremap <End> $i<Right>




"" mappings for line moving
:inoremap <C-K> <Esc>:m -2<CR>i
:nnoremap <C-K> <Esc>:m -2<CR>:echo "Move Up"<CR>
:vnoremap <C-K> :m '<-2<CR>gv

:inoremap <C-J> <Esc>:m +1<CR>i
:nnoremap <C-J> <Esc>:m +1<CR>:echo "Move Down"<CR>
:vnoremap <C-J> :m '>+1<CR>gv


" mappings for cursor moving
:inoremap <C-a> <Esc>^i
:nnoremap <C-a> <Esc>^:echo "Move to Line Start"<CR>
:vnoremap <C-a> ^gv

:inoremap <C-e> <Esc>$a
:nnoremap <C-e> <Esc>$:echo "Move to Line End"<CR>
:vnoremap <C-e> $gv




" mappings for window navigations
:nnoremap <S-H> :wincmd h<CR>
:nnoremap <S-J> :wincmd j<CR>
:nnoremap <S-K> :wincmd k<CR>
:nnoremap <S-L> :wincmd l<CR>




"" mappings for indent
:nnoremap <Tab> :><CR>:echo "Indent"<CR>
:nnoremap <S-Tab> :<<CR>:echo "Unindent"<CR>
:vnoremap <Tab> >gv
:vnoremap <S-Tab> <gv



"" delete mapping
:nnoremap <C-W> i<C-W>
:inoremap <C-D> <Esc>dw
:nnoremap <C-D> <Esc>dw

"" Forced Close 
:inoremap <C-F12> <Esc>:q!<CR>
:nnoremap <C-F12> <Esc>:q!<CR>



"" Select Mode
:inoremap <S-Up> <Esc>v<Up>
:inoremap <S-Down> <Esc>v<Down>
:inoremap <S-Left> <Esc>v<Left>
:inoremap <S-Right> <Esc>v<Right>
:nnoremap <S-Up> <Esc>v<Up>
:nnoremap <S-Down> <Esc>v<Down>
:nnoremap <S-Left> <Esc>v<Left>
:nnoremap <S-Right> <Esc>v<Right>


"" wrap selected words in visual mode
:vnoremap " :s/\%V\(.*\)\%V/"\1"/<CR>gv<RIGHT><RIGHT><Esc><Esc>
:vnoremap ' :s/\%V\(.*\)\%V/'\1'/<CR>gv<RIGHT><RIGHT><Esc><Esc>
:vnoremap ( :s/\%V\(.*\)\%V/(\1)/<CR>gv<RIGHT><RIGHT><Esc><Esc>
:vnoremap [ :s/\%V\(.*\)\%V/[\1]/<CR>gv<RIGHT><RIGHT><Esc><Esc>
:vnoremap < :s/\%V\(.*\)\%V/<\1)><CR>gv<RIGHT><RIGHT><Esc><Esc>

