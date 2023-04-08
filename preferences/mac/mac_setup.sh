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
# 「"Siriに頼む"を有効にする」のチェックを外す
defaults write com.apple.assistant.support "Assistant Enabled" 0

# ======================
# Bluetooth
# ======================
# 「メニューバーにBluetoothを表示」のチェックを入れる
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true

# ======================
# キーボード
# ======================
# 「キーのリピート」を最速にする
defaults write NSGlobalDomain KeyRepeat -int 2
# 「リピート入力認識までの時間」を最速にする
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# キーの長押しで連続入力できるようにする
defaults write -g ApplePressAndHoldEnabled -bool false
# ショートカット > 入力ソースの「前の入力ソースを選択」のチェックを外す
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 '<dict><key>enabled</key><false/></dict>'
# ショートカット > 入力ソースの「入力ソースの次のソースを選択」のチェックを外す
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 '<dict><key>enabled</key><false/></dict>'

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
# 「ドラッグを有効にする」にチェックを入れる
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" Dragging -bool true
defaults write "com.apple.AppleMultitouchTrackpad" Dragging -bool true
# 「3本指のドラッグ」に変更する
defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" TrackpadThreeFingerDrag -bool true
defaults write "com.apple.AppleMultitouchTrackpad" TrackpadThreeFingerDrag -bool true

# ======================
# サウンド
# ======================
# 「メニューバーに音量を表示」をONにする
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" 1

# ======================
# ネットワーク
# ======================
# 「メニューバーにVPNの状況を表示」をONにする
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.vpn" 1
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/VPN.menu"

# ======================
# Finder
# ======================
# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true
# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
# タブバーを表示
defaults write com.apple.finder ShowTabView -bool true
# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles YES
# 「すべてのファイル名拡張子を表示」にチェックを入れる
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# 「新規Finderウィンドウで次を表示」をユーザーフォルダにする
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget PfHm
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
# ホームディレクトリ内のLibraryディレクトリを非表示から表示に変更する
chflags nohidden ~/Library
# リストビューをデフォルトにする
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
# Cover Flow  : `Flwv`
defaults write com.apple.Finder FXPreferredViewStyle -string Nlsv
# タイトルバーに現在の位置をフルパスで表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# タグを非表示にする
defaults write com.apple.finder ShowRecentTags -bool false

# ======================
# 設定の反映（設定情報のキャッシュのクリア）
# ======================
killall Finder
killall Dock
killall SystemUIServer
