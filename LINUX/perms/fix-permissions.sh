#!/bin/bash
if [ "$EUID" -eq 0 ]; then
    echo "Error: Please run this script without sudo."
    exit 1
fi

current_user=$(whoami)

echo You are currently logged in as $current_user.

echo The script might ask for your sudo password in order to save the files.

echo -e "#!/bin/bash\n\nUSER=$current_user\n\necho \"Fixing permissions issue caused by Windows...\"\n\nsudo chown -R $USER:$USER /home/mitchell/.local/share/Steam/steamapps\nsudo chown -R $USER:$USER /run/media/mmcblk0p1" | sudo tee "/fix-permissions.sh" > /dev/null
sudo chmod +x "/fix-permissions.sh"
sudo wget "https://raw.githubusercontent.com/Creaous/Legion-Go-Resources/main/LINUX/perms/fix-permissions.service" -O "/etc/systemd/system/fix-permissions.service"
sudo systemctl enable --now fix-permissions
