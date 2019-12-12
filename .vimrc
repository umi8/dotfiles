" ==================== "
" Plugin "
" ==================== "
" If adding plugins, Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')

" ファイル操作の利便性向上
Plug 'Shougo/unite.vim'

" 視認性の高いディレクトリツリーの表示
Plug 'scrooloose/nerdtree'

" 分割したウィンドウのリサイズを容易に
Plug 'simeji/winresizer'

" %による移動を強化
Plug 'andymass/vim-matchup'

" StatusLineのカスタマイズ"
Plug 'itchyny/lightline.vim'

" fの移動を強化
Plug 'unblevable/quick-scope'

call plug#end()

" ==================== "
" encoding "
" ==================== "
set encoding=utf8
scriptencoding utf8
set fileencoding=utf-8
set termencoding=utf8
set fileencodings=utf-8,ucs-boms,euc-jp,ep932
set fileformats=unix,dos,mac
set ambiwidth=double
set nobomb
set t_Co=256

" ==================== "
" file "
" ==================== "
" Leaderをスペースキーに設定
let mapleader = "\<Space>"
" スワップファイルの作成先を変更
set noswapfile
" ビープ音を消す
set belloff=all
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

" ==================== "
" Unite.vim "
" ==================== "
" インサートモードで開始
let g:unite_enable_start_insert=1
" ヒストリー/ヤンク機能を有効化
let g:unite_source_history_yank_enable =1
" prefix keyの設定
nmap <Space>u [unite]

" prefixとcキーでカレントディレクトリを表示
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" prefixとfキーでバッファと最近開いたファイル一覧を表示
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>
" prefixとbキーでバッファを表示
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
" prefixとrキーでレジストリを表示
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
" prefixとtキーでタブを表示
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
" prefixとhキーでヒストリ/ヤンクを表示
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
" prefixとoキーでoutline
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
" prefixとENTERキーでfile_rec:!
nnoremap <silent> [unite]<CR> :<C-u>Unite<Space>file_rec:!<CR>
" unite.vimを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " ESCでuniteを終了
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction"}}}

" ==================== "
" NERDTREE "
" ==================== "
" LeaderとtキーでNERDTreeを開く
nnoremap <silent> <Leader>t :NERDTreeFind<CR>:vertical res 30<CR>

" ==================== "
" lightline.vim "
" ==================== "
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
