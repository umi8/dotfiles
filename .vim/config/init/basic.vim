" ============================================
" システム系
" ============================================
" ビープ音を消す
set belloff=all
" ヤンクをクリップボードへ繋ぐ
set clipboard+=unnamed

" ============================================
" 見た目系
" ============================================
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
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 左右のカーソル移動で折り返し移動をできるようにする
set whichwrap=h,l,<,>,[,]
" シンタックスハイライトの有効化
syntax enable
set background=dark
" 現在のモードを表示
set showmode

" ============================================
" 検索系
" ============================================
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" 検索するときに大文字小文字を区別しない
set ignorecase
" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" ============================================
" タブ系
" ============================================
" タブをスペース4文字分にする
set expandtab
set tabstop=4
set shiftwidth=4

