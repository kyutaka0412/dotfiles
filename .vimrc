" -----------------------------------------------------------------------------
"  初期化
" -----------------------------------------------------------------------------
"  自動コマンド
autocmd!

" vi 互換モードをオフ
set nocompatible

" -----------------------------------------------------------------------------
"  dein.vim
" -----------------------------------------------------------------------------
filetype plugin indent off

" dein.vim ランタイムパス指定
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" dein.vim 設定
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#load_toml(expand('~/.vim/rc') . '/dein.toml',      {'lazy': 0})
  call dein#load_toml(expand('~/.vim/rc') . '/dein_lazy.toml', {'lazy': 1})

  if !has('nvim')
    call dein#load_toml(expand('~/.vim/rc') . '/dein_not_nvim.toml', {'lazy': 0})
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install(['vimproc.vim'])
  call dein#install(['vimproc.vim'])
endif

if dein#check_install()
  call dein#install()
endif

" ファイルタイプの自動検出
filetype indent plugin on

" -----------------------------------------------------------------------------
"  Syntax
" -----------------------------------------------------------------------------
syntax on
let g:molokai_original=1
"set background=dark
colorscheme solarized
highlight Normal ctermbg=none
"let g:solarized_termcolors=256

" -----------------------------------------------------------------------------
"  基本設定
" -----------------------------------------------------------------------------
" キーのリマップ
nnoremap [ %

" デフォルトをcommandモードに
set noinsertmode

" 行番号の表示
" set number

" エンコーディング設定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp

" 基本のインデント設定(各拡張子毎の設定は別途)
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" バックアップファイル/スワップファイルを作成しない
set nobackup
set noswapfile

" ステータスラインの表示
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" .vim ディレクトリの設定
let $DOTVIM = expand('~/.vim')

" コマンドライン補完をshellと同一にする
set wildmode=list:longest

" 検索をインクリメンタルサーチにする
set incsearch

" 検索ワードをハイライトする
set hlsearch

" カーソルラインをハイライトする
"set cursorline

" バックスペースでインデント削除
set backspace=indent,eol,start

" 日本語のズレを無くす
set ambiwidth=double

" タブ、空白、改行の可視化
set list
set listchars=tab:>\ ,trail:_

" 折り畳み設定
set foldmethod=syntax
let perl_fold=1
set foldlevel=100

set binary noeol

" バッファを開いた時に、カレントディレクトリを自動で移動
" autocmd BufEnter * execute ":lcd " . expand("%:p:h")

" 環境に合わせてsourceするようにする(リポジトリには含めない)
source ~/.vimrc.local

" Escape を jj に設定
inoremap <silent> jj <ESC>

" -----------------------------------------------------------------------------
"  バッファ操作
" -----------------------------------------------------------------------------
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" -----------------------------------------------------------------------------
"  neosnippet
" -----------------------------------------------------------------------------
" キーマップの設定
"imap <C-k>  <Plug>(neosnippet_expand_or_jump)
"smap <C-k>  <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>  <Plug>(neosnippet_expand_target)
"
"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: "\<TAB>"
"
"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif

" -----------------------------------------------------------------------------
" deoplete.nvim
" -----------------------------------------------------------------------------
"set completeopt+=noinsert
"set completeopt-=preview
let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
"let g:deoplete#auto_complete_delay = 0
call deoplete#custom#option({
\ 'auto_complete_delay': 0,
\ 'smart_case': v:true,
\ })
" disable autocomplete by default
"let b:deoplete_disable_auto_complete=1
"let g:deoplete_disable_auto_complete=1
"call deoplete#custom#buffer_option('auto_complete', v:false)
"
"if !exists('g:deoplete#sources#omni#input_patterns')
"  let g:deoplete#sources#omni#input_patterns = {}
"endif
"let g:deoplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:deoplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"
"" set sources
"let g:deoplete#sources = {}
"let g:deoplete#sources.cpp = ['LanguageClient']
"let g:deoplete#sources.python = ['LanguageClient']
"let g:deoplete#sources.python3 = ['LanguageClient']
"let g:deoplete#sources.rust = ['LanguageClient']
"let g:deoplete#sources.c = ['LanguageClient']
"let g:deoplete#sources.vim = ['vim']

" -----------------------------------------------------------------------------
" vim-airline
" -----------------------------------------------------------------------------
" 256色モード(iTerm2+PowerLineの表示には必要)
set t_Co=256

" airline設定
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_powerline_fonts = 1
" ヘッダステータスのファイル名のみを表示する
let g:airline#extensions#tabline#fnamemod = ':t'
" ファイル名のみを表示する
let g:airline_section_c = '%t'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" -----------------------------------------------------------------------------
" tmuxline
" -----------------------------------------------------------------------------
let g:tmuxline_preset = {
  \'a'    : '#S',
  \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
  \'win'  : ['#I', '#W'],
  \'cwin' : ['#I', '#W', '#F'],
  \'x'    : '#(date)',
  \'y'    : ['%R', '%a', '%Y'],
  \'z'    : '#H'}
let g:tmuxline_theme = 'solarized'
let g:tmuxline_solarized_bg='dark'

" -----------------------------------------------------------------------------
"  denite.vim
" -----------------------------------------------------------------------------
" インサートモードで開始する
let g:denite_enable_start_insert=1
let g:denite_source_rec_min_cache_files=100
let g:denite_source_rec_max_cache_files=100000
let g:denite_source_file_mru_limit=10000
let g:denite_enable_ignore_case=1
" Unite Grep the silver searcher
let g:denite_source_grep_command = 'ag'
let g:denite_source_grep_default_opts = '--nocolor --nogroup'
let g:denite_source_grep_recursive_opt = ''
let g:denite_source_grep_max_candidates = 200

