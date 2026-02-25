#!/bin/bash
echo "🍎 Starting macOS tmux setup..."

# 1. Install tmux using Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew install tmux

# 2. Download configurations directly from your GitHub
echo "📥 Downloading config files from GitHub..."
curl -sSL "https://raw.githubusercontent.com/Watch3r/quick-tmux-setup/refs/heads/main/.tmux.conf" -o ~/.tmux.conf
curl -sSL "https://raw.githubusercontent.com/Watch3r/quick-tmux-setup/refs/heads/main/quick-help" -o ~/.tmux_quick_help

# 3. Add the alias to Zsh
if ! grep -q "alias tmuxhelp=" ~/.zshrc; then
    echo "alias tmuxhelp='cat ~/.tmux_quick_help'" >> ~/.zshrc
    echo "✅ Alias added to ~/.zshrc. Run 'source ~/.zshrc' or restart terminal to apply."
fi

echo "✅ Mac setup complete! Type 'tmux' to start."
