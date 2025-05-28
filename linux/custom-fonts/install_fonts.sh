#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../util-scripts/logging.sh"

if [ -z "$USER_FONTS_DIRECTORY" ]; then
    USER_FONTS_DIRECTORY="$HOME/.local/share/fonts/"
fi

# Create the cache directory if it doesn't exist
mkdir -p "$USER_FONTS_DIRECTORY" || exit 1

# Copy the fonts to the cache directory
info "copying fonts to $USER_FONTS_DIRECTORY..."

if [ ! -d "./fonts" ]; then
  warn "Error: ./fonts directory does not exist."
  exit 1
fi

cp -rpv ./fonts/**/*.ttf "$USER_FONTS_DIRECTORY"

# Rebuild the font cache
info "rebuilding font cache..."

# fc-cache -f -v

info "Done rebuilding cache"