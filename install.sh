./init/xcode.sh
./init/symbolic_link.sh
./init/completion.sh
./init/vim.sh
./init/anyenv.sh
./init/mac.sh
./init/fonts.sh
#./init/homebrew.sh

export PATH=$HOME/dotfiles/bin:$PATH

echo "Initial setup is completed."

read -rp "Do you want to reboot the system now? (Y/N)" choice
if [[ $choice =~ ^[Yy]$ ]]; then
  echo "The system will be rebooted."
  sudo shutdown -r now
else
  echo "Please reboot the system later."
fi
