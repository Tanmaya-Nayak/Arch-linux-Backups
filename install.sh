#!/bin/bash
set -e
DOTFILES="$(cd "$(dirname "$0")" && pwd)"
echo "Installing dotfiles from $DOTFILES..."

# Helper: remove existing and create symlink
link() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  [ -e "$dst" ] && [ ! -L "$dst" ] && mv "$dst" "$dst.bak.$(date +%s)" && echo "  backed up: $dst"
  [ -L "$dst" ] && rm "$dst"
  ln -s "$src" "$dst"
}

# ── Configs ──────────────────────────────────────────────────
link "$DOTFILES/hypr" ~/.config/hypr
echo "✓ hypr"

link "$DOTFILES/waybar" ~/.config/waybar
echo "✓ waybar"

link "$DOTFILES/rofi" ~/.config/rofi
echo "✓ rofi"

link "$DOTFILES/kitty" ~/.config/kitty
echo "✓ kitty"

link "$DOTFILES/nvim" ~/.config/nvim
echo "✓ nvim"

link "$DOTFILES/mako" ~/.config/mako
echo "✓ mako"

link "$DOTFILES/btop" ~/.config/btop
echo "✓ btop"

link "$DOTFILES/ttyper" ~/.config/ttyper
echo "✓ ttyper"

link "$DOTFILES/fastfetch" ~/.config/fastfetch
echo "✓ fastfetch"

link "$DOTFILES/yazi" ~/.config/yazi
echo "✓ yazi"

link "$DOTFILES/cava" ~/.config/cava
echo "✓ cava"

link "$DOTFILES/lazygit" ~/.config/lazygit
echo "✓ lazygit"

link "$DOTFILES/peaclock/config" ~/.peaclock/config
echo "✓ peaclock"

link "$DOTFILES/gtk-3.0" ~/.config/gtk-3.0
echo "✓ gtk-3.0"

link "$DOTFILES/zshrc" ~/.zshrc
# [ -f "$DOTFILES/.p10k.zsh" ] && link "$DOTFILES/.p10k.zsh" ~/.p10k.zsh
link "$DOTFILES/starship/starship.toml" ~/.config/starship.toml
echo "✓ zsh"

# ── Zsh plugins ───────────────────────────────────────────────
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
echo "✓ zsh plugins"

# ── SDDM ─────────────────────────────────────────────────────
sudo mkdir -p /etc/sddm.conf.d
sudo cp "$DOTFILES/sddm.conf" /etc/sddm.conf.d/sddm.conf
echo "✓ sddm"

# ── Cargo packages ────────────────────────────────────────────
if command -v cargo &>/dev/null; then
  cargo install ttyper
  echo "✓ ttyper installed"
else
  echo "⚠ cargo not found, skipping ttyper install"
fi

echo ""
echo "✅ Done! All configs symlinked."
echo "Reboot or restart Hyprland to apply changes."
echo "Neovim plugins will auto-install on first launch."
