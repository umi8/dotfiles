# ======================
# Dock
# ======================

# 「自動的に非表示」をオンにする
defaults write com.apple.dock autohide -bool true
# Dockの位置を左に移動する
defaults write com.apple.dock orientation -string "left"
# サイズを変更する
defaults write com.apple.dock tilesize -int 35
# Dock に標準で入っている全てのアプリを消す（Finder とごみ箱は消えない）
defaults write com.apple.dock persistent-apps -array
# 開いているアプリケーションのみをdockに表示
defaults write com.apple.dock static-only -bool true

# ======================
# 一般
# ======================
# 「外観モード」を「ダーク」にする
defaults write -g AppleInterfaceStyle -string "Dark"

# ======================
# 時計
# ======================
# 24時間表示にする
defaults write "com.apple.menuextra.clock" Show24Hour -bool true
# 秒を表示する
defaults write "com.apple.menuextra.clock" ShowSeconds -bool true
defaults write "com.apple.menuextra.clock" DateFormat -string "M\\U6708d\\U65e5(EEE)  H:mm:ss"

# 「最新の使用状況に基づいて操作スペースを自動的に並べ替える」のチェックを外す
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
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true

# VPN

# ======================
# キーボード
# ======================

# 「キーのリピート」を最速にする
defaults write NSGlobalDomain KeyRepeat -int 2
# 「リピート入力認識までの時間」を最速にする
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# 「Spotlight検索を表示」のショートカットを「⌘⇧スペース」に変更する
# 手動

# ======================
# トラックパッド
# ======================

# 「調べる＆データ検出」のチェックをオフにする
defaults write -g "com.apple.trackpad.forceClick" -bool false
# 「軌跡の速さ」を7にする
defaults write -g "com.apple.trackpad.scaling" -float 1.5
# 「フルスクリーンアプリケーション間をスワイプ」を「4本指」に変更する
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadThreeFingerDrag -int 1
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadThreeFingerDrag -int 1
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadThreeFingerHorizSwipeGesture -int 0
# 「Mission Control」を「4本指」に変更する
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadThreeFingerVertSwipeGesture -int 0
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadThreeFingerVertSwipeGesture -int 0

# ======================
# アクセシビリティ（トラックパッドオプション）
# ======================

# 「ドラッグを有効にする」にチェックを入れる（もしかしたら0にすべきかも）
defaults write "com.apple.AppleMultitouchTrackpad" Dragging -int 1
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" Dragging -int 1
# 「3本指のドラッグ」に変更する
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadThreeFingerDrag -int 1
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadThreeFingerDrag -int 1

# ======================
# Night Shift
# ======================

# 「スケジュール」をカスタムに変更する
# 開始時刻を「3:00」、終了時刻を「2:59」にする
# 手動

# ======================
# サウンド
# ======================

# 「メニューバーに音量を表示」をONにする
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true

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
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# ライブラリディレクトリを表示
chflags nohidden ~/Library
# リストビューをデフォルトにする
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"
# タイトルバーに現在の位置をフルパスで表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# 「タグ」のチェックを外す
# 「すべてのファイル名拡張子を表示」にチェックを入れる
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# ======================
# 設定の反映
# ======================
killall Finder
killall Dock
killall SystemUIServer
