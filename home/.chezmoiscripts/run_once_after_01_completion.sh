#!/bin/bash -eu

target_dir="/usr/local/share/zsh/site-functions"
if [ -d "$target_dir" ]; then
  chmod 755 "$target_dir"
  chmod 755 /usr/local/share/zsh
  chmod 755 /usr/local/share
else
  echo "$target_dir not found, skipping (Intel-only path)."
fi
