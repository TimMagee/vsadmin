#!/bin/bash
# make file for user switching


echo "#!/bin/sh" > /usr/bin/gdmflexiserver
echo "/usr/bin/dm-tool switch-to-greeter" >> /usr/bin/gdmflexiserver
chmod +x /usr/bin/gdmflexiserver

# sed -i 's/.*greeter-session\=.*/greeter-session=lightdm-gtk-greeter/g' /etc/lightdm/lightdm.conf
# sed -i 's/.*greeter-hide-users\=.*/greeter-hide-users=true/g' /etc/lightdm/lightdm.conf
# sed -i 's/.*allow-user-switching\=.*/allow-user-switching=true/g' /etc/lightdm/lightdm.conf

cp ./scripts/lightdm.conf /etc/lightdm/

# change default DM from mdm to lightdm
sed -i 's/mdm/lightdm/g' /etc/X11/default-display-manager

#      sleep, suspend, off
# xset dpms 600 1800 3600
setterm -blank 5
setterm -powerdown 60
cp ./scripts/sleep_settings.sh /etc/profile.d/

systemctl enable lightdm.service -f