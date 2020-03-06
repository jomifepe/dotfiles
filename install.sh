#!/bin/bash

SERVICES=(
	"lightdm" 
	"bluetooth"
)

function install_base_packages() {
	echo -e "\n\e[92mInstalling base packages...\e[39m"
	sudo pacman -S --noconfirm base-devel pkgfile binutils fakeroot git make
}

function install_yay() {
	echo -e "\n\e[92mInstalling Yay...\e[39m"
	[ -f "$(pwd)/_yay" ] && rm -rf _yay
	git clone https://aur.archlinux.org/yay.git _yay
	cd _yay && makepkg -si --noconfirm
	cd .. && rm -rf _yay
}

function install_packages() {
	echo -e "\n\e[92mInstalling needed packages...\e[39m"
	yay -S --needed --nocleanmenu --nodiffmenu --noeditmenu --noprovides --pacman 'pacman -S --noconfirm' `cat ./.install/packages`
}

function install_compositor() {
	echo -e "\n\e[92mInstalling compositor..\e[39m"
	# Installing the compton fork with kawase blur effect
	[ -f "$(pwd)/_compton" ] && rm -rf _compton
	git clone https://github.com/tryone144/compton.git _compton
	cd _compton && make && make docs && make install
	cd .. && rm -rf _compton
}

function link_config() {
	echo -e "\n\e[92mLinking configuration files...\e[39m"
	COMMAND='stow --adopt --target=$HOME -R `ls -d */`'
	eval "$COMMAND -nv"

	printf "\n\e[96mDo you want do perform this changes? (y/n): \e[39m"
	read CONFIRMATION

	if [ "${CONFIRMATION^^}" == "Y" ]; then
		eval "$COMMAND"
		printf "\e[92m✓ Done\n\e[39m"
	fi
}

function install_oh_my_zsh() {
	echo -e "\n\e[92mInstaling Oh My Zsh...\e[39m"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function enable_services() {
	echo -e "\n\e[92mEnabling services...\e[39m"
	for i in "${SERVICES[@]}"; do
		sudo systemctl enable "$i"
	done
}

function set_shell() {
	sudo chsh -s $(which zsh)
}

function configure_lightdm() {
	# activate the greeter
	echo -e "\n\e[92mConfiguring LightDM...\e[39m"
	sudo sed -i -i '/greeter-session/c\greeter-session=lightdm-gtk-greeter' /etc/lightdm/lightdm.conf
}

function _install() {
	install_base_packages && \
	install_yay && \
	install_packages && \
	install_compositor && \
	link_config && \
	configure_lightdm && \
	enable_services && \
	install_oh_my_zsh
}

function show_help() {
	echo -e "
Usage: $0 [OPTIONS]

Options:
  -b\tInstall base packages (required to install other packages)
  -y\tInstall Yay, which is used to install all the packages
  -p\tInstall needed packages
  -o\tInstall compositor
  -l\tLink config files (stow)
  -e\tEnable needed services

  If no option is specified, every step is executed (full install)
	"
}

while getopts ":bypoleh" opt; do
	case "$opt" in
		b)
			install_base_packages
			;;
		y)
			install_yay
			;;
		p)
			install_packages
			;;
		o)
			install_compositor
			;;
		l)
			link_config
			;;
		e)
			enable_services
			;;
		h)
			show_help
			;;
    esac
done
shift $((OPTIND-1))

(( $OPTIND == 1 )) && _install