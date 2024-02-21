#Get updated
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

#Installs from Kubuntu repo
sudo apt install btop build-essential cpupower-gui corectrl dmidecode dolphin htop goverlay hardinfo inxi glmark2-x11 kate lm-sensors libvulkan1 mangohud mesa-vulkan-drivers nala psensor python3-xdg radeontop sysbench software-properties-common steam time timeshift tree unrar vlc vulkan-tools -y

#Downloads some of the apps I described, no installs
cd /home/$USER/Downloads/
wget https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v2.9.1/ProtonUp-Qt-2.9.1-x86_64.AppImage
wget https://github.com/vagnum08/cpupower-gui/releases/download/v1.0.0/cpupower-gui_1.0.0-1_all.deb
wget https://github.com/flightlessmango/MangoHud/releases/download/v0.7.1/MangoHud-0.7.1.tar.gz
wget https://github.com/benjamimgois/goverlay/releases/download/1.0/goverlay_1.tar.xz
wget https://tellusim.com/download/GravityMark_1.82.run
wget https://cdn.geekbench.com/Geekbench-6.2.2-Linux.tar.gz
wget https://assets.unigine.com/d/Unigine_Heaven-4.0.run

# awesome alias use gameon to set CPU and turn off Compositor and gameoff to return to defaults
# issues
echo "alias gameon='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor && cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ; echo && echo "CPU set to Performance"; echo && qdbus org.kde.KWin /Compositor suspend && qdbus org.kde.KWin /KWin supportInformation | grep 'Compositing is''" >> ~/.bashrc && source ~/.bashrc
echo "alias gameoff='echo schedutil | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor && cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ; echo && echo "CPU set to Schedutil"; echo && qdbus org.kde.KWin /Compositor resume && qdbus org.kde.KWin /KWin supportInformation | grep 'Compositing is''" >> ~/.bashrc && source ~/.bashrc

# extract files you just download and get permission to execute so ready to run
cd /home/$USER/Downloads/
tar -xf Geek*.gz
tar -xf Mango*.gz
tar -xf goverlay*.xz
chmod +x *.AppImage
chmod +x *.run

#Must decide if you want iperf daemon to autostart
sudo apt install iperf3 -y

#Just show you some info about your system
#echo ""
#cat /etc/os-release | grep PRETTY_NAME=
echo ""
neofetch
# kernel version
#uname -a
echo ""

# mesa version
glxinfo | grep Mesa
echo ""

#verify running kernel driver amdgpu
lspci -k | grep -EA3 'VGA|3D|Display'
echo ""

echo ""
#list of what was installed and version number
echo "Package and Version number of those just installed "
echo ""
apt-cache show cpupower-gui corectrl dmidecode dolphin htop goverlay hardinfo inxi iperf3 glmark2-x11 kate lm-sensors libvulkan1 mangohud mesa-vulkan-drivers nala psensor radeontop sysbench software-properties-common steam time timeshift tree vlc vulkan-tools | grep 'Package:\|Version'
echo ""
echo " Use gameon and gameoff "
#EOF
