"set guifont=Essential\ PragmataPro\ for\ Powerline:h12
"set guifontwide=Ricty\ for\ Powerline:h14
"set guifont=Essential\ PragmataPro\ for\ Powerline:h12
"set lines=120
"set columns=430
"set guioptions-=T  " ツールバー隠す
"set guioptions-=r
"set guioptions-=R
"set guioptions-=l
"set guioptions-=L
"set background=dark
"set cmdheight=1
"colorscheme molokai
"set noundofile
" -----------------------------------------------------------------------------
"  初期化
" -----------------------------------------------------------------------------
"  自動コマンド
"autocmd!
"
"" vi 互換モードをオフ
"set nocompatible
"
"" ファイルタイプの自動検出
"filetype indent plugin on
"
"" -----------------------------------------------------------------------------
""  Syntax
"" -----------------------------------------------------------------------------
"syntax on
"let g:molokai_original=1
""set background=dark
"colorscheme solarized
"highlight Normal ctermbg=none
""let g:solarized_termcolors=256
"
"" -----------------------------------------------------------------------------
""  基本設定
"" -----------------------------------------------------------------------------
"" キーのリマップ
"nnoremap [ %
"
"" デフォルトをcommandモードに
"set noinsertmode
"
"" 行番号の表示
"" set number
"
"" エンコーディング設定
"set encoding=utf-8
"set termencoding=utf-8
"set fileencoding=utf-8
"set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
"
"" 基本のインデント設定(各拡張子毎の設定は別途)
""set expandtab
"set noet
"set shiftwidth=4
"set tabstop=4
"set softtabstop=4
"
"" バックアップファイル/スワップファイルを作成しない
"set nobackup
"set noswapfile
"
"" ステータスラインの表示
"set laststatus=2
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"
"" .vim ディレクトリの設定
"let $DOTVIM = expand('~/.vim')
"
"" コマンドライン補完をshellと同一にする
"set wildmode=list:longest
"
"" 検索をインクリメンタルサーチにする
"set incsearch
"
"" 検索ワードをハイライトする
"set hlsearch
"
"" カーソルラインをハイライトする
""set cursorline
"
"" バックスペースでインデント削除
"set backspace=indent,eol,start
"
"" 日本語のズレを無くす
"set ambiwidth=double
"
"" タブ、空白、改行の可視化
"set list
"set listchars=tab:>\ ,trail:_
"
"" 折り畳み設定
"set foldmethod=syntax
"let perl_fold=1
"set foldlevel=100
"
"set binary noeol
"
"" バッファを開いた時に、カレントディレクトリを自動で移動
"" autocmd BufEnter * execute ":lcd " . expand("%:p:h")
"
"" 環境に合わせてsourceするようにする(リポジトリには含めない)
"source ~/.vimrc.local
"
"" Escape を jj に設定
"inoremap <silent> jj <ESC>
"
"" -----------------------------------------------------------------------------
""  バッファ操作
"" -----------------------------------------------------------------------------
"nnoremap <C-n> :bnext<CR>
"nnoremap <C-p> :bprev<CR>
"
"" java設定
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
"let java_highlight_all=1
"let java_highlight_functions="style"
"let java_allow_cpp_keywords=1
"
"" カラー設定
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
"
"" json整形
"command! -nargs=? Jq call s:Jq(<f-args>)
"function! s:Jq(...)
"    if 0 == a:0
"        let l:arg = "."
"    else
"        let l:arg = a:1
"    endif
"    execute "%! jq \"" . l:arg . "\""
"endfunction
"
"autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
"
