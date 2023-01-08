mkdir -p /tmp/tools
cd /tmp/tools

# curl & zsh ------------------------------------------------------

```bash
sudo apt install curl zsh git -y
```

## zsh ------------------------------------------------------
sh -c "$(echo y | curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "source \"\$HOME/.profile\"" | tee -a ~/.zshrc
