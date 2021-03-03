" Leaderをスペースキーに設定
let mapleader = "\<Space>"

" jjでノーマルモードに戻る
inoremap <silent> jj <ESC>

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" セミコロンとコロンを入れ替える
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
