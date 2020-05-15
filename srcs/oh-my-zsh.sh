#!/bin/sh


echo "> Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" > /dev/null

echo "\t - installing zsh-completions..."
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
echo "\t - installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "\t - installing up..."
git clone https://github.com/peterhurford/up.zsh ~/.oh-my-zsh/custom/plugins/up
echo "\t - installing git-open..."
git clone https://github.com/paulirish/git-open.git ~/.oh-my-zsh/custom/plugins/git-open
echo "\t - installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
