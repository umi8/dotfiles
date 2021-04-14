# ======================
# Dock
# ======================

# 「自動的に非表示」をオンにする
defaults write com.apple.dock autohide -bool true
# Dockの位置を左に移動する
defaults write com.apple.dock orientation -string "left"
# サイズを変更する
defaults write com.apple.dock tilesize -int 35

# ======================
# 一般
# ======================
# 「外観モード」を「ダーク」にする
defaults write -g AppleInterfaceStyle -string "Dark"

# ======================
# Mission Control
# ======================
# 「最新の使用状況に基づいて操作スペースを自動的に並べ替える」のチェックを外す
defaults write com.apple.dock mru-spaces -bool false

# ======================
# Siri
# ======================
# 「メニューバーにSiriを表示」のチェックを外す
defaults write com.apple.systemuiserver "NSStatusItem Visible Siri" -bool false

# ======================
# Bluetooth
# ======================
# 「メニューバーにBluetoothを表示」のチェックを入れる

# ======================
# キーボード
# ======================

# 「キーのリピート」を最速にする
# 「リピート入力認識までの時間」を最速にする
# 「Spotlight検索を表示」のショートカットを「⌘⇧スペース」に変更する

# ======================
# トラックパッド
# ======================

# 「調べる＆データ検出」のチェックを外
# 「軌跡の速さ」を7にする
# 「フルスクリーンアプリケーション間をスワイプ」を「4本指」に変更する
# 「Mission Control」を「4本指」に変更する

# ======================
# アクセシビリティ（トラックパッドオプション）
# ======================

# 「ドラッグを有効にする」にチェックを入れる
# 「3本指のドラッグ」に変更する

# ======================
# Night Shift
# ======================

# 「スケジュール」をカスタムに変更する
# 開始時刻を「3:00」、終了時刻を「2:59」にする

# ======================
# サウンド
# ======================

# 「メニューバーに音量を表示」にチェックを入れ

# ======================
# Finder
# ======================
# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true
# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
# タブバーを表示
defaults write com.apple.finder ShowTabView -bool true
# 不可視ファイルを表示
defaults write com.apple.finder AppleShowAllFiles YES
# 「新規Finderウィンドウで次を表示」をユーザーフォルダにする
# 「タグ」のチェックを外す
# 「すべてのファイル名拡張子を表示」にチェックを入れる

# Dockの設定変更を反映する
killall Dock

defaults read > defaults_bef.txt
defaults -currentHost read > defaults_currentHost_bef.txt

defaults read > defaults_aft.txt
defaults -currentHost read > defaults_currentHost_aft.txt

diff defaults_bef.txt defaults_aft.txt
diff defaults_currentHost_bef.txt defaults_currentHost_aft.txt