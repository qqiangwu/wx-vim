source ~/.wx-vim/plug.vim
source ~/.wx-vim/basic.vim
source ~/.wx-vim/keys.vim

" Plugins
call plug#begin('~/.wx-vim/plugged')
    " local vimrc
    Plug 'LucHermitte/lh-vim-lib'
    Plug 'LucHermitte/local_vimrc'
    let g:local_vimrc = '.root/conf.vim'
    let g:local_vimrc_options = { 'whitelist': [$HOME] }

    " completion for cpp
    Plug 'Valloric/YouCompleteMe', { 'for': ['cpp', 'c'] }  " 'do': './install.py --clang-completer', 'for': ['cpp', 'c'] }
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_server_log_level = 'info'
    let g:ycm_min_num_identifier_candidate_chars = 2
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings=1
    let g:ycm_global_ycm_extra_conf = '~/.wx-vim/ycm_extra_conf.py'

    " parameters
    Plug 'Shougo/echodoc.vim'
    set noshowmode
    let g:echodoc#enable_at_startup = 1

    " *.h/*cpp switch
    Plug 'vim-scripts/a.vim'

    " tag autobuild
    Plug 'ludovicchabant/vim-gutentags'
    set tags=./.tags;,.tags

    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
    let g:gutentags_ctags_tagfile = '.tags'
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags

    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 检测 ~/.cache/tags 不存在就新建
    if !isdirectory(s:vim_tags)
       silent! call mkdir(s:vim_tags, 'p')
    endif

    " linter
    Plug 'w0rp/ale'
    let g:airline#extensions#ale#enabled = 1
    let g:ale_linters = {
                \ 'c': ['gcc', 'cppcheck'], 
                \ 'cpp': ['gcc', 'cppcheck'], 
                \ 'python': ['flake8', 'pylint'], 
                \ 'lua': ['luac'], 
                \ 'go': ['go build', 'gofmt'],
                \ 'java': ['javac'],
                \ 'javascript': ['eslint'], 
                \ }

    function s:lintcfg(name)
        let conf = s:path('tools/conf/')
        let path1 = conf . a:name
        let path2 = expand('~/.vim/linter/'. a:name)
        if filereadable(path2)
            return path2
        endif
        return shellescape(filereadable(path2)? path2 : path1)
    endfunc

    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
    let g:ale_c_cppcheck_options = ''
    let g:ale_cpp_cppcheck_options = ''
    let g:ale_linters_explicit = 1
    let g:ale_completion_delay = 500
    let g:ale_echo_delay = 20
    let g:ale_lint_delay = 500
    let g:ale_echo_msg_format = '[%linter%] %code: %%s'
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1
    let g:airline#extensions#ale#enabled = 1

    " Git diff
    Plug 'mhinz/vim-signify'
    nnoremap <silent> <leader>diff :SignifyDiff<CR>

    " Text obj
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-syntax'
    Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim' ] }
    Plug 'sgur/vim-textobj-parameter'

    " Highlight
    Plug 'octol/vim-cpp-enhanced-highlight'
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_experimental_template_highlight = 1

    " Tagbar and File switch
    Plug 'Yggdroot/LeaderF' ", { 'do': './install.sh' }
    let g:Lf_ShortcutF = '<c-p>'
    let g:Lf_ShortcutB = '<m-n>'
    noremap <c-n> :LeaderfMru<cr>
    nnoremap <silent> <leader>lf :LeaderfFunction<CR>
    nnoremap <silent> <leader>lb :LeaderfBuffer<CR>
    nnoremap <silent> <leader>lt :LeaderfTag<CR>

    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand('~/.vim/cache')
    let g:Lf_ShowRelativePath = 0
    let g:Lf_HideHelp = 1
    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_PreviewResult = {'Function':0}
    let g:Lf_DefaultMode = 'FullPath'

    let g:Lf_NormalMap = {
        \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
        \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
        \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
        \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
        \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
        \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
        \ }

    " File explorer
    Plug 'justinmk/vim-dirvish'

    " Autoclose
    Plug 'Townk/vim-autoclose'

    " Session Manager
    Plug 'vim-scripts/sessionman.vim'
    nmap <leader>sl :SessionList<CR>
    nmap <leader>ss :SessionSave<CR>
    nmap <leader>sc :SessionClose<CR>

    " Rainbox
    Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1
    
    " theme
    Plug 'altercation/vim-colors-solarized'
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
call plug#end()

set background=dark         " Assume a dark background
color solarized
if &term == 'xterm' || &term == 'screen'
    set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