" プロンプトの左端に表示される文字を指定
call denite#custom#option('default', 'prompt', '>')
" deniteの起動位置をtopに変更
call denite#custom#option('default', 'direction', 'top')

" バッファ一覧
noremap <C-U><C-B> :Denite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :Denite buffer file<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Denite buffer file_mru<CR>
" カレントディレクトリ
noremap <C-U><C-C> :Denite file_rec<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Denite register<CR>
" 再帰的にプロジェクトディレクトリを更新
noremap <C-U><C-A> :Denite file_rec<CR>
" 再帰的にプロジェクトディレクトリを更新
noremap <C-U><C-G> :Denite grep<CR>

" アウトライン
" noremap <C-U><C-O> :Denite -vertical -no-quit outline<CR>
" ESCキーを2回押すと終了する
au FileType denite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType denite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"C-n,C-pで上下移動
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

" jjでnormalモードに
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')

" C-vでvsplit
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>', 'noremap')

call denite#custom#map('normal', 'v', '<denite:do_action:tabopen>', 'noremap')

"grepでagを使用するように設定
call denite#custom#var('grep', 'command', ['ag'])

"カレントディレクトリ内の検索もagを使用する
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

"その他のgrepの設定
call denite#custom#var('grep', 'default_opts',['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" -----------------------------------------------------------------------------
"  vim-ref
" -----------------------------------------------------------------------------
let g:ref_phpmanual_path = $DOTVIM . '/docs/phpmanual'
nnoremap <silent> <space>refp :Unite ref/phpmanual<CR>
nnoremap <silent> <space>refe :Unite ref/refe<CR>
nnoremap <silent> <space>refr :Unite ref/ri<CR>

" Ruby
let g:ref_use_vimproc=1
let g:ref_refe_version=2
let g:ref_refe_encoding='utf-8'

" -----------------------------------------------------------------------------
"  denite-gtags.vim
" -----------------------------------------------------------------------------
" grep設定用
nmap <C-G><C-G> :Denite -buffer-name=gtags_grep gtags_grep<CR>
" 使用箇所-定義箇所を移動
nmap <C-G><C-D> :DeniteCursorWord gtags_def<CR>
" 定義箇所-使用箇所を移動
nmap <C-G><C-I> :DeniteCursorWord gtags_ref<CR>

" -----------------------------------------------------------------------------
"  gen-gtags.vim
" -----------------------------------------------------------------------------
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1

" -----------------------------------------------------------------------------
"  uniteの色
" -----------------------------------------------------------------------------
highlight PmenuSel ctermbg=0 ctermfg=208

" -----------------------------------------------------------------------------
"  MultipleSearch
" -----------------------------------------------------------------------------
nnoremap * :Search <C-R><C-W><CR>
nnoremap + :SearchReset<CR>
let g:MultipleSearchMaxColors = 4

" -----------------------------------------------------------------------------
"  Denite Rails
" -----------------------------------------------------------------------------
nnoremap <silent> <space>ur :Denite rails
nnoremap <silent> <space>rc :Denite rails:controller<CR>
nnoremap <silent> <space>ro :Denite rails:config<CR>
nnoremap <silent> <space>rm :Denite rails:model<CR>
nnoremap <silent> <space>rv :Denite rails:view<CR>
nnoremap <silent> <space>rr :Denite rails:route<CR>
nnoremap <silent> <space>rd :Denite rails:db<CR>
nnoremap <silent> <space>rh :Denite rails:helper<CR>

" ------------------------------------------------------------------
"  Clipboard
" ------------------------------------------------------------------
set clipboard=unnamed

" -----------------------------------------------------------------------------
"  Syntastic
" -----------------------------------------------------------------------------
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_ignore_errors=['trimming empty', 'missing </a> before <div>', 'discarding unexpected </a>']
let g:syntastic_html_validator_parser = 'html5'
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers = ['rubocop']

" -----------------------------------------------------------------------------
"  SmartyJump
" -----------------------------------------------------------------------------
nnoremap <silent> <space>i :call SmartyJump()<CR>

" -----------------------------------------------------------------------------
"  NERDTree
" -----------------------------------------------------------------------------
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <space>nt :NERDTreeToggle<CR>
nnoremap <silent> <space>nf :NERDTreeFind<CR>

" -----------------------------------------------------------------------------
"  Git
" -----------------------------------------------------------------------------
noremap <silent> <space>gs :Git<CR>
noremap <silent> <space>gb :Git blame<CR>
noremap <silent> <space>gd :Gvdiff<CR>
noremap <silent> <space>gr :GRemove<CR>
noremap <silent> <space>ggh :GitGutterLineHighlightsToggle<CR>

" -----------------------------------------------------------------------------
"  Align
" -----------------------------------------------------------------------------
nnoremap <silent> <space>a> :Align =><CR>
nnoremap <silent> <space>a= :Align =<CR>

" -----------------------------------------------------------------------------
"  Kwbd
" -----------------------------------------------------------------------------
nnoremap <silent> <space>kw :Kw<CR>

" -----------------------------------------------------------------------------
"  Buffer Only
" -----------------------------------------------------------------------------
nnoremap <silent> <space>bo :Bo<CR>

" java設定
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

" カラー設定
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" json整形
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.vue set filetype=javascript

let g:python_host_prog='~/.pyenv/versions/2.7.18/bin/python'
let g:python3_host_prog='~/.pyenv/versions/3.9.4/bin/python'
