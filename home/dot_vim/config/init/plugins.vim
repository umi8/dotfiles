
" ==================== "
" Plugin "
" ==================== "
" If adding plugins, Reload .vimrc and :PlugInstall to install plugins.
" If removing plugins, Reload .vimrc and :PlugClean to remove plugins.
call plug#begin('~/.vim/plugged')

" ファイル操作の利便性向上
Plug 'Shougo/unite.vim'

" 視認性の高いディレクトリツリーの表示
Plug 'scrooloose/nerdtree'

" status/tablineの機能強化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" %による移動を強化
Plug 'andymass/vim-matchup'

" fの移動を強化
Plug 'unblevable/quick-scope'

" 囲む操作を楽にする
Plug 'tpope/vim-surround'

call plug#end()
