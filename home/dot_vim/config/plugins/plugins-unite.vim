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
