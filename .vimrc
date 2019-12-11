" encoding
set encoding=utf8
scriptencoding utf8
set fileencoding=utf-8
set termencoding=utf8
set fileencodings=utf-8,ucs-boms,euc-jp,ep932
set fileformats=unix,dos,mac
set ambiwidth=double
set nobomb
set t_Co=256

" file
" スワップファイルの作成先を変更
set noswapfile
" ビープ音を消す
set belloff=all

" clipboard
" ヤンクをクリップボードへ繋ぐ
set clipboard+=unnamed

" 見た目系
" タイトル系
set title
" 行番号を表示
set number
" 行数を相対表示
set relativenumber
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" 左右のカーソル移動で折り返し移動をできるようにする
set whichwrap=h,l,<,>,[,]
" シンタックスハイライトの有効化
syntax enable

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 検索系
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" 検索するときに大文字小文字を区別しない
set ignorecase
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" キーバインド
" jjでノーマルモードに戻る 
inoremap <silent> jj <ESC>
" 1 で行頭に移動
nnoremap 1 ^
" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

" 画面分割系
" 水平分割
nnoremap ss :<C-u>sp<CR><C-w>j
" 垂直分割
nnoremap sv :<C-u>vs<CR><C-w>l
" 左に移動
nnoremap sh <C-w>h
" 右に移動
nnoremap sl <C-w>l
" 上に移動
nnoremap sk <C-w>k
" 下に移動
nnoremap sj <C-w>j
" 次に移動
nnoremap sw <C-w>w
" ウィンドウを左に移動
nnoremap sH <C-w>H
" ウィンドウを右に移動
nnoremap sL <C-w>L
" ウィンドウを上に移動
nnoremap sK <C-w>K
" ウィンドウを下に移動
nnoremap sJ <C-w>J
" 画面リサイズ
let g:winresizer_start_key = 'sr'

" plugin manager ---------------------------------------------
if &compatible
  set nocompatible
endif

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')

" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" tomlセット
let s:toml_dir=expand('~/.dein/')
let s:toml=s:toml_dir . 'dein.toml'
let s:toml_lazy=s:toml_dir . 'dein-lazy.toml'

" プラグインのロード
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml)
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" インストールしていないプラグインがあればインストールを実行
if dein#check_install()
  call dein#install()
endif

" ------------------------------------------------------------

" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
