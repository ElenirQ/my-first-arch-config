#!/bin/bash




DEPENDENCE="
git curl fzf
"

sudo pacman -S $DEPENDENCE


#variabes

DESKTOP="

"

PYTHON="

"

TERMINAL="
q
"

TERMINALAPPS="

"

APPS="

"

OTHER="

"

FISH="
fish fisher
"

FISHPLUGINS="catppuccin/fish jethrokuan/z PatrickF1/fzf.fish jorgebucaran/replay.fish jorgebucaran/nvm.fish jorgebucaran/spark.fish joseluisq/gitnow jorgebucaran/autopair.fish nickeb96/puffer-fish"

FISHTHEME="Catppuccin Mocha"
#fish

sudo pacman $FISH

fisher install $FISHPLUGINS

fish_config theme save $FISHTHEME
#config files

NVIMINIT=""

NVIMLAZY=""

NVIMPLUGINS=""

NVIMPLUGINSOPTIONS=""

NVIMOPTIONS=""

NVIMKEYMAP="wdwd"

#update system

sudo pacman -Suy


#install yay

#sudo pacman -S --needed git base-devel
#git clone https://aur.archlinux.org/yay.git
#cd ~/yay
#makepkg -si


#NVIM

sudo pacman -S nvim
mkdir ~/.config/nvim
echo -e "$NVIMINIT" > ~/.config/nvim/init.lua
mkdir ~/.config/nvim/config
echo -e "$NVIMOPTIONS" > ~/.config/nvim/config/options.lua
echo -e "$NVIMKEYMAP" > ~/.config/nvim/config/ketmap.lua

#nvim plaugins manager

echo -e "$NVIMLAZY" > ~/.config/nvim/config/lazy.lua
echo -e "$NVIMPLUGINS" > ~/.config/nvim/config/plugins.lua
echo -e "$NVIMPLUGINSOPTIONS" > ~/.config/nvim/config/pluginsoptions.lua



#install outher pkg

sudo pacman -S $DESKTOP $PYTHON $TERMINAL $TERMINALAPPS $APPS $OTHER


