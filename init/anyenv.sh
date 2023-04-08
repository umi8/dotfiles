#!/bin/bash -eu

if command -v anyenv >/dev/null 2>&1; then
  anyenv install --init
fi
