#/bin/bash
# install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
FONT=${FONT:-DroidSansMono}
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/$FONT.zip"
wget -P /tmp/ $URL 
unzip /tmp/$FONT.zip -d ~/.fonts
fc-cache -fv
echo "done!"
