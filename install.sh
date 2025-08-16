#!/bin/bash

if [ ! -d /home/$USER/ ]; then
	exit
fi

#update system

sudo pacman -Suy


#install dependence

DEPENDENCE="
git curl
"

sudo pacman -S $DEPENDENCE


#variabes

RAM= $(grep MemTotal /proc/meminfo | awk '{print $2}')

DESKTOP="
hyprland
"

PYTHON="
python 
"

TERMINAL="
qalc 
fzf
"

TERMINALAPPS="
lazygit 
yazi 
w3m
"

APPS="
mpv 
kitty 
fuzzel
firefox-developer-edition
"

OTHER="

"

FISH="
fish fisher
"

FISHPLUGINS="
catppuccin/fish
jethrokuan/z
PatrickF1/fzf.fish
jorgebucaran/replay.fish
jorgebucaran/nvm.fish
jorgebucaran/spark.fish
joseluisq/gitnow
jorgebucaran/autopair.fish
nickeb96/puffer-fish
"

FISHTHEME="Catppuccin Mocha"


#config files path

NVIMINIT="/home/$USER/.config/nvim/init.lua"

NVIMLAZY=""

NVIMPLUGINS=""

NVIMPLUGINSOPTIONS=""

NVIMOPTIONS=""

NVIMKEYMAP=""


#install yay

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd ~/yay
makepkg -si


#NVIM

sudo pacman -S nvim
mkdir /home/$USER/.config/nvim
mkdir /home/$USER/.config/nvim/config
cat $NVIMINIT > /home/$USER/.config/nvim/init.lua
cat $NVIMOPTIONS > /home/$USER/.config/nvim/config/options.lua
cat $NVIMKEYMAP > /home/$USER/.config/nvim/config/ketmap.lua

#nvim plaugins manager

cat $NVIMLAZY > /home/$USER/.config/nvim/config/lazy.lua
cat $NVIMPLUGINS > /home/$USER/.config/nvim/config/plugins.lua

if [$RAM -ge 2097152]; then 
  cat $NVIMPLUGINSOPTIONS | | sed "s/memory_change_agresive_lsp/aggressive_mode = false" > ~/.config/nvim/config/pluginsoptions.lua
else
  cat $NVIMPLUGINSOPTIONS | | sed "s/memory_change_agresive_lsp/aggressive_mode = true" > ~/.config/nvim/config/pluginsoptions.lua
fi


#install outher pkg

sudo pacman -S $DESKTOP $PYTHON $TERMINAL $TERMINALAPPS $APPS $OTHER $FISH

fish -c fisher install $FISHPLUGINS



fish -c fish_config theme save $FISHTHEME
