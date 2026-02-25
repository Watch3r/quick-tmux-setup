#!/bin/bash
echo "🐧 Starting Linux tmux setup..."

# 1. Install tmux using apt
echo "📦 Installing tmux..."
sudo apt update && sudo apt install -y tmux curl

# 2. Download configurations directly from your GitHub
echo "📥 Downloading config files from GitHub..."
curl -sSL "https://raw.githubusercontent.com/Watch3r/quick-tmux-setup/refs/heads/main/.tmux.conf" -o ~/.tmux.conf
curl -sSL "https://raw.githubusercontent.com/Watch3r/quick-tmux-setup/refs/heads/main/quick-help" -o ~/.tmux_quick_help

# 3. Add the alias to Bash
if ! grep -q "alias tmuxhelp=" ~/.bashrc; then
    echo "alias tmuxhelp='cat ~/.tmux_quick_help'" >> ~/.bashrc
    echo "✅ Alias added to ~/.bashrc. Run 'source ~/.bashrc' or restart terminal to apply."
else
    echo "⚡ Alias already exists in ~/.bashrc."
fi

echo "✅ Linux setup complete! Type 'tmux' to start."
